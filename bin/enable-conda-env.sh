#!/bin/bash

set -x

conda create --name sreccardo-blog-env || exho already exists
yellow You need to do this from CLI to Activate your environment: 
echodo source activate sreccardo-blog-env
#4) Install your dependencies: 
conda install --file requirements.txt

