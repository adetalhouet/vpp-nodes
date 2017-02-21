#!/bin/bash

# Copyright (c) 2017 Alexis de Talhouët
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SCRIPTS/config.properties

sudo rm /etc/apt/sources.list.d/99fd.io.list
echo "deb [trusted=yes] https://nexus.fd.io/content/repositories/fd.io$RELEASE.ubuntu.$UBUNTU.main/ ./" | sudo tee -a /etc/apt/sources.list.d/99fd.io.list
sudo apt-get update -y
sudo apt-get install vpp vpp-dpdk-dkms  -y
sudo apt-get install bridge-utils ethtool -y
sed -i '/unix {/a \  cli-listen localhost:5002' /etc/vpp/startup.conf
sudo restart