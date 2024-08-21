# GHAR (DinD) runner image

D-in-D image for GitHub Actions Self-Hoster runner based on [summerwind/actions-runner-dind](https://hub.docker.com/r/summerwind/actions-runner-dind)

## Packages

| Package | Version |
| - | - |
| summerwind/actions-runner-dind | v2.319.1-ubuntu-22.04 |
| Buildx | 0.16.2 |
| Node | 20.11.0 |
## Run

`docker run -it --entrypoint=bash --rm improwised/ghar-image`

## Build

- `docker buildx build -t ghar-image .`
