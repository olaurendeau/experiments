-- Initialize anon extension
SELECT anon.init();
SELECT anon.start_dynamic_masking();

-- Allow only select to metabase user and apply masks on him
ALTER DEFAULT PRIVILEGES IN SCHEMA public
   GRANT SELECT ON TABLES TO metabase_ro_user;

SECURITY LABEL FOR anon ON ROLE metabase_ro_user IS 'MASKED';

--- Masking columns
SECURITY LABEL FOR anon ON COLUMN clients.last_name
  IS 'MASKED WITH FUNCTION anon.fake_last_name()';
SECURITY LABEL FOR anon ON COLUMN clients.first_name
  IS 'MASKED WITH FUNCTION anon.fake_first_name()';
SECURITY LABEL FOR anon ON COLUMN clients.email
  IS 'MASKED WITH FUNCTION anon.hash(email)';
SECURITY LABEL FOR anon ON COLUMN clients.phone
  IS 'MASKED WITH VALUE ''CONFIDENTIAL PHONE'' ';
 
