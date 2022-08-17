# BIT_Planning_Envirment
This repository is created to help the future student at Intelligent Vehicle Research Center of BIT to configure the environment of path planning.

If you follow me step by step, you can compile the program "hmpl" from Dr YuZhang successfully. Some of you may still have many problems when do these settings and my suggestion is to ask the senior schoolmates around, who will always be glad to help you solve problems. After that, if you still have trouble with running the project "hmpl", you can contract me by wechat: zx1120183609.

# BEFORE START
Above all, you need to install UBUNTU18.04 on your computer and install servel necessary tool like `cmake`, `g++`, `git`. You can just use `sudo apt-get install XXX` to configure the basic tools.

Then we need to install serval libraries to our linux environment, e.g. ceres, nlopt, snopt, ipopt, cppad, libcpp, grid map, geographic, gtest and others. Now I'm going to show you how to install them all. In this tutorial I will download all the source code in `~/Downloads`, you can unload it after the whole installation procedure.

Most the sources code is given in this repository, but I recommend you to down load it on the official website or `git clone` them from their original repository. Please try to follow my step exactly by `git clone`, and if you have trouble with you internet, you can obtain the source code by other ways.

# START
## ceres
Firstly, you need to install dependencies of ceres:
```
sudo apt install libsuitesparse-dev libcxsparse3 libgflags-dev libgoogle-glog-dev libgtest-dev
```
Then, you need to download the source code:
```
cd ~/Downloads
git clone --branch 1.14.0 --depth=1 https://github.com/ceres-solver/ceres-solver.git
```
Afer that, execute the following code in turn to compile and install ceres:
```
cd ceres-solver
mkdir build
cd build
cmake ..        
make -j8
sudo make install
```

Illustration: for the code above `make -j8`, 8 is the thread of your CPU. You can use `make -j12` and so on, or just `make -j`.

So far, ceres is installed on your computer.

## nlopt
In this part, firstly we still need to download the souce code:
```
cd ~/Downloads
git clone --depth 1 --branch v2.5.0 https://github.com/stevengj/nlopt.git
```
Then you can install nlopt by doing the follow steps:
```
cd nlopt
mkdir build
cd build
cmake -DWITH_CXX="ON" ..
make -j8
sudo make install
```

## snopt
Install independencies:
```
sudo apt-get install autoconf autogen gfortran libgfortran3
```
Firstly, down load the snopt_binary-master and copy some files to your system. Just input the follow code in sequence:
```
cd ~/Downloads
git clone -b snopt_binary --single-branch https://github.com/ZxYsf/BIT_Planning_Envirment.git
cd BIT_Planning_Envirment/snopt_binary-master/lib/
sudo cp -rf * /usr/local/lib
cd .. && sudo cp -rf snopt.pc /usr/local/lib/pkgconfig
```
After that we can download the source code:
```
cd ~/Downloads
git clone https://github.com/snopt/snopt-interface.git
```
Choose the old vision:
```
cd snopt-interface
git reset --hard 76b166ecdf5c55a3289ce0f849d8d3d101954a22
```
Install step by step:
```
./autogen.sh
./configure prefix="/usr/local"
sudo make install
cd include
sudo mkdir -p /usr/local/include/snopt && sudo cp -rf * /usr/local/include/snopt
```

## ipopt
Install independencies:
```
sudo apt-get -y install gfortran cmake build-essential gcc g++
```
Download the source code for the specified version:
```
cd ~/Downloads
#git clone https://git.coding.net/aRagdoll/Ipopt-3.12.4.git
git clone --branch releases/3.12.4 --depth=1 https://github.com/coin-or/Ipopt.git
```
Install ipopt:
```
#cd Ipopt-3.12.4
cd Ipopt
./configure --prefix /usr/local
make -j8
make test
sudo make install
```
Set the environment variable:
```
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> $HOME/.bashrc
sudo ldconfig
source $HOME/.bashrc
```

## cppad
Download the source code for the specified version:
```
cd ~/Downloads
wget http://www.coin-or.org/download/source/CppAD/cppad-20180000.0.gpl.tgz
```
Extract files and install cppad:
```
tar -xf cppad-20180000.0.gpl.tgz
cd cppad-20180000.0 && mkdir build && cd build
cmake ..
sudo make instal
```

## libcpp
Install independencies:
```
sudo apt-get -y install liboctomap-dev cmake build-essential gcc g++ libboost-all-dev libeigen3-dev
```
Install libcpp:
```
git clone --branch v2.0 https://github.com/danfis/libccd.git
cd libccd
mkdir build && cd build
cmake -G "Unix Makefiles" -DBUILD_SHARED_LIBS=ON -DENABLE_DOUBLE_PRECISION=ON .. > /dev/null
make && sudo make install
```

## grid_map
Just enter one line of code:
```
sudo apt-get install ros-melodic-pcl-ros ros-melodic-costmap-2d ros-melodic-grid-map
```

## geographic
```
sudo apt-get install libgeographic-dev
```

## gtest
```
sudo apt-get install libgtest-dev
```









