#!/bin/bash
#
# Development entrypoint for Docker image
#
conda activate sdesk
cd /code
$SDESK_PYTHON_ENTRYPOINT
