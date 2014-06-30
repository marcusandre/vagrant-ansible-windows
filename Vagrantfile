# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define :master do |master|
    master.vm.network :private_network, ip: "192.168.111.111"
    master.vm.provider :virtualbox do |vb|
      vb.name = "master"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
    master.vm.provision :shell, :path => "buildup.sh"
  end

  config.vm.define :slave do |slave|
    slave.vm.network :private_network, ip: "192.168.111.222"
    slave.vm.provider :virtualbox do |vb|
      vb.name = "slave"
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
  end
end
