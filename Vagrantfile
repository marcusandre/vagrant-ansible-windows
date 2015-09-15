# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define :primary do |primary|
    primary.vm.network :private_network, ip: "192.168.111.111"
    primary.vm.provider :virtualbox do |vb|
      vb.name = "primary"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
    primary.vm.provision :shell, :path => "buildup.sh"
  end

  config.vm.define :secondary do |secondary|
    secondary.vm.network :private_network, ip: "192.168.111.222"
    secondary.vm.provider :virtualbox do |vb|
      vb.name = "secondary"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end
end
