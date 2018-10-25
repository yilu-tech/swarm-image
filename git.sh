#!/bin/bash

cd apps
git init
git remote add origin ${URL}
git fetch origin ${BRANCH} 
git checkout ${BRANCH}