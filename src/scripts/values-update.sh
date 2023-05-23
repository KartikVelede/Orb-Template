#!/bin/bash
export GIT_SSH_COMMAND="ssh -o IdentitiesOnly=yes -i $HOME/.ssh/id_ifactor_travis"
git config user.name "CircleCI"
git config user.email "devsecops@kubra.com"
yq w helm/values.yaml .tags[+] "version: ${CIRCLE_TAG}"
git checkout version-tracking
git commit -am "adding ${CIRCLE_TAG}"
git push