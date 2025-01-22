# Ubuntu Docker Image

This Docker image is based on the latest Ubuntu image and has been configured to use faster package downloads. The image does not perform any additional operations and sets the default command to start a bash shell.

## Dockerfile Overview

```dockerfile
// ...existing code...
```

### Key Features

- **Base Image**: `ubuntu:latest`
- **Mirror Configuration**: Replaces default Ubuntu archive and security URLs with faster mirrors.
- **Default Command**: Starts a bash shell.

### Usage

To build the Docker image, navigate to the directory containing the Dockerfile and run:

```sh
docker build -t richardmikupro/ubuntu .
```

To run a container using the built image:

```sh
docker run -it richardmikupro/ubuntu
```

This will start a container and open a bash shell.

### Notes

- The image is configured to use faster mirrors for package management.
- No additional software or configurations are included in this image.
