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
export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_73"
export CLASSPATH="/usr/share/java/junit-4.9.jar"
EOF

export AJ_ROOT=$HOME/workspace/alljoyn
export JAVA_HOME="/usr/lib/jvm/jdk1.8.0_73"
export CLASSPATH="/usr/share/java/junit-4.9.jar"

git clone https://git.allseenalliance.org/gerrit/core/alljoyn.git \
    $AJ_ROOT/core/alljoyn
