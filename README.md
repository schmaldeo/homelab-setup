# homelab-setup

## About
This repo is a GitOps representation of my homelab. It doesn't serve a real purpose other than my own GitHub Actions testing and a demonstration of my DevOps skills.

To run:
```bash
ansible-galaxy collection install -r ansible/requirements.yml

ansible-playbook \
  -i ansible/inventories/homelab/hosts.yml \
  ansible/playbooks/common-install.yml \
  --ask-vault-pass
```
