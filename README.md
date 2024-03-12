# rosace-docker

This repository contains Dockerfiles to build a Docker image for the [rosace](https://github.com/pimentellab/rosace)
deep mutational scanning analysis software. This is provided to simplify the installation of all necessary R libraries and dependencies.

## Quick start

```bash
docker pull cbmacdo/rosace-docker:latest
docker run --rm -p 8787:8787 -e PASSWORD=password rosace-docker
```

Then connect to the Rstudio server in the docker image: http://localhost:8787/

## Installation

### Dependencies

Make sure there is a working (Docker)[https://www.docker.com] installation on your system.

We provide two versions of the rosace-docker image on Docker Hub, both of which are built from
the Dockerfiles in this repository using [rocker](https://github.com/rocker-org/rocker) project
images. the `rosace-docker` image includes tidyverse and Rstudio in addition to rosace,
while the `rosace-docker-minimal` image includes only the necessary R libraries to run rosace. This is
reflected in the slightly smaller size of the `rosace-docker-minimal` image.

### Pull images from Docker Hub
This is the easiest way to get started with rosace-docker.

#### `rosace-docker`
```bash
docker pull cbmacdo/rosace-docker:latest
docker run --rm -p 8787:8787 -e PASSWORD=password rosace-docker
```

#### `rosace-docker-minimal`
```bash
docker pull cbmacdo/rosace-docker-minimal:latest
docker run -d rosace-docker-minimal
```

### Build images from Dockerfiles

Download the Dockerfiles from this repository and build the image with the following commands:

#### `rosace-docker`
```bash
docker build -t rosace-docker .
```

#### `rosace-docker-minimal`
```bash
docker build -f Dockerfile.minimal -t rosace-docker-minimal .
```

## Usage
#### `rosace-docker`
Start the Docker container with the following command:

```bash
docker run --rm -p 8787:8787 -e PASSWORD=password rosace-docker
```

Then connect to the Rstudio server in the docker image using
the password you chose above: http://localhost:8787/

This will also mount the current working directory to the `/home/rosace/data` directory in the container.

#### `rosace-docker-minimal`
```bash
docker run -d rosace-docker-minimal
```

This will also mount the current working directory to the `/home/rosace/data` directory in the container.

## Citations
Rosace is described in the following publication:

* [Rao et al., 2023](https://www.biorxiv.org/content/10.1101/2023.10.24.562292v1)

## License

This is licensed under the MIT license. See the LICENSE file for details.

## Contributing

Contributions and feedback are welcome. Please submit an issue or pull request.

## Getting help

For any issues, please open an issue on the GitHub repository. For
questions or feedback, [email Chris](https://www.wcoyotelab.com/members/).