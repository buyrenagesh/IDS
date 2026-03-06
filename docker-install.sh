#!/bin/bash
# This file is executed when the docker lab container starts (see git repo bifrost_dev_env)
echo "----- [START] Running  bifrost_ext_launcher docker-install.sh ------"

set -ve

jupyter labextension uninstall --no-build @jupyterlab/launcher-extension

# rm -rf bifrost_ext_launcher/* bifrost_ext_launcher.egg-info/ node_modules/
# jlpm install --ignore-engines

if [[ ${WATCH} == "yes" ]]; then
  pip install -ve . --user
  # jupyter labextension develop --overwrite .

  jlpm run watch &
else
  pip install bifrost_ext_launcher
fi

echo "----- [END] Running  bifrost_ext_launcher docker-install.sh ------"