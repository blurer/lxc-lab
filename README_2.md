# Assumptions..

This is the doc for getting the LXC instance started for the perspective of a Ubuntu system. I am using an AWS instance running Ubuntu 16.04.

``sudo apt update -y && sudo apt upgrade -y && sudo apt install lxc -y``

Wait for a few minutes for LXC to install, then go through the setup. I allowed it to pick a random subnet.

``sudo lxd init``
```
ubuntu@ip-172-26-5-38:~/lxc-lab$ sudo lxd init
Do you want to configure a new storage pool (yes/no) [default=yes]? 
Name of the storage backend to use (dir or zfs) [default=dir]: 
Would you like LXD to be available over the network (yes/no) [default=no]? 
Do you want to configure the LXD bridge (yes/no) [default=yes]? 
Warning: Stopping lxd.service, but it can still be activated by:
  lxd.socket
LXD has been successfully configured.
```

Now, start your first container. 

``ubuntu@ip-172-26-5-38:~/lxc-lab$ lxc launch ubuntu:16.04``

After a few minutes, it will complete. Run ``lxc list`` to confirm it is running.

```
ubuntu@ip-172-26-5-38:~/lxc-lab$ lxc list
+-----------+---------+----------------------+------+------------+-----------+
|   NAME    |  STATE  |         IPV4         | IPV6 |    TYPE    | SNAPSHOTS |
+-----------+---------+----------------------+------+------------+-----------+
| one-louse | RUNNING | 10.244.203.81 (eth0) |      | PERSISTENT | 0         |
+-----------+---------+----------------------+------+------------+-----------+
```

Go ahead and destroy this container. We are going to pass our SSH keys to make things usble for Ansible and ssh without password.

``lxc delete --force <container name`` Example for me: ``lxc delete --force one-louse``

After that is finished, copy your ssh PUBLIC key. Typically this is found in ``~/.ssh/id_rsa.pub`` and then edit the default LXC profile by running ``lxc profile edit default``

```
user.user-data: |
  #cloud-config
  ssh_authorized_keys:
    - ssh-rsa <KEY>
```

Save the file and create a new container. I add the name so that it is easier to manage. 

```
ubuntu@ip-172-26-5-38:~/.ssh$ lxc launch ubuntu:16.04 u1-base
Creating u1-base
Starting u1-base
ubuntu@ip-172-26-5-38:~/.ssh$ lxc list
+---------+---------+-----------------------+------+------------+-----------+
|  NAME   |  STATE  |         IPV4          | IPV6 |    TYPE    | SNAPSHOTS |
+---------+---------+-----------------------+------+------------+-----------+
| u1-base | RUNNING | 10.244.203.114 (eth0) |      | PERSISTENT | 0         |
+---------+---------+-----------------------+------+------------+-----------+
ubuntu@ip-172-26-5-38:~/.ssh$ 
```


