#!/bin/bash
# Build tools and libs
sudo apt-get update
sudo apt-get install -y aptitude
sudo apt-get install -y libc6-i386 libc6-dev-i386 libssl-dev:i386 libxml2-dev:i386
sudo aptitude install -y gcc-multilib g++-multilib
sudo apt-get install -y build-essential libgtk2.0-dev \
  libssl-dev xsltproc libxml2-dev libcap-dev

# Python
sudo apt-get install -y python

# Scons
sudo apt-get install -y scons

# openssl
sudo apt-get install -y libssl-dev

# git
sudo apt-get install -y git-core

# repo
sudo apt-get install -y curl
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
sudo cp ~/bin/repo /usr/local/bin/
sudo chmod a+x /usr/local/bin/repo

# Uncrustify
mkdir $HOME/uncrustify
cd $HOME/uncrustify
git clone http://github.com/bengardner/uncrustify.git
cd uncrustify
git checkout uncrustify-0.61
./configure
sudo make install

# doxygen
sudo apt-get install -y doxygen

# graphviz
sudo apt-get install -y graphviz

# TeX Live
sudo apt-get install -y texlive

# JDK
mkdir ~/jdk
cd ~/jdk
wget http://7xr168.com1.z0.glb.clouddn.com/jdk-8u73-linux-x64.tar.gz -O jdk-8u73-linux-x64.tar.gz
tar -xvf jdk-8u73-linux-x64.tar.gz
sudo mv jdk1.8.0_73 /usr/lib/jvm/

sudo update-alternatives --install /usr/bin/javac javac \
   /usr/lib/jvm/jdk1.8.0_73/bin/javac 2
   
sudo update-alternatives --install /usr/bin/java java \
   /usr/lib/jvm/jdk1.8.0_73/bin/java 2
   
sudo update-alternatives --install /usr/bin/javaws javaws \
   /usr/lib/jvm/jdk1.8.0_73/bin/javaws 2
   
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_73/bin/javac
sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_73/bin/java
sudo update-alternatives --set javaws /usr/lib/jvm/jdk1.8.0_73/bin/javaws

wget http://central.maven.org/maven2/junit/junit/4.9/junit-4.9.jar
sudo cp junit-4.9.jar /usr/share/java/
sudo apt-get install -y ant

# Alljoyn source
cd $HOME
cat << EOF >> ~/.bashrc
export AJ_ROOT=$HOME/workspace/alljoyn
# <TARGET CPU> can be either x86_64, x86, or whatever value you set for CPU= when running SCons
export AJ_DIST=$AJ_ROOT/core/alljoyn/build/linux/x86_64/debug/dist
export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_73"
export CLASSPATH="/usr/share/java/junit-4.9.jar"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ubuntu/workspace/alljoyn/core/alljoyn/build/linux/x86_64/debug/dist/cpp/lib
# Add header include directories
export CXXFLAGS="$CXXFLAGS \
    -I$AJ_DIST/cpp/inc \
    -I$AJ_DIST/about/inc \
    -I$AJ_DIST/services_common/inc \
    -I$AJ_DIST/notification/inc \
    -I$AJ_DIST/controlpanel/inc \
    -I$AJ_DIST/services_common/inc \
    -I$AJ_DIST/samples_common/inc"
# Configure linker to include required libs
export LDFLAGS="$LDFLAGS \
    -L$AJ_DIST/cpp/lib \
    -L$AJ_DIST/about/lib \
    -L$AJ_DIST/services_common/lib \
    -L$AJ_DIST/notification/lib \
    -L$AJ_DIST/controlpanel/lib"
EOF

export AJ_ROOT=$HOME/workspace/alljoyn
export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_73"
export CLASSPATH="/usr/share/java/junit-4.9.jar"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ubuntu/workspace/alljoyn/core/alljoyn/build/linux/x86_64/debug/dist/cpp/lib

# download alljoyn codes
git clone https://git.allseenalliance.org/gerrit/core/alljoyn.git \
    $AJ_ROOT/core/alljoyn
cd $AJ_ROOT/core/alljoyn
git checkout v15.04b

git clone https://git.allseenalliance.org/gerrit/core/ajtcl.git \
    $AJ_ROOT/core/ajtcl
cd $AJ_ROOT/core/ajtcl
git checkout v15.04b

git clone https://git.allseenalliance.org/gerrit/core/alljoyn-js.git \
    $AJ_ROOT/core/alljoyn-js
cd $AJ_ROOT/core/alljoyn-js
git checkout v15.04

# v15.09 required
git clone https://git.allseenalliance.org/gerrit/core/securitymgr.git \
    $AJ_ROOT/core/securitymgr

# v15.09 required
git clone https://git.allseenalliance.org/gerrit/core/test.git \
    $AJ_ROOT/core/test

git clone  https://git.allseenalliance.org/gerrit/services/base.git \
    $AJ_ROOT/services/base
cd $AJ_ROOT/services/base
git checkout v15.04

git clone https://git.allseenalliance.org/gerrit/services/base_tcl.git \
    $AJ_ROOT/services/base_tcl
cd $AJ_ROOT/services/base_tcl
git checkout v15.04

git clone https://git.allseenalliance.org/gerrit/services/notification_viewer.git \
    $AJ_ROOT/services/notification_viewer

git clone https://git.allseenalliance.org/gerrit/gateway/gwagent.git \
    $AJ_ROOT/gateway/gwagent
cd $AJ_ROOT/gateway/gwagent
git checkout v15.04

git clone https://git.allseenalliance.org/gerrit/gateway/update.git \
    $AJ_ROOT/gateway/update

git clone https://git.allseenalliance.org/gerrit/dsb $AJ_ROOT/dsb

git clone https://git.allseenalliance.org/gerrit/data/datadriven_api.git \
    $AJ_ROOT/data/datadriven_api
cd $AJ_ROOT/data/datadriven_api
git checkout v15.04

git clone https://git.allseenalliance.org/gerrit/devtools/codegen.git \
    $AJ_ROOT/devtools/codegen
cd $AJ_ROOT/devtools/codegen
git checkout v15.04
    
git clone https://git.allseenalliance.org/gerrit/devtools/aj_nodejs.git \
    $AJ_ROOT/devtools/aj_nodejs

# no 15.04 tag
git clone https://git.allseenalliance.org/gerrit/devtools/manifest.git \
    $AJ_ROOT/devtools/manifest
    
git clone https://git.allseenalliance.org/gerrit/contributed_applications/dashboard.git \
    $AJ_ROOT/contributed_applications/dashboard
    
git clone https://git.allseenalliance.org/gerrit/extras/automation.git \
    $AJ_ROOT/extras/automation

git clone https://git.allseenalliance.org/gerrit/extras/hackfest.git \
    $AJ_ROOT/extras/hackfest
    
git clone https://git.allseenalliance.org/gerrit/extras/tutorials.git \
    $AJ_ROOT/extras/tutorials

git clone https://git.allseenalliance.org/gerrit/extras/webdocs.git \
    $AJ_ROOT/extras/webdocs
    
echo "done..."