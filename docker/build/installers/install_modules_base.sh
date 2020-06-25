#!/usr/bin/env bash

###############################################################################
# Copyright 2020 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

# Fail on first error.
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"
. /tmp/installers/installer_base.sh

# apt-get -y update && \
#    apt-get -y install \
#    libxml2-dev

# Dependency:
# openmpi <- boost <- vtk <- pcl

bash /tmp/installers/install_mpi.sh
bash /tmp/installers/install_boost.sh

bash /tmp/installers/install_ffmpeg.sh
bash /tmp/installers/install_vtk.sh

# OpenCV depends on ffmpeg and vtk
bash /tmp/installers/install_opencv.sh

# PCL is required by [ Perception Localization Dreamview ]
bash /tmp/installers/install_pcl.sh

# Clean up cache to reduce layer size.
apt-get clean && \
    rm -rf /var/lib/apt/lists/*
