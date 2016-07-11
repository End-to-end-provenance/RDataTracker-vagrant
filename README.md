# RDataTracker-vagrant

Vagrant script to provision an Ubuntu image to run RDataTracker demo

## Installation

In order to run the vagrant image you first need to install the following three softwares:
[Git](https://git-scm.com/book/en/v1/Getting-Started-Installing-Git)
[VirtualBox](https://www.virtualbox.org/wiki/Downloads)
[Vagrant](https://www.vagrantup.com/downloads.html).
Download the version corresponding to your OS and architecture (e.g. Windows x64).

On Ubuntu simply:
``` shell
sudo apt-get install virtualbox
sudo apt-get install vagrant
```


## Running the image

To run the image simply type in the terminal:
``` shell
git clone https://github.com/End-to-end-provenance/eeProv-vagrant.git
cd RDataTracker-vagrant
vagrant up
```

A guest virtual machine (VM) should be starting up.
It may take a while (depending on your connection speed, and the host performance) before the virtual machine is ready, wait for the script in the host terminal to finish before using the guest VM.

## Guest VM info
Username: vagrant
Password: vagrant

WARNING: US keyboard

Ubuntu 16.04

## Shared Folder

Files can be shared between the host and the guest by placing them in the "shared" folder on the host and/or in "/shared" on the guest VM.
