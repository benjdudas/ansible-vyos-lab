# ansible-vyos-lab

Requirements:
  - VirtualBox - built with v5.2.8
  - Ansible - built with v2.5.2
  - Vagrant - built with v2.0.2

`see topology file for lab layout`

What do do with this mess?:
- clone repo to local machine
- move to cloned dir
- vagrant up
- connect to mgmt node (vagrant ssh mgmt)
- switch to ansible user (sudo su /  su ansible) - playbooks are located in the home dir of ansible
- test ssh to vyos-net1 (ssh-copy-id vyos-net1)
    - Password = ansible.123
- move to playbook dir
- test ping net2 server (will be good if you can tmux or open new term to keep a constant ping going)
    - ping will fail since no routing config has been push to vyos nodes
- run ``vyos-routing.yml` (#ansible-playbook vyos-routing.yml)
- wait for ping to be succesfull to net2 server


