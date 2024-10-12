DROP DATABASE IF EXISTS supermarche;
CREATE DATABASE supermarche;

drop owned by metabase_ro_user;
drop user metabase_ro_user;

CREATE USER metabase_ro_user with encrypted password 'metabase_ro_password';;
GRANT CONNECT ON DATABASE supermarche TO metabase_ro_user;
