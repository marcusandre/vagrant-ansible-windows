#!/bin/bash

VAGRANT_PATH=/home/vagrant
ANSIBLE_PATH=$VAGRANT_PATH/.ansible

# Update source lists.
apt-get update -qq

# Install some tools.
apt-get install make git-core vim-nox tmux -y

# Check if the Ansible repository exists.
if [[ ! -d $ANSIBLE_PATH ]]; then
  # Install Ansible dependencies.
  apt-get install python-yaml python-jinja2 python-paramiko -y

  # Checkout the Ansible repository.
  git clone https://github.com/ansible/ansible.git $ANSIBLE_PATH

  echo "source $ANSIBLE_PATH/hacking/env-setup" >> $VAGRANT_PATH/.bashrc
fi

echo "Done."
