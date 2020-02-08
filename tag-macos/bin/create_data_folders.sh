#!/bin/bash

mkdir -p ~/PROJECTS
mkdir -p ~/LIBRARIES/public
mkdir -p ~/LIBRARIES/mh

find ~/Synced -maxdepth 1 -mindepth 1 -iname 'public_*' -exec ln -s {} ~/LIBRARIES/public/ \;
find ~/Synced -maxdepth 1 -mindepth 1 -iname 'mh_lib_*' -exec ln -s {} ~/LIBRARIES/mh/ \;
find ~/Synced -maxdepth 1 -mindepth 1 -iname 'mh_project_*' -exec ln -s {} ~/PROJECTS/ \;
