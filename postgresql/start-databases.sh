docker run --platform linux/amd64 -d -e POSTGRES_PASSWORD=x -p 6543:5432 registry.gitlab.com/dalibo/postgresql_anonymizer:stable

docker run --platform linux/amd64 -d -e POSTGRES_PASSWORD=y -p 6544:5432 postgres