# BIT_Planning_Envirment
This repository is created to help the future student at Intelligent Vehicle Research Center of BIT to configure the environment of path planning.

If you follow me step by step, you can compile the program "hmpl" from Dr YuZhang successfully. Some of you may still have many problems when do these settings and my suggestion is to ask the senior schoolmates around, who will always be glad to help you solve problems. After that, if you still have trouble with running the project "hmpl", you can contract me by wechat: zx1120183609.

# Start
First of all, you need to install UBUNTU18.04 on your computer.
Then we need to install serval libraries to our linux environment, e.g. ceres, nlopt, snopt, ipopt, cppad, libcpp, grid map, geographic, gtest and others. Now I'm going to show you how to install them all.
Most the sources code is given in this repository, but I recommend you to down load it on the official website or `git clone` them from their original repository. Please try to follow my step exactly by `git clone`, and if you have trouble with you internet, you can obtain the source code by other ways.

# ceres
Firstly, you need to install dependencies of ceres:
```
sudo apt install libsuitesparse-dev libcxsparse3 libgflags-dev libgoogle-glog-dev libgtest-dev
```
Then, you need to download the source code:
```
git clone https://github.com/ceres-solver/ceres-solver.git
```
Afer that, enter the coresponding ceres folder `cd ceres-solver` and execute the following code in turn:
```
mkdir build
cd build
cmake ..        
make -j8
make test
sudo make install
```

Illustration: for the code above `make -j8`, 8 is the thread of your CPU.
So far, ceres is installed on your computer.
