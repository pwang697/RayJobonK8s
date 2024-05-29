#!/bin/bash

set -e

# install hops
mkdir -p /srv/hops
HADOOP_VERSION=3.2.0.13-SNAPSHOT
HADOOP_VERSION_EE=3.2.0.13-EE-SNAPSHOT
if test -f "/root/.wgetrc"; then
    wget https://nexus.hops.works/repository/hopshadoop/hops-$HADOOP_VERSION_EE.tgz
    tar -C /srv/hops/ -zxf hops-$HADOOP_VERSION_EE.tgz
    ln -s /srv/hops/hadoop-$HADOOP_VERSION_EE /srv/hops/hadoop
    rm hops-$HADOOP_VERSION_EE.tgz
else
    wget https://repo.hops.works/master/hops-$HADOOP_VERSION.tgz
    tar -C /srv/hops/ -zxf hops-$HADOOP_VERSION.tgz
    ln -s /srv/hops/hadoop-$HADOOP_VERSION /srv/hops/hadoop
    rm hops-$HADOOP_VERSION.tgz
fi

#remove all useless jars etc
rm -rf /srv/hops/hadoop/etc
rm -rf /srv/hops/hadoop/sbin