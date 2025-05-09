#!/usr/bin/env bash

set -euo pipefail

trap 'printf "Error: Zipping failed"; exit 1' ERR

printf "Zipping appllication.py, requirements.txt, Procfile..."
zip application.zip ../application.py ../requirements.txt ../Procfile
printf "Zipping completed\nFile: application.zip"
