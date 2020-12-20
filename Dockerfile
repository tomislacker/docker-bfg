FROM        openjdk:8-jre
LABEL MAINTAINER="Ben Tomasik <tomislacker@users.noreply.github.com>"

ARG         BFG_VERSION=1.13.0

VOLUME      ["/code"]

WORKDIR /usr/bin/bfg
RUN    wget \
                --quiet \
                --output-document=/usr/bin/bfg/bfg.jar \
                https://repo1.maven.org/maven2/com/madgag/bfg/${BFG_VERSION}/bfg-${BFG_VERSION}.jar 

ENTRYPOINT  ["java","-jar","/usr/bin/bfg/bfg.jar"]
CMD         ["--help"]