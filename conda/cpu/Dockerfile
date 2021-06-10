FROM sciencedesk/miniconda3-py37-4-8-2
WORKDIR /sdesk-conda

RUN  apt-get update &&  apt-get install -y libgl1-mesa-dev \
gcc \
g++ \
libboost-all-dev \
swig \
&& rm -rf /var/lib/apt/lists/*

# gcc, g++, libboost-all-dev and swig used for python package xylib

COPY ./conda_environment.yml /sdesk-conda/conda_environment.yml
RUN conda env create -n sdesk -f /sdesk-conda/conda_environment.yml && \
    conda clean --all --yes

ENV PATH /opt/conda/envs/env/bin:$PATH

COPY conda-requirements.txt /sdesk-conda/conda-requirements.txt
RUN conda install -n sdesk -c conda-forge --file conda-requirements.txt
SHELL ["conda", "run", "-n", "sdesk", "/bin/bash", "-c"]

# Non-conda packages   .
COPY requirements.txt  /sdesk-conda/requirements.txt
ENV PIP_EXTRA_INDEX_URL https://pypi.debonzi.dev/simple
RUN pip install -r requirements.txt
RUN pip install -r requirements.txt

# For Debug
# COPY py_wheels /sdesk-conda/py_wheels
# RUN pip wheel  --wheel-dir=/sdesk-conda/py_wheels -r requirements.txt

COPY entrypoint.sh /sdesk-conda/entrypoint.sh
ENTRYPOINT ["/sdesk-conda/entrypoint.sh"]
