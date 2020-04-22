#!/bin/bash
#
# Development entrypoint for Docker image
#
cd /code
conda run -n sdesk $SDESK_PYTHON_ENTRYPOINT
