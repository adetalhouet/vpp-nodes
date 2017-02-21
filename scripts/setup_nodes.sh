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
ROOT="$( cd "$SCRIPTS" && cd .. && pwd)"

source $SCRIPTS/config.properties
export NUM_OF_NODES=$NUM_OF_NODES
echo "Nodes will be deployed using $UBUNTU $RELEASE."
echo "The cluster will have $NUM_OF_NODES nodes."
cd $ROOT
vagrant destroy -f
vagrant up