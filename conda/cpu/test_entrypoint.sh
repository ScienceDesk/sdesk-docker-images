#!/bin/bash
#
# Plugin test entrypoint for Docker image
#

cd /root
conda run -n sdesk jupyter notebook --allow-root --ip=*  --NotebookApp.token='' --NotebookApp.password=''
