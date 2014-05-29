# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'vagrant-hosts'

Vagrant.configure("2") do |config|

  config.vm.synced_folder ".", "/var/www"

  config.vm.define :webserver do |webserver|
    webserver.vm.box = "ismdev_ubuntu14"
    webserver.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64/version/1/provider/virtualbox.box"
    webserver.vm.hostname = "devweb01.ismfast.com"
    webserver.vm.network :forwarded_port, guest: 80, host: 8088
  end

  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end

  config.vm.provision :hosts do |provisioner|
    provisioner.add_host '10.10.30.96', ['db01']
  end

end
