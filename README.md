# lxc-lab
Scripts to quickly build, manage, and destory LXC containers for automation testing. 

## Target audiance

I lab stuff. A lot. This is targeted at people that are testing shell, Ansible, etc. scripts on a regular basis and don't want to break or spin up VMs for this. 

## Requirements
* LXC
* LXD
* sem (thredding)
* SSH keys added to LXC default profile

## Usage

git clone blah blah
cd lxc-lab
chmod +x *.sh
Ensure your SSH key is in the lxc default profile
Build a 

## Example
[https://github.com/blurer/lxc-lab/EXAMPLE.md]

## Files 
menu.sh
- Build -> create.sh
- Restart -> restart.sh
- Stop -> stop.sh
- Destroy ->destroy.sh

## Deeper
* menu.sh: Easy menu to manage.
* restart.sh: Restarts all LXC containers starting with u#
* stop.sh: Stops all LXC containers starting with u#
* destroy.sh: Force stop and deletion of all containers starting with u#

# Next steps
* Fix parallel creation and destruction of containers, will improve performance.
* Add options for different sizes (t2.nano, t2.micro, 128mb, etc).
* Include basic Ansible playbooks

