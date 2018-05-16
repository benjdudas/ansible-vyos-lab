# ansible-vyos-lab

Requirements:
  - VirtualBox - built with v5.2.8
  - Ansible - built with v2.5.2
  - Vagrant - built with v2.0.2

`see topology file for lab layout`

What to do with this lab?:
- clone repo to local machine
- move to cloned dir
- vagrant up
- connect to mgmt node (vagrant ssh mgmt)
- switch to ansible user (sudo su /  su ansible) - playbooks are located in the home dir of ansible
- test ssh to vyos-net1 (ssh-copy-id vyos-net1)
    - Password = ansible.123
- move to playbook dir
- grab a traceroute to `net2`
    - current route is not through vyos network:
```
[root@mgmt vagrant]# traceroute net2
traceroute to net2 (192.168.10.100), 30 hops max, 60 byte packets
 1  gateway (10.0.2.2)  0.125 ms  0.047 ms  0.039 ms
 2  net2 (192.168.10.100)  0.804 ms  0.962 ms  0.985 ms
[root@mgmt vagrant]#

```
- run `vyos-routing.yml` (#ansible-playbook vyos-routing.yml)



