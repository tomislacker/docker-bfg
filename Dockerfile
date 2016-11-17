FROM        openjdk:8-jre
MAINTAINER  Ben Tomasik <tomislacker@users.noreply.github.com>

ARG         BFG_VERSION=1.12.14

VOLUME      ['/code']

RUN         wget \
                --quiet \
                --output-document=/bfg.jar \
                http://repo1.maven.org/maven2/com/madgag/bfg/${BFG_VERSION}/bfg-${BFG_VERSION}.jar

COPY        assets/bfg /usr/bin/bfg
ENTRYPOINT  ["/usr/bin/bfg"]
CMD         ["--help"]
