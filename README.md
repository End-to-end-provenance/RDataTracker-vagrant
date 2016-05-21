# RDataTracker-vagrant

Vagrant script to setup Ubuntu image for RDataTracker demo

## Installation

In order to run the vagrant image you first need to install the following three softwares:
[Git](https://git-scm.com/book/en/v1/Getting-Started-Installing-Git)
[VirtualBox](https://www.virtualbox.org/wiki/Downloads)
[Vagrant](https://www.vagrantup.com/downloads.html).
Choose and download the version that correspond to your OS and architecture (e.g. Windows x64).

## Running the image

To run the image simply type in the terminal:
``` shell
git clone https://github.com/End-to-end-provenance/RDataTracker-vagrant.git
vagrant up
```

A guest virtual machine (VM) should be starting up.
It may take a while (depending on your connection speed, and the host performance) before the virtual machine is ready, wait for the script in the host terminal to finish before using the guest VM.

## Shared Folder

File can be shared between the host and the guest by placing them in the "shared" folder on the host and/or in "/shared" on the guest VM.