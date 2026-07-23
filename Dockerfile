# Stage 1: Go
FROM library/golang:1.21.5 AS golang

# Stage 2: Composer
FROM library/composer:2.1.14 AS composer

# Final Stage: Base image with ARC runner
FROM ghcr.io/actions/actions-runner:2.336.0

# Switch to root user for installation
USER root

# Install required packages Azure CLI, and AWS CLI
RUN set -ex; \
    curl -sL https://deb.nodesource.com/setup_20.x | bash -; \
    curl -sL https://raw.githubusercontent.com/kadwanev/retry/0b65e6b7f54ed36b492910470157e180bbcc3c84/retry -o /usr/bin/retry; \
    chmod +x /usr/bin/retry; \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y \
    php php-apcu php-bcmath php-dom php-ctype php-curl php-exif php-fileinfo php-fpm \
    php-gd php-gmp php-iconv php-intl php-json php-mbstring php-mysqlnd php-soap \
    php-redis php-mysqli php-opcache php-pdo php-phar php-posix php-simplexml \
    php-sockets php-sqlite3 php-tidy php-tokenizer php-xml php-xmlwriter php-zip \
    php-pear libgd-tools \
    nodejs \
    git unzip wget make build-essential mandoc less \
    && curl -sL "https://aka.ms/InstallAzureCLIDeb" | bash \
    && curl -sL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf /var/lib/apt/lists/* awscliv2.zip ./aws \
    && apt-get clean && apt-get autoremove -y

# Switch back to the runner user
USER runner

# Copy necessary binaries from previous stages
COPY --from=golang "/usr/local/go/" "/usr/local/go/"
COPY --from=composer "/usr/bin/composer" "/usr/local/bin/composer"

# Set PATH for Go
ENV PATH="/usr/local/go/bin:${PATH}"

# Persist PATH for the runner user
RUN echo "PATH=$PATH" >> /home/runner/.env
