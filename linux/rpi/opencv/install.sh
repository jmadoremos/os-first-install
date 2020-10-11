#!/bin/bash

###########################################################
# This instruction was extracted from https://pimylifeup.com/raspberry-pi-opencv/
# v2020-02-17
###########################################################

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing compilation tools..."
sudo apt install -y build-essential cmake pkg-config
echo " done"

echo -n "[] Installing image and video I/O packages..."
sudo apt install -y libjpeg-dev libtiff-dev libjasper-dev libpng-dev libwebp-dev libopenexr-dev &> /dev/null
sudo apt install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libdc1394-22-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev &> /dev/null
echo " done"

echo -n "[] Installing GTK development packages and dependencies..."
sudo apt install -y libgtk-3-dev libqtgui4 libqtwebkit4 libqt4-test python3-pyqt5 &> /dev/null
echo " done"

echo -n "[] Installing OpenCV optimizers..."
sudo apt install -y libatlas-base-dev liblapacke-dev gfortran &> /dev/null
echo " done"

echo -n "[] Installing HDF5 datasets..."
sudo apt install -y libhdf5-dev libhdf5-103 &> /dev/null
echo " done"

echo -n "[] Installing Python header files for compilation..."
sudo apt install -y python3-dev python3-pip python3-numpy &> /dev/null
echo " done"

echo -n "[] Cloning opencv repositories..."
mkdir ~/opencv-installation &> /dev/null
cd ~/opencv-installation &> /dev/null
git clone https://github.com/opencv/opencv.git --depth 1 &> /dev/null
git clone https://github.com/opencv/opencv_contrib.git --depth 1 &> /dev/null
mkdir ./opencv/build &> /dev/null
cd ./opencv/build &> /dev/null
echo " done"

echo "[] Generating makefile..."
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D ENABLE_NEON=ON \
    -D ENABLE_VFPV3=ON \
    -D BUILD_TESTS=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D CMAKE_SHARED_LINKER_FLAGS=-latomic \
    -D BUILD_EXAMPLES=OFF ..

echo "[] Compiling (may take hours to complete)..."
make -j$(nproc)

echo "[] Installing opencv..."
sudo make install

echo -n "[] Regenerating library link cache..."
sudo ldconfig &> /dev/null
echo " done"

echo -n "[] Perfoming cleanup..."
rm -d ~/opencv-installation &> /dev/null
echo " done"
