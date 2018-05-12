# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("6") do |config|

  # create net1 host
  config.vm.define :net1 do |net_config|
      net_config.vm.box = "centos/7"
      net_config.vm.hostname = "net1"
      net_config.vm.network :private_network, ip: "10.0.15.100"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "2000"
      end
      net_config.vm.provision :shell, path: "./bootstrap/bootstrap-net1.sh"
  end

  # create net2 host
  config.vm.define :net2 do |net_config|
      net_config.vm.box = "centos/7"
      net_config.vm.hostname = "net2"
      net_config.vm.network :private_network, ip: "192.168.10.100"
      net_config.vm.network :private_network, ip: "192.168.20.100"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "2000"
      end
      net_config.vm.provision :shell, path: "./bootstrap/bootstrap-net2.sh"
  end

   # create vyos_net1 router
  config.vm.define :vyos_net1 do |net_config|
      net_config.vm.box = "higebu/vyos"
      net_config.vm.hostname = "vyos-net1"
      net_config.vm.network :private_network, ip: "10.0.20.101"
      net_config.vm.network :private_network, ip: "10.10.10.1"
      net_config.vm.network :private_network, ip: "10.10.15.1"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
      net_config.vm.provision :shell, path: "./bootstrap/bootstrap-vyos.sh"
  end

  # create vyos_c1 router
  config.vm.define :vyos_c1 do |net_config|
      net_config.vm.box = "higebu/vyos"
      net_config.vm.hostname = "vyos-c1"
      net_config.vm.network :private_network, ip: "172.16.20.101"
      net_config.vm.network :private_network, ip: "172.16.30.101"
      net_config.vm.network :private_network, ip: "10.10.10.2"
      net_config.vm.network :private_network, ip: "10.10.15.2"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
      net_config.vm.provision :shell, path: "./bootstrap/bootstrap-vyos.sh"
  end

  # create vyos_net2_1 router
  config.vm.define :vyos_net2_1 do |net_config|
      net_config.vm.box = "higebu/vyos"
      net_config.vm.hostname = "vyos-net2-1"
      net_config.vm.network :private_network, ip: "172.16.20.100"
      net_config.vm.network :private_network, ip: "192.168.10.101"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
      net_config.vm.provision :shell, path: "./bootstrap/bootstrap-vyos.sh"
  end

  # create vyos_net2_2 router
  config.vm.define :vyos_net2_2 do |net_config|
      net_config.vm.box = "higebu/vyos"
      net_config.vm.hostname = "vyos-net2-2"
      net_config.vm.network :private_network, ip: "172.16.30.100"
      net_config.vm.network :private_network, ip: "192.168.20.101"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
      net_config.vm.provision :shell, path: "./bootstrap/bootstrap-vyos.sh"
  end

end
