# GHAR (DinD) runner image

D-in-D image for GitHub Actions Self-Hoster runner based on [summerwind/actions-runner-dind](https://hub.docker.com/r/summerwind/actions-runner-dind)

## Packages

| Package | Version |
| - | - |
| summerwind/actions-runner-dind | v2.325.0-ubuntu-22.04 |
| Golang | 1.21.5 |
| Buildx | 0.24.0 |
| Node | 20.17.0 |
| npm | 10.8.2 |
| Composer | 2.1.14 |
| PHP | 8.1.2 |

- php-apcu, php-bcmath, php-dom, php-ctype, php-curl, php-exif, php-fileinfo, php-fpm, php-gd, php-gmp, php-iconv, php-intl, php-json, php-mbstring, php-mysqlnd, php-soap, php-redis, php-mysqli, php-opcache, php-pdo, php-phar, php-posix, php-simplexml, php-sockets, php-sqlite3, php-tidy, php-tokenizer, php-xml, php-xmlwriter, php-zip, php-pear, libgd-tools
<!-- - Docker    20.10.8 -->
- [retry](https://raw.githubusercontent.com/kadwanev/retry/0b65e6b7f54ed36b492910470157e180bbcc3c84/retry)
- wget, curl, unzip

## Run

`docker run -it --entrypoint=bash --rm improwised/ghar-image`

## Build

- `docker buildx build -t ghar-image .`
