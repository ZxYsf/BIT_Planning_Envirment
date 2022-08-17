# BIT_Planning_Envirment
This repository is created to help the future student at Intelligent Vehicle Research Center of BIT to configure the environment of path planning.

If you follow me step by step, you can compile the program "hmpl" from Dr YuZhang successfully. Some of you may still have many problems when do these settings and my suggestion is to ask the senior schoolmates around, who will always be glad to help you solve problems. After that, if you still have trouble with running the project "hmpl", you can contract me by wechat: zx1120183609.

# Start
Above all, you need to install UBUNTU18.04 on your computer and install servel necessary tool like `cmake`, `g++`, `git`. You can just use `sudo apt-get install XXX` to configure the basic tools.

Then we need to install serval libraries to our linux environment, e.g. ceres, nlopt, snopt, ipopt, cppad, libcpp, grid map, geographic, gtest and others. Now I'm going to show you how to install them all. In this tutorial I will download all the source code in `~/Download`, you can unload it after the whole installation procedure.

Most the sources code is given in this repository, but I recommend you to down load it on the official website or `git clone` them from their original repository. Please try to follow my step exactly by `git clone`, and if you have trouble with you internet, you can obtain the source code by other ways.

# ceres
Firstly, you need to install dependencies of ceres:
```
sudo apt install libsuitesparse-dev libcxsparse3 libgflags-dev libgoogle-glog-dev libgtest-dev
```
Then, you need to download the source code:
```
cd ~/Download
git clone https://github.com/ceres-solver/ceres-solver.git
```
Afer that, enter the coresponding folder "ceres-solver" and choose the version 1.14.0.
```
cd ceres-solver
git checkout -b 11.4.0
```
Then, execute the following code in turn to compile and install ceres:
```
mkdir build
cd build
cmake ..        
make -j8
sudo make install
```

Illustration: for the code above `make -j8`, 8 is the thread of your CPU. You can use `make -j12` and so on, or just `make -j`.

So far, ceres is installed on your computer.

#nlopt
In this part, firstly we still need to down load the souce code:
```
cd ~/Download
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

#snopt
This part may prone to problems, please install it step by step.














