FROM nvidia/cuda:10.1-base-ubuntu18.04

ARG CONDA=Miniconda3
ARG PYTHON=py37
ARG VERSION=4.8.2

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git mercurial subversion && \
    apt-get clean

RUN wget --quiet https://repo.anaconda.com/miniconda/$CONDA-$PYTHON_$VERSION-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy



RUN mkdir /code
WORKDIR /code
COPY ./conda_environment.yml /code/conda_environment.yml
RUN conda env create -f /code/conda_environment.yml && \
    conda clean --all --yes
RUN echo "source activate conda_environment" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

SHELL ["conda", "run", "-n", "conda_environment", "/bin/bash", "-c"]

COPY requirements.txt /code/requirements.txt
ENV PIP_EXTRA_INDEX_URL https://pypi.debonzi.dev/simple
RUN pip install -r requirements.txt

EXPOSE 8888

