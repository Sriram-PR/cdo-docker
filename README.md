# CDO Docker

A lightweight Docker container with Climate Data Operators (CDO) and related tools for climate data processing.

## Overview

This Docker image provides a ready-to-use environment for climate data analysis using CDO (Climate Data Operators) along with supporting tools like NetCDF and NCO. The image is built on Ubuntu 22.04 and includes all necessary dependencies to work with climate data files.

## Features

- Based on Ubuntu 22.04
- Includes CDO, NetCDF, and NCO utilities
- Runs as a non-root user for better security
- Configured with timezone for Asia/Kolkata
- Includes health checks
- Minimal image size with unnecessary packages removed

## Included Software

- CDO (Climate Data Operators)
- NetCDF development libraries and utilities
- HDF5 development libraries
- ECCODES libraries and development packages
- NCO (NetCDF Operators)

## Usage

### Pull from Docker Hub

```bash
docker pull srirampr/cdo-docker:latest
```

### Run the Container

To start a container with the current directory mounted as a data volume:

```bash
docker run -it --rm -v $(pwd):/data srirampr/cdo-docker
```

### Working with Climate Data

Once inside the container, you can use CDO, NCO and other installed tools to process your climate data files:

```bash
# Example: Get information about a NetCDF file
cdo info input.nc

# Example: Calculate mean of a variable
cdo timmean input.nc output.nc

# Example: Use NCO to manipulate NetCDF files
ncks -v temperature input.nc output.nc
```

## Working with GitHub

If you want to clone this repository and build the Docker image yourself:

```bash
# Clone the repository
git clone https://github.com/Sriram-PR/cdo-docker.git
cd cdo-docker

# Build the Docker image
docker build -t cdo-docker .

# Run the container
docker run -it --rm -v $(pwd):/data cdo-docker
```

### Contributing Workflow

If you'd like to contribute to this project:

1. Fork the repository on GitHub
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR-USERNAME/cdo-docker.git
   ```
3. Create a new branch for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. Make your changes to the Dockerfile or documentation
5. Build and test your changes:
   ```bash
   docker build -t cdo-docker-test .
   docker run -it --rm cdo-docker-test cdo --version
   ```
6. Commit your changes and push to your fork
7. Create a Pull Request on GitHub

## Environment Variables

The following environment variables are pre-configured in the image:

- `DEBIAN_FRONTEND=noninteractive`: Prevents interactive prompts during package installation
- `TZ=Asia/Kolkata`: Sets the timezone
- `LC_ALL=C.UTF-8` and `LANG=C.UTF-8`: Sets locale to UTF-8

## Security

The container runs as a non-root user `cdo-user` with UID 1000, which helps prevent potential security issues. The data directory `/data` is owned by this user.

## License

This project is available under the [MIT License](https://github.com/Sriram-PR/cdo-docker/blob/main/LICENSE).

## Author

- [Sriram-PR](https://github.com/Sriram-PR)

## Issues and Support

If you encounter any problems or have suggestions, please create an issue on the GitHub repository:
https://github.com/Sriram-PR/cdo-docker/issues
