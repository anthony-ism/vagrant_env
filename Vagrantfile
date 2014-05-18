# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :webserver do |webserver|
    webserver.vm.box = "ismdev_ubuntu14"
    webserver.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64/version/1/provider/virtualbox.box"
    webserver.vm.hostname = "devweb01.ismfast.com"
    webserver.vm.network :forwarded_port, guest: 80, host: 8080
  end

  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "modules"
  end

end
