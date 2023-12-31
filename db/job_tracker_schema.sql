--drop triggers and views
DROP TRIGGER IF EXISTS set_ts_jobs ON jobs;
DROP TRIGGER IF EXISTS set_ts_job_notes ON job_notes;
DROP TRIGGER IF EXISTS set_ts_applications ON applications;
DROP TRIGGER IF EXISTS set_ts_application_notes ON application_notes;
DROP VIEW IF EXISTS applications_joined;
DROP VIEW IF EXISTS jobs_joined;

--drop tables
DROP TABLE IF EXISTS application_status_changes;
DROP TABLE IF EXISTS application_notes;
DROP TABLE IF EXISTS applications;
DROP TABLE IF EXISTS job_notes;
DROP TABLE IF EXISTS job_locations;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS application_statuses;
DROP TABLE IF EXISTS job_statuses;
DROP TABLE IF EXISTS users_roles;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS companys;

--create tables
CREATE TABLE jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id uuid,
  url text,
  description text,
  author_id uuid, -- the user who posted the job
  posted_date timestamptz NOT NULL DEFAULT now(),
  deadline timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  job_status_id uuid
);

CREATE TABLE job_statuses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  status varchar(255)
);

CREATE TABLE locations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name varchar(255)
);

CREATE TABLE job_locations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  location_id uuid,
  job_id uuid
);

CREATE TABLE job_notes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid,
  user_id uuid,
  text text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE companys (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name varchar(255)
);

--an application to a job, submitted by a specific user
CREATE TABLE applications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid,
  user_id uuid,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

--a set of possible states an application can be in,
--ex: not started, submitted, got offer, rejected, etc.
CREATE TABLE application_statuses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  status varchar(255)
);

--Each row in this table represents a transition of
--a specific application from one status to a new status.
--We can query this table for an application's current status
--(the most recent created_at timestamp) or a history of the
--stages and changes the application went through
CREATE TABLE application_status_changes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  application_id uuid REFERENCES applications(id),
  old_status_id uuid, --can be null
  new_status_id uuid NOT NULL, --cannot be null
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE application_notes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid,
  application_id uuid,
  text text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email varchar(255)
);

CREATE TABLE roles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  type varchar(255)
);

CREATE TABLE users_roles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid,
  role_id uuid
);

--foreign keys
ALTER TABLE jobs ADD FOREIGN KEY (company_id) REFERENCES companys (id);
ALTER TABLE jobs ADD FOREIGN KEY (job_status_id) REFERENCES job_statuses (id);
ALTER TABLE jobs ADD FOREIGN KEY (author_id) REFERENCES users (id);

ALTER TABLE applications ADD FOREIGN KEY (job_id) REFERENCES jobs (id);
ALTER TABLE applications ADD FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE application_status_changes ADD FOREIGN KEY (application_id) REFERENCES applications(id);
ALTER TABLE application_status_changes ADD FOREIGN KEY (old_status_id) REFERENCES application_statuses(id); --can be null
ALTER TABLE application_status_changes ADD FOREIGN KEY (new_status_id) REFERENCES application_statuses(id); --cannot be null

ALTER TABLE job_notes ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE job_notes ADD FOREIGN KEY (job_id) REFERENCES jobs (id);

ALTER TABLE application_notes ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE application_notes ADD FOREIGN KEY (application_id) REFERENCES applications (id);

ALTER TABLE job_locations ADD FOREIGN KEY (location_id) REFERENCES locations (id);
ALTER TABLE job_locations ADD FOREIGN KEY (job_id) REFERENCES jobs (id);

ALTER TABLE users_roles ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE users_roles ADD FOREIGN KEY (role_id) REFERENCES roles (id);

--TRIGGERS to set updated_at timestamps
--Source: https://x-team.com/blog/automatic-timestamps-with-postgresql/
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER set_ts_jobs
BEFORE UPDATE ON jobs
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

CREATE TRIGGER set_ts_job_notes
BEFORE UPDATE ON job_notes
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

CREATE TRIGGER set_ts_applications
BEFORE UPDATE ON applications
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

CREATE TRIGGER set_ts_application_notes
BEFORE UPDATE ON application_notes
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

--VIEWS to simplify querying
--SELECT FROM <view name> will call the view's SQL
--DO NOT do insert, update, etc. operations on a view

--applications joined: gets info about an application, including
--info joined from other tables: company name/id, user email, job description,
--and the current application status
CREATE VIEW applications_joined AS
SELECT applications.*,
  companys.id AS company_id,
  users.email AS user_email,
  jobs.description AS job_description,
  companys.name AS company_name,
  application_statuses.status AS application_status,
  last_status_changes.created_at AS status_updated_at
FROM applications
JOIN jobs
ON applications.job_id = jobs.id
JOIN companys
ON jobs.company_id = companys.id
JOIN (
	--subquery that grabs the most recent status change for each application
	--source: https://stackoverflow.com/a/14841015/4595654
	SELECT t1.*
	FROM application_status_changes t1
	LEFT JOIN application_status_changes t2
	ON (t1.application_id = t2.application_id AND t1.created_at < t2.created_at)
	WHERE t2.created_at IS NULL
	ORDER BY t1.id
	) AS last_status_changes
ON last_status_changes.application_id = applications.id
JOIN application_statuses
ON last_status_changes.new_status_id = application_statuses.id
JOIN users
ON applications.user_id = users.id
GROUP BY applications.id, 
		 users.email, 
		 jobs.description, 
		 companys.name, 
		 companys.id,
		 application_statuses.status,
		 last_status_changes.created_at;

CREATE VIEW jobs_joined AS
SELECT jobs.*,
	   companys.name AS company_name,
	   array_agg(locations.name) AS locations,
     users.email AS author_email
FROM jobs
JOIN companys
ON jobs.company_id = companys.id
JOIN job_locations
ON jobs.id = job_locations.job_id
JOIN locations
ON job_locations.location_id = locations.id
JOIN users
ON jobs.author_id = users.id
GROUP BY jobs.id, companys.name, users.email;
