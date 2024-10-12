#!/bin/bash

PGPASSWORD=y psql -hlocalhost -p6544 -Upostgres postgres -f ./reset-database-and-user.sql

PGPASSWORD=y psql -hlocalhost -p6544 -Upostgres supermarche -f ./populate-database.sql

PGPASSWORD=y psql -hlocalhost -p6544 -Upostgres supermarche -f ./with-plain-postgresql.sql

echo "User postgres - Select test data"
PGPASSWORD=y psql -hlocalhost -p6544 -Upostgres supermarche -f ./test-plain-postgresql.sql

echo "User metabase - Select test data"
PGPASSWORD=metabase_ro_password psql -hlocalhost -p6544 -Umetabase_ro_user supermarche -f ./test-plain-postgresql.sql