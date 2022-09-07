# 1 BIT_Planning_Envirment
This repository is created mainly to help the future student at Intelligent Vehicle Research Center of BIT to configure the environment of path planning. 

More than that, I think this tutorial will also help you a lot to install servel optimizers or packages on your computer.

If you follow me step by step, you can compile the program "hmpl" from Dr YuZhang successfully. Some of you may still have many problems when do these settings and my suggestion is to ask the senior schoolmates around, who will always be glad to help you solve problems. After that, if you still have trouble with running the project "hmpl", you can contract me by wechat: zx1120183609.

***Declaration:** All uploaded compressed package are from its official website and listed here for the convenience of downloading. I do not have the ownership, if there is infringement, please contact to delete.*

# 2 BEFORE YOU START
Above all, you need to install UBUNTU18.04 and ROS on your computer. After that tools like `cmake`, `g++`, `git` is also necessary. You can just use `sudo apt-get install XXX` to configure the basic tools.

After that we need to install serval libraries to our linux environment, e.g. ceres, nlopt, snopt, ipopt, cppad, libcpp, grid map, geographic, etc. Now I'm going to show you how to install them all. 

Most the sources code is given in this repository, but I recommend you to down load it on the official website or `git clone` them from their original repository. Please try to follow my step exactly by `git clone`, and if you have trouble with you internet, you can obtain the source code by other ways.

In this tutorial I will download all the source code in `~/Downloads`, you can unload it after the whole installation procedure.

# 3 CONFIGURE
### 3.1 ceres
Firstly, you need to install the dependencies of ceres:
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

### 3.2 nlopt
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

### 3.3 snopt
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

### 3.4 ipopt
Install independencies:
```
sudo apt-get -y install gfortran cmake build-essential gcc g++
```
Download the source code for the specified version:
```
cd ~/Downloads
git clone --branch releases/3.12.4 --depth=1 https://github.com/coin-or/Ipopt.git
```
Install ipopt:
```
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

### 3.5 cppad
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
sudo make install
```

### 3.6 libcpp
Install independencies:
```
sudo apt-get -y install liboctomap-dev cmake build-essential gcc g++ libboost-all-dev libeigen3-dev
```
Install libcpp:
```
cd ~/Downloads
git clone --branch v2.0 https://github.com/danfis/libccd.git
cd libccd
mkdir build && cd build
cmake ..
make && sudo make install
```

### 3.7 grid_map
Just enter one line of code:
```
sudo apt-get install ros-melodic-pcl-ros ros-melodic-costmap-2d ros-melodic-grid-map
```

### 3.8 geographic
```
sudo apt-get install libgeographic-dev
```

### 3.9 gtest
```
sudo apt-get install libgtest-dev
```

### 3.10 param-handler
```
sudo apt-get install ros-melodic-rosparam-handler
```

# 4 End
After all the operations above, you can go to the file `hmpl` written by Dr YuZhang and execute `catkin_make`. I think that if you don't ignore any of the above operations, you can build this project.

Maybe you still have problems like *can't find XXXXConfig.cmake* when `catkin_make` the `hmpl`, it's because that the filefolder *cmake* in package *opt-solver* is not in the correct path. Copy that *cmake* folder under the *src* folder, then you can solve the problem.


