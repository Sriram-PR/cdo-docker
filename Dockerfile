FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && apt-get install --no-install-recommends -y \
    cdo \
    libnetcdf-dev \
    libnetcdf19 \
    libhdf5-dev \
    libeccodes0 \
    libeccodes-dev \
    netcdf-bin \
    nco \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*

WORKDIR /data

RUN cdo --version

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD cdo --version || exit 1

CMD ["bash"]