FROM docker.io/docker/buildx-bin:0.16.0 AS buildx
FROM node:20.11.0 AS node
FROM docker.io/summerwind/actions-runner-dind:v2.316.1-ubuntu-22.04
USER root
RUN apt-get update \
  && apt-get install -y wget openjdk-11-jdk maven \
  && apt-get clean
USER runner
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=buildx /buildx /usr/libexec/docker/cli-plugins/docker-buildx
RUN mkdir /home/runner/.m2
