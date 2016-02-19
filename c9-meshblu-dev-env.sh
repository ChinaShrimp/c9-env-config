#!/bin/bash
export MESH_ROOT=$HOME/workspace/meshblu
mkdir -p $MESH_ROOT
cd $MESH_ROOT
git clone https://github.com/octoblu/meshblu.git $MESH_ROOT/meshblu
cd $MESH_ROOT/meshblu
npm install


npm install meshblu-util -g
git clone https://github.com/octoblu/meshblu-alljoyn.git $MESH_ROOT/meshblu-alljoyn
cd $MESH_ROOT/meshblu-alljoyn
npm install https://github.com/octoblu/alljoyn.git
npm install

cat << EOF >> ~/.bashrc
export TOKEN=123456
export MESH_ROOT=$HOME/workspace/meshblu
EOF