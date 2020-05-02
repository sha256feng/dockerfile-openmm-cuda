# Run OpenMM with GPU support in Docker
Dockerfile for GPU-supported OpenMM in Docker containers. (https://github.com/sha256feng/dockerfile-openmm-cuda/) 
This repository is linked to the image in Dockerhub (https://hub.docker.com/repository/docker/sha256feng/openmm-with-cuda) via autobuild. 

- To run this container   
`docker run -it --rm --runtime nvidia --name ommcuda_app sha256feng/openmm-with-cuda bash`

- To access the system folder outside container
```
# Set up a Docker volume, '~/Documents/simulations' is the folder we want to access
docker volume create --driver local \
      --opt type=none \
      --opt device=~/Documents/simulations \
      --opt o=bind \
      simu_vol
# Link 'simu_vol' to /data in container
docker run -it --rm --runtime nvidia --mount source=simu_vol,target=/data --name ommcuda_app sha256feng/openmm-with-cuda bash
```

tags: 2020.4
