FROM sciencedesk/miniconda3-py37-4-8-2

WORKDIR /sdesk-conda

RUN  apt-get update &&  apt-get install -y libgl1-mesa-dev

COPY ./conda_environment.yml /sdesk-conda/conda_environment.yml
RUN conda env create -n sdesk -f /sdesk-conda/conda_environment.yml && \
    conda clean --all --yes

ENV PATH /opt/conda/envs/env/bin:$PATH

COPY conda-requirements.txt /sdesk-conda/conda-requirements.txt
RUN conda install -n sdesk -c conda-forge --file conda-requirements.txt
SHELL ["conda", "run", "-n", "sdesk", "/bin/bash", "-c"]

COPY requirements.txt /sdesk-conda/requirements.txt
RUN pip install -r requirements.txt

COPY entrypoint.sh /sdesk-conda/entrypoint.sh
ENTRYPOINT ["/sdesk-conda/entrypoint.sh"]
