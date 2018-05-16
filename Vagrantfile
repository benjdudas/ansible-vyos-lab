# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create net2 host
  config.vm.define :net2 do |net_config|
      net_config.vm.box = "centos/7"
      net_config.vm.hostname = "net2"
      net_config.vm.network :private_network, ip: "192.168.10.100"
      net_config.vm.network :private_network, ip: "192.168.20.100"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "2000"
      end
      net_config.vm.provision 'bootstrap', type: 'ansible' do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.playbook = './provisioning/bootstrap-net2.yml'
      end
  end

   # create vyos_net1 router
  config.vm.define :vyos_net1 do |net_config|
      net_config.vm.box = "higebu/vyos"
      net_config.vm.hostname = "vyos-net1"
      net_config.vm.network :private_network, ip: "10.0.20.101"
      net_config.vm.network :private_network, ip: "10.10.10.2"
      net_config.vm.network :private_network, ip: "10.10.15.2"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
      net_config.vm.provision 'bootstrap', type: 'ansible' do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.playbook = './provisioning/bootstrap-vyos.yml'
      end
  end

  # create vyos_c1 router
  config.vm.define :vyos_c1 do |net_config|
      net_config.vm.box = "higebu/vyos"
      net_config.vm.hostname = "vyos-c1"
      net_config.vm.network :private_network, ip: "172.16.20.101"
      net_config.vm.network :private_network, ip: "172.16.30.101"
      net_config.vm.network :private_network, ip: "10.10.10.3"
      net_config.vm.network :private_network, ip: "10.10.15.3"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
      net_config.vm.provision 'bootstrap', type: 'ansible' do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.playbook = './provisioning/bootstrap-vyos.yml'
      end
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
      net_config.vm.provision 'bootstrap', type: 'ansible' do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.playbook = './provisioning/bootstrap-vyos.yml'
      end
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
      net_config.vm.provision 'bootstrap', type: 'ansible' do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.playbook = './provisioning/bootstrap-vyos.yml'
      end
  end

  # create mgmt host
  config.vm.define :mgmt do |net_config|
      net_config.vm.box = "centos/7"
      net_config.vm.hostname = "mgmt"
      net_config.vm.network :private_network, ip: "10.0.20.100"
      net_config.vm.provider "virtualbox" do |vb|
        vb.memory = "2000"
      end
      net_config.vm.provision 'bootstrap', type: 'ansible' do |ansible|
        ansible.compatibility_mode = "2.0"
        ansible.playbook = './provisioning/bootstrap-mgmt.yml'
      end
  end


end
