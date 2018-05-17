# ansible-vyos-lab

Requirements:
  - VirtualBox - built with v5.2.8
  - Ansible - built with v2.5.2
  - Vagrant - built with v2.0.2

`see topology file for lab layout`

What to do with this lab?:
- clone repo to local machine
- move to cloned dir
- Run `vagrant up` to launch lab
- connect to mgmt node (#vagrant ssh mgmt)
- switch to ansible user (sudo su /  su ansible) - playbooks are located in the home dir of ansible
- move to playbook dir
- run `vyos-info.yml` (#ansible-playbook vyos-info.yml)
  - This will grab the current interface and routing config on vyos-net1
  - No ospf routes should be present and will be configured in the next playbook

```
ok: [vyos-net1] => {
    "msg": [
        [
            "Codes: K - kernel route, C - connected, S - static, R - RIP, O - OSPF,",
            "       I - ISIS, B - BGP, > - selected route, * - FIB route",
            "",
            "S>* 0.0.0.0/0 [210/0] via 10.0.2.2, eth0",
            "C>* 10.0.2.0/24 is directly connected, eth0",
            "C>* 10.0.20.0/24 is directly connected, eth1",
            "C>* 10.10.10.0/24 is directly connected, eth2",
            "C>* 10.10.15.0/24 is directly connected, eth3",
            "C>* 127.0.0.0/8 is directly connected, lo"
        ]
    ]
}

```
- run `vyos-routing.yml` (#ansible-playbook vyos-routing.yml)
- rerun `vyos-info` until you see all routes confirged (this may take a few runs)

```
ok: [vyos-net1] => {
    "msg": [
        [
            "Codes: K - kernel route, C - connected, S - static, R - RIP, O - OSPF,",
            "       I - ISIS, B - BGP, > - selected route, * - FIB route",
            "",
            "O>* 0.0.0.0/0 [110/10] via 10.10.10.3, eth2, 00:00:26",
            "  *                    via 10.10.15.3, eth3, 00:00:26",
            "S   0.0.0.0/0 [210/0] via 10.0.2.2, eth0",
            "O   1.1.1.1/32 [110/10] is directly connected, dum0, 00:01:16",
            "C>* 1.1.1.1/32 is directly connected, dum0",
            "O>* 2.2.2.2/32 [110/20] via 10.10.10.3, eth2, 00:00:27",
            "  *                     via 10.10.15.3, eth3, 00:00:27",
            "O>* 3.3.3.3/32 [110/30] via 10.10.10.3, eth2, 00:00:09",
            "  *                     via 10.10.15.3, eth3, 00:00:09",
            "O>* 4.4.4.4/32 [110/30] via 10.10.10.3, eth2, 00:00:09",
            "  *                     via 10.10.15.3, eth3, 00:00:09",
            "O   10.0.2.0/24 [110/10] is directly connected, eth0, 00:01:17",
            "C>* 10.0.2.0/24 is directly connected, eth0",
            "C>* 10.0.20.0/24 is directly connected, eth1",
            "O   10.10.10.0/24 [110/10] is directly connected, eth2, 00:01:20",
            "C>* 10.10.10.0/24 is directly connected, eth2",
            "O   10.10.15.0/24 [110/10] is directly connected, eth3, 00:01:18",
            "C>* 10.10.15.0/24 is directly connected, eth3",
            "C>* 127.0.0.0/8 is directly connected, lo",
            "O>* 172.16.20.0/24 [110/20] via 10.10.10.3, eth2, 00:00:27",
            "  *                         via 10.10.15.3, eth3, 00:00:27",
            "O>* 172.16.30.0/24 [110/20] via 10.10.10.3, eth2, 00:00:27",
            "  *                         via 10.10.15.3, eth3, 00:00:27",
            "O>* 192.168.10.0/24 [110/30] via 10.10.10.3, eth2, 00:00:09",
            "  *                          via 10.10.15.3, eth3, 00:00:09",
            "O>* 192.168.20.0/24 [110/30] via 10.10.10.3, eth2, 00:00:09",
            "  *                          via 10.10.15.3, eth3, 00:00:09"
        ]
    ]
}

```



