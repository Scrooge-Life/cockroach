FROM cockroachdb/cockroach:v22.1.8

ADD start.sh /cockroach/

ENTRYPOINT ["/cockroach/start.sh"]
