#!/usr/bin/env bash

set -euo pipefail

trap 'printf "Error: Zipping failed"; exit 1' ERR

printf "Zipping Dockerrun.aws.json...."
zip Dockerrun.aws.json.zip ../Dockerrun.aws.json
printf "Zipping completed\nFile: Dockerrun.aws.json.zip\n"
