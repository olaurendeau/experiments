#!/bin/bash

PGPASSWORD=x psql -hlocalhost -p6543 -Upostgres postgres -f ./reset-database-and-user.sql

PGPASSWORD=x psql -hlocalhost -p6543 -Upostgres supermarche -f ./populate-database.sql

PGPASSWORD=x psql -hlocalhost -p6543 -Upostgres supermarche -f ./with-anon-extension.sql

echo "User postgres - Select test data"
PGPASSWORD=x psql -hlocalhost -p6543 -Upostgres supermarche -f ./test-anon-extension.sql

echo "User metabase - Select test data"
PGPASSWORD=metabase_ro_password psql -hlocalhost -p6543 -Umetabase_ro_user supermarche -f ./test-anon-extension.sql