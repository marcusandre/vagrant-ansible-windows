# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.6.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define :master do |master|
    master.vm.network :private_network, ip: "192.168.111.111"
    master.vm.provision :shell, :path => "bootstrap.sh"
    master.vm.provider :virtualbox do |vb|
      vb.name = "Ansible-master"
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end

  config.vm.define :slave do |slave|
    slave.vm.network :private_network, ip: "192.168.111.222"
    slave.vm.provider :virtualbox do |vb|
      vb.name = "Ansible-slave"
      vb.customize ["modifyvm", :id, "--memory", "512"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end
end
