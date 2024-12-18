# Stage 1: Buildx
FROM docker/buildx-bin:0.19.3 AS buildx

# Stage 2: Node.js
FROM node:20.11.0 AS node

# Final Stage: Base image with DinD runner
FROM summerwind/actions-runner-dind:v2.321.0-ubuntu-22.04

# Set JDK_VERSION for later stages
ARG JDK_VERSION=11

# Switch to root user for installation
USER root

# Install required packages and Azure CLI
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget openjdk-${JDK_VERSION}-jdk maven \
    && curl -sL https://aka.ms/InstallAzureCLIDeb | bash \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch back to runner user
USER runner

# Copy Node.js files from the Node stage
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

# Copy Buildx binary from the Buildx stage
COPY --from=buildx /buildx /usr/libexec/docker/cli-plugins/docker-buildx

# Create necessary directories
RUN mkdir -p /home/runner/.m2
