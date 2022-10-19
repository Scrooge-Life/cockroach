# Cockroach

Docker files for getting cockroach up and running in Fly.io.

Code was shamelessly stolen from the fly-apps repository and an unmerged PR:

- <https://github.com/fly-apps/cockroachdb>
- <https://github.com/fly-apps/cockroachdb/pull/1>

## Updating

This repository has built in GitHub actions for deployments. This combined with Fly's awesome rolling deployments you should be safe for any updates. Simply make changes, make a PR, then merge into `main`. This will trigger a GitHub Action that (once approved) will build the docker image, push it to the image repository, and trigger a Fly.io deployment.

## GitHub Actions

This docker image is used in production _and in GitHub actions_ for testing. Here is a short snippet of how that works:

```yaml
jobs:
  test:
    runs-on: ubuntu-latest

    services:
      cockroach:
        image: ghcr.io/scrooge-life/cockroach:latest
        ports:
          - 26257:26257
          - 8080:8080
```

## Grafana

This example exports metrics for [Fly.io to scrape](https://fly.io/blog/hooking-up-fly-metrics/). You can import [CockroachDB's Grafana dashboards](https://github.com/cockroachdb/cockroach/tree/master/monitoring/grafana-dashboards) to see how your cluster is doing.
