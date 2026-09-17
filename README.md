# homelab-setup

## About
This repo is an IaC representation of my homelab.

It serves primarily as a showcase of my DevOps skills and a playground.

## Features
Names in brackets are inventory groups.
### Common
- Install required packages
### Docker (`docker`)
- Configure Docker daemon
- Set up a `docker` user with full access to Docker features (user in `docker` group, allowing rootless access)
- Add custom bash aliases to .bashrc
### Network
- Deploy pi-hole (DNS server) (`pihole`)
- Deploy monitoring tools (Grafana, Prometheus, node-exporter) with some basic templates for system resource monitoring (`monitoring`)
- Deploy wg-easy (a Wireguard server GUI helper) (`wg-easy`)
- Configure an NFS server on a disk with label set up in `ansible/inventories/homelab/group_vars/nfs.yml` (`nfs`)
### Backups
- Set up cyclic backup using `restic` (`restic`)


It is highly configurable, by making changes to inventory (`ansible/inventories/homelab/hosts.yml`) and variables (`ansible/inventories/homelab/group_vars.yml` and `host_vars.yml`).



## Prerequisites
- Debian- or RedHat-based distro (tested on Debian 13 and Fedora 44)
- Ansible installed on local machine

## Running
To run:
1. Create an `ansible` Linux user with passwordless sudo (`visudo` -> add `ansible ALL=(ALL) NOPASSWD: ALL` at the end of the file)
1. Modify the inventory - change the IP address, on an existing alias or set up a new one
1. Make sure the SSH port is open on the firewall
1. (optional) Choose the features you want by adding the alias to the desired groups (based on description above)
1. Run:
    ```bash
    ansible-galaxy collection install -r ansible/requirements.yml

    ansible-playbook \
    -i ansible/inventories/homelab/hosts.yml \
    ansible/playbooks/common-install.yml \
    --ask-vault-pass
    ```
