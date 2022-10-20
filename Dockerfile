FROM cockroachdb/cockroach:v22.1.9

ADD start.sh /cockroach/

ENTRYPOINT ["/cockroach/start.sh"]
