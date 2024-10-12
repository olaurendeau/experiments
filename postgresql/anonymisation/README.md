# Anonymisation with PostgreSQL

## Context

Protect Personally Identifiable Information from database users that do not require to access them (Developers access, stats tools, ...)

## Evaluated solutions

### Anonymizer Extension

This [anonymization extension](https://postgresql-anonymizer.readthedocs.io/en/latest/) does just that, but it's currently not available on Scalingo & Scaleway managed databases.

```
# start a postgres container on docker with anon extension enabled
../start-databases.sh

# test the masking features of the extension
./with-anon-extension.sh
```

### Plain PostgreSQL

PostgreSQL views

```
# start a postgres container on docker with anon extension enabled
../start-databases.sh

# test masking columns with hand made views
./with-plain-postgresql.sh
```

## Synthesis

|Feature|Anonymizer Extension|Plain PostgreSQL|
| - | - | -|
| Protect PII values | ✅ Yes, with a wide range of built-in options | ✅ Yes, but require to define replacements |
| Perform DDL on protected columns | ✅ Simple thanks to the stop / start helper function | ❌ Require to drop and recreate the views |
| User management | ✅ Simple, masked users may have select access to all tables by default | ❌ No factorisation, each user must be granted specific access to each tables  |
| Objects names | ✅ Tables and column keep the same names | ❌ Different names |
| Performance | ❌ With dynamic masking querying may be twice slower | ❌ Same problem |