FROM docker.io/library/golang:1.21.5 AS golang
FROM docker.io/library/composer:2.1.14 AS composer
FROM docker.io/docker/buildx-bin:0.19.3 AS buildx
FROM docker.io/summerwind/actions-runner-dind:v2.319.1-ubuntu-22.04
USER root
COPY --from=golang "/usr/local/go/" "/usr/local/go/"
COPY --from=composer "/usr/bin/composer" "/usr/local/bin/composer"
COPY --from=buildx /buildx /usr/libexec/docker/cli-plugins/docker-buildx
RUN set -ex; \
  curl -sL https://deb.nodesource.com/setup_20.x | bash -; \
  curl https://raw.githubusercontent.com/kadwanev/retry/0b65e6b7f54ed36b492910470157e180bbcc3c84/retry -o /usr/bin/retry; \
  chmod +x /usr/bin/retry; \
  apt-get update; \
  apt-get install --no-install-recommends --no-install-suggests -y \
  php php-apcu php-bcmath php-dom php-ctype php-curl php-exif php-fileinfo php-fpm \
  php-gd php-gmp php-iconv php-intl php-json php-mbstring php-mysqlnd php-soap \
  php-redis php-mysqli php-opcache php-pdo php-phar php-posix php-simplexml \
  php-sockets php-sqlite3 php-tidy php-tokenizer php-xml php-xmlwriter php-zip \
  php-pear libgd-tools \
  nodejs \
  git unzip; \
  apt-get clean autoclean; \
  apt-get autoremove --yes
  # rm -rf /var/lib/{apt,dpkg,cache,log}/
ENV PATH="/usr/local/go/bin:${PATH}"
USER runner
ENV PATH="/usr/local/go/bin:${PATH}"
RUN echo PATH=$PATH >> /runnertmp/.env
