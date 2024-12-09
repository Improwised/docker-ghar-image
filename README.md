# GHAR (DinD) Runner Image

A Docker-in-Docker (DinD) image for GitHub Actions self-hosted runners, based on [summerwind/actions-runner-dind](https://hub.docker.com/r/summerwind/actions-runner-dind).

This repository contains a Dockerfile for building a customized **GitHub Actions Runner** image. The image includes additional tools and dependencies required for running workflows in a GitHub Actions environment.

![GitHub last commit](https://img.shields.io/github/last-commit/improwised/docker-ghar-image/jdk)
![Image Build](https://github.com/Improwised/docker-ghar-image/actions/workflows/image-build.yaml/badge.svg/?branch=jdk)
![Docker Pulls](https://img.shields.io/docker/pulls/improwised/ghar-image)
![GitHub License](https://img.shields.io/github/license/improwised/docker-ghar-image)
![Top Language](https://img.shields.io/github/languages/top/improwised/docker-ghar-image)
![Code Size](https://img.shields.io/github/languages/code-size/improwised/docker-ghar-image)
![Docs](https://img.shields.io/badge/docs-available-brightgreen)


## Features
- Based on **summerwind/actions-runner-dind**.
- Includes additional tools and dependencies:
  - **Node.js 20** with npm.
  - **Docker Buildx v0.19.1** plugin.
  - **JDK support**:
    - `openjdk-11-jdk`
    - `openjdk-17-jdk`
  - Other utilities: `wget`, `curl`, and Azure CLI.
- Built with **Apache License 2.0**.

## Repository Structure
- `Dockerfile`: Contains the build instructions for the image.
- `LICENSE` & `NOTICE`: Licensing details and attributions.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](./LICENSE) file for details.

## Attributions

The `NOTICE` file contains attributions for third-party software and dependencies included in this project. See the [NOTICE](./NOTICE) file for details.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork this repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a clear description of your changes.

## Support

If you encounter issues or have questions, feel free to open an issue in this repository. We’ll do our best to assist you.
