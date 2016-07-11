# -*- mode: ruby -*-
# vi: set ft=ruby :

require './vagrant-provision-reboot-plugin'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "boxcutter/ubuntu1604-desktop"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./shared", "/shared"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
   # Display the VirtualBox GUI when booting the machine
   vb.gui = true
   # Customize the amount of memory on the VM:
   vb.memory = 2048
   # Customize CPU cap
   vb.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
   # Customize number of CPU
   vb.cpus = 2
   # Customize VM name
   vb.name = "eeProv"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
	sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
	sudo gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
	sudo gpg -a --export E084DAB9 | sudo apt-key add -
	sudo apt-get -y update
	sudo apt-get -y dist-upgrade
	sudo apt-get -y -f install
	sudo apt-get -y -f install r-base
	sudo apt-get -y -f install r-base-dev
	sudo apt-get -y -f install git
	sudo apt-get -y -f install openjdk-8-jre
	sudo apt-get -y -f install openjdk-8-jdk
	sudo apt-get -y -f install ant
	sudo apt-get -y -f install libcurl4-gnutls-dev
	sudo apt-get -y -f install libxml2-dev
	sudo apt-get -y -f install libssl-dev
	sudo apt-get -y -f install libjpeg62
	sudo apt-get -y -f install libgstreamer0.10-0
	sudo apt-get -y -f install libgstreamer-plugins-base0.10-0
	sudo apt-get -y -f install make
	sudo apt-get -y -f install texlive
	sudo apt-get -y -f install libhunspell-dev
	sudo dpkg -i /shared/rstudio-0.99.902-amd64.deb
	sudo apt-get -y -f install
	localectl set-locale LANG="en_US.UTF-8"
	sudo locale-gen
	echo "Installing RDataTracker..."
	sudo chmod +x /shared/install.sh
	sudo /shared/install.sh
	echo "Installing DDG..."
	cd /home/vagrant/ && git clone https://github.com/End-to-end-provenance/DDG-Explorer.git
	cd /home/vagrant/DDG-Explorer && ant build-project
	cd /home/vagrant/DDG-Explorer && ant ddg-explorer
	echo "Preparing desktop..."
	ln -s /home/vagrant/DDG-Explorer/ddg-explorer_2.7.0.jar /home/vagrant/Desktop/DDG-explorer.jar
	ln -s /usr/lib/rstudio/bin/rstudio /home/vagrant/Desktop/RStudio
  SHELL
  
  config.vm.provision :unix_reboot
end
