FROM cockroachdb/cockroach:v22.2.6

# We set and install the en US langauge pack to fix COLLATE issues
ENV LANG='en_US.UTF-8'
ENV LANGUAGE='en_US:en'
ENV LC_ALL='en_US.UTF-8'

RUN microdnf update -y \
    && microdnf install glibc-langpack-en -y \
    && rm -rf /var/cache/yum

ADD start.sh /cockroach/

ENTRYPOINT ["/cockroach/start.sh"]
