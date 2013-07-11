#!/bin/bash

VAGRANT_PATH=/home/vagrant
ANSIBLE_PATH=$VAGRANT_PATH/.ansible
ANSIBLE_HOSTS=$VAGRANT_PATH/.ansible_hosts

# Update source lists.
apt-get update -qq

# Install some tools.
apt-get install make git-core vim-nox tmux -y

# Check if the Ansible repository exists.
if [[ ! -d $ANSIBLE_PATH ]]; then
  # Install Ansible dependencies.
  apt-get install python-mysqldb python-yaml python-jinja2 python-paramiko sshpass -y

  # Checkout the Ansible repository.
  git clone https://github.com/ansible/ansible.git $ANSIBLE_PATH

  # Copy the `hosts` file to ~
  cp /vagrant/hosts $ANSIBLE_HOSTS
  chown vagrant:vagrant $ANSIBLE_HOSTS
  chmod 622 $ANSIBLE_HOSTS

  echo "source $ANSIBLE_PATH/hacking/env-setup" >> $VAGRANT_PATH/.bashrc
  echo "export ANSIBLE_HOSTS=$ANSIBLE_HOSTS" >> $VAGRANT_PATH/.bashrc
fi

echo "Done."
