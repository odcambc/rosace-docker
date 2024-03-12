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
docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 -v ./data:/home/rosace/data cbmacdo/rosace-docker
```

#### `rosace-docker-minimal`
```bash
docker pull cbmacdo/rosace-docker-minimal:latest
docker run --rm -ti -v ./data:/home/rosace/data cbmacdo/rosace-docker-minimal
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
Start the Docker container with the following command (replace the password with your own):

```bash
docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 -v ./data:/home/rosace/data cbmacdo/rosace-docker
```

This will make the `data` folder in the current working directory available to the Rstudio server in the container at `/home/rosace/data`.
Change this to whatever directory you would like to mount instead. You can change which port the Rstudio server is
available on by changing the `-p` flag, in case 8787 is already in use on your system.

Then connect to the Rstudio server in the docker image using the username "rstudio" and
the password you chose above: http://localhost:8787/

#### `rosace-docker-minimal`
```bash
docker run --rm -ti -v ./data:/home/rosace/data cbmacdo/rosace-docker-minimal
```
This will make the `data` folder in the current working directory available to the Rstudio server in the container at `/home/rosace/data`.
Change this to whatever directory you would like to mount instead.

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