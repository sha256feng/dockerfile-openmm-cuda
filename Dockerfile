FROM nvidia/cuda:10.0-runtime-ubuntu18.04
MAINTAINER SHA256FENG

# base OS packages
RUN \
        apt-get update \
        && apt-get install -yq \
        build-essential \
        bzip2 \
        wget \
        csh

# conda
RUN \
        wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
        && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda \
        && rm -v Miniconda3-latest-Linux-x86_64.sh

ENV PATH="/opt/conda/bin:$PATH"
RUN conda update --quiet --yes conda

RUN \
        . /opt/conda/etc/profile.d/conda.sh \
        && conda config --add channels conda-forge \
        && conda config --add channels omnia \
        && conda install -c omnia/label/cuda100 openmm \
        && conda install -c omnia \
            openmoltools \
            openmmtools \
            pdbfixer \
            parmed \
        && conda clean -afy

CMD ["/bin/bash"]
