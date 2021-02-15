---
date: 2020-06-13 18:01
---
# Swift on ARM - Supporting ARM in Swift Package CI


In a previous post, I already talked about how to setup your Swift package for CI success. However, I recently came across how to run your CI in Travis and GitHub Actions to test on Linux ARM machines. In this article, I'm going to go over how to setup your Linux CI for ARM architecture as well as how to install Swift on those ARM machines.


## ARM in Travis-CI


Currently on Travis-CI, different CPU architectures are supported in an alpha stage. However it is fairly easy to setup. Within your travis-ci.yml file, simply specify your CPU architecture. For instance, if you'd like to test on both with a build matrix, you can start your file with:


```swift
arch:
  - amd64
  - arm64
os: linux  # different CPU architectures are only supported on Linux
```


As you can see we are using the default version of Linux supported by Travis-CI. If you wish to expand your matrix, and specify different versions of Ubuntu, you can by:


```swift
jobs:
  include:
    - os: linux
      dist: bionic
      arch: amd64
    - os: linux
      dist: focal
      arch: amd64
    - os: linux
      dist: bionic
      arch: arm64
    - os: linux
      dist: focal
      arch: arm64
```


This will allow us to test on four VMs each using Ubuntu 18.04 and Ubuntu 20.04 while testing both x86/AMD64 and 64-bit ARM. 


## ARM in GitHub Actions


Likewise, in GitHub Actions, you can do this, however you'll need to use QEMU to emulate the ARM architecture. Luckily there's a GitHub Action to simplify this. Using this run-on-arch-action, we then add a script to install Swift and run our test.



For instance, I will setup a separate workflow file for ARM arm.yml. Inside I setup a build matrix for each version of Ubuntu as well as for ARM. As we'll see there are separate procedures for installing Swift on ARM, which we'll need to follow. Therefore, it's best to keep a separate workflow file for arm as opposed to standard x86.



Inside the workflow file arm.yml, I start off with:


```swift
name: arm

on: [push]

jobs:
  build:
    env:
      PACKAGE_NAME: {{ Insert Package Name Here }}
      SWIFT_VER: 5.2.4

    strategy:
      matrix:
        architecture:  [aarch64]
        distribution: [ubuntu16.04,ubuntu18.04,ubuntu20.04]
    steps:
    - uses: actions/checkout@v2
    - name: Build with Swift on arm
      uses: uraimo/run-on-arch-action@master
      env:
         {{ any environment keys here }}
      with:
        architecture: ${{ matrix.architecture }}
        distribution: ${{ matrix.distribution }}
        run: |
...
```


Now we have the beginning of the setup for Travis-CI and GitHub for ARM on Linux. However, the challenge will be installing Swift.


## Preparing Swift on ARM


Before running your test and building your Swift package, you need make sure your CI instance is ready. This includes installing prerequisites and installing Swift. There are a few differences in preparing your instance on GitHub and Travis-CI due to how they implement the different CPU architectures. However I will do my best to note those differences below.


### Installing Prerequisites on GitHub


Since Travis-CI uses LXD and the GitHub Action uses QEMU, it seems GitHub requires more prerequisites to install Swift. 



With Travis-CI, we can simply follow guidelines of what required for various Linux distributions. However GitHub needs a few other requirements:


-   curl, sudo which are need for installation are not included
-   tzdata which is required for installing Swift requires the time zone be set beforehand. Otherwise, the installation will stall on a terminal dialog.
-   In order dynamically install prerequisites based on Linux distribution, we need lsb_release installing to do some logic in our script.


Therefore before installing our prerequisites we need to do this:


```swift
# tell the installation this is non-interactive
          export DEBIAN_FRONTEND=noninteractive
# set your time zone here
          ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
# install sudo, curl, lab-release, and clang
          apt update
          apt install -y curl lsb-release sudo clang
# grab the release name, number in dot (18.04) and non-dot (1804 format
          RELEASE_DOT=$(lsb_release -sr)
          RELEASE_NUM=${RELEASE_DOT//[-._]/}
          RELEASE_NAME=$(lsb_release -sc)
```

### Installing Swift Prerequisites


Following the guidelines provided by the Swift team, we can simply check the Ubuntu version and install our prerequisites. Here's a snippet which checks for Ubuntu Focal Fossa 20.04, and installs the required packages:


```swift
          if [[ $RELEASE_DOT == "20.04" ]]; then
            sudo apt-get -y install \
                    binutils \
                    git \
                    gnupg2 \
                    libc6-dev \
                    libcurl4 \
                    libedit2 \
                    libgcc-9-dev \
                    libpython2.7 \
                    libsqlite3-0 \
                    libstdc++-9-dev \
                    libxml2 \
                    libz3-dev \
                    pkg-config \
                    tzdata \
                    zlib1g-dev
            elif [[ $RELEASE_DOT == "16.04" ]]; then
...
```


On GitHub, after installing tzdata make sure run:


```swift
dpkg-reconfigure --frontend noninteractive tzdata
```


Now we can move forward with actually installing Swift.


### Installing Swift on ARM


Installing Swift on ARM will simply need adding the repository and installing via apt:


```swift
curl -s https://packagecloud.io/install/repositories/swift-arm/release/script.deb.sh | sudo bash
apt-get install -y swift5
```


While typically, you may need to add the PATH, since we are using apt-get install swift is already added to our path.



If you are using a single script on Travis-CI for both amd64 and arm64, you can use some logic to differentiate the installation process using the TRAVIS_CPU_ARCH variable:


```swift
  if [[ $TRAVIS_CPU_ARCH == "arm64" ]]; then
    curl -s https://packagecloud.io/install/repositories/swift-arm/release/script.deb.sh | sudo bash
    sudo apt-get install swift5
  else 
     wget https://swift.org/builds/swift-${SWIFT_VER}-release/ubuntu${RELEASE_NUM}/swift-${SWIFT_VER}-RELEASE/swift-${SWIFT_VER}-RELEASE-ubuntu${RELEASE_DOT}.tar.gz
     tar xzf swift-${SWIFT_VER}-RELEASE-ubuntu${RELEASE_DOT}.tar.gz
  fi 
```


For this point, you can run swift build or swift test easily in your CI's build process.


## Getting Ready for Swift on ARM


With the increased use of ARM on a variety of devices, it's important to make sure your Swift package works everywhere. For instance, you may want to build an IOT device and make sure your package works on a Raspberry PI. If that's the case, this is great way to get started. If you'd like more guidance, feel free to look at my current example on EggSeed and other Swift Packages. Once this is implemented on your CI setup, you can be confident your Swift package is ARM-ready.