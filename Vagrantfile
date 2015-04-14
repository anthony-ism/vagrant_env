# -*- mode: ruby -*-
# vi: set ft=ruby :

#To set up a local db on the vagrant machine run these commands:
#sudo apt-get update
#sudo apt-get install mysql-server
#sudo apt-get install phpmyadmin
#sudo nano /etc/apache2/apache2.conf
#add ths line somewhere in the file: Include /etc/phpmyadmin/apache.conf
#sudo a2enmod authn_core
#sudo /etc/init.d/apache2.conf

require 'vagrant-hosts'

Vagrant.configure("2") do |config|

  config.vm.synced_folder "../", "/vagrant",id: "vagrant-root",
        :owner => "vagrant",
        :group => "www-data",
        :mount_options => ["dmode=775,fmode=664"]


  config.vm.define :webserver do |webserver|
    webserver.vm.box = "ismdev_ubuntu14"
    webserver.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64/version/1/provider/virtualbox.box"
    webserver.vm.hostname = "devweb01.ismfast.com"
    webserver.vm.network :forwarded_port, guest: 80, host: 8089
  end

  #config.vm.network "public_network"

  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end

  config.vm.provision :hosts do |provisioner|
    provisioner.add_host '10.10.30.96', ['db01']
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end



end
