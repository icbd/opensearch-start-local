## Postgresql and pgadmin4

Default URL: `postgresql://postgres:changeme@localhost`

pgAdmin 4 Dashboard: [http://localhost:5050/browser/](http://localhost:5050/browser/)

## QDrant

QDrant Dashboard: [http://localhost:6333/dashboard#/collections](http://localhost:6333/dashboard#/collections)

## OpenSearch and OpenSearch Dashboard

with plugins: ik-smartcn-kuromoji-icu-sudachi-repos3-stconvert

```shell
cp .env.example .env

echo "Edit .env file"

source .env

docker build -t "${OPENSEARCH_IMAGE}:${OPENSEARCH_VERSION}" ./opensearch
```

OpenSearch Dashboard Dev Tools: [http://localhost:5601/app/dev_tools#/console](http://localhost:5601/app/dev_tools#/console)


## How to use

```shell
docker-compose up -d
docker-compose stop
```
