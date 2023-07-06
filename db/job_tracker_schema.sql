--drop triggers and views
DROP TRIGGER IF EXISTS set_ts_jobs ON jobs;
DROP TRIGGER IF EXISTS set_ts_job_notes ON job_notes;
DROP TRIGGER IF EXISTS set_ts_applications ON applications;
DROP TRIGGER IF EXISTS set_ts_application_notes ON application_notes;
DROP VIEW IF EXISTS applications_joined;

--drop tables
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

CREATE TABLE applications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id uuid,
  user_id uuid,
  application_status_id uuid,
  date_applied timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE application_statuses (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  status varchar(255)
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

ALTER TABLE applications ADD FOREIGN KEY (job_id) REFERENCES jobs (id);
ALTER TABLE applications ADD FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE applications ADD FOREIGN KEY (application_status_id) REFERENCES application_statuses (id);

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
--DO NOT do insert operations on a view
CREATE VIEW applications_joined AS
SELECT applications.*,
	   users.email AS user_email,
	   jobs.description AS job_description,
	   companys.name AS company_name,
     companys.id AS company_id,
	   application_statuses.status AS application_status
FROM applications
JOIN jobs
ON applications.job_id = jobs.id
JOIN companys
ON jobs.company_id = companys.id
JOIN application_statuses
ON applications.application_status_id = application_statuses.id
JOIN users
ON applications.user_id = users.id;
