Automated install of Openstack (Packstack) on the free version of VMware ESXi 6.5

## Requirements

- Free version of VMware ESXi 6.5 (might work with other versions)
- SSH-enabled in the ESXi server
- Passwordless login (ssh authorized keys) to ESXi server
- Docker


## Usage
Load the necessary ssh keys into an ssh-agent

Create a .env file based on the env.example from the repo

Configure `playbooks/vars.yaml` and `hosts` to fit your environment


## To install the openstack node

`openstack.sh deploy`

and follow the prompts

## To remove the openstack node

`openstack.sh destroy`

## Credits
Manual steps and ideas from:

https://computingforgeeks.com/install-and-configure-openstack-on-centos/

https://linuxhint.com/install_openstack_vmware_esxi/

https://www.linuxtechi.com/install-openstack-centos-8-with-packstack/