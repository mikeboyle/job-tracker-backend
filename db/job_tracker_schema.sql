DROP VIEW IF EXISTS applications_joined;
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

CREATE TABLE jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  company_id uuid,
  url text,
  description text,
  posted_date timestamptz,
  deadline timestamptz,
  created_at timestamptz,
  updated_at timestamptz,
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
  created_at timestamptz,
  updated_at timestamptz
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
  date_applied timestamptz,
  created_at timestamptz,
  updated_at timestamptz
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
  created_at timestamptz,
  updated_at timestamptz
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

--VIEWS
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
