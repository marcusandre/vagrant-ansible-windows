
# Ansible on Windows

  **Ansible and Windows are sitting in a tree and p-r-o-v-i-s-i-o-n-i-n-g!**

## Why?

  Have you ever had to install Ansible on Windows instead of a lovely Linux
  machine? And you'll need to install it if you want to simply ```vagrant up```
  with the Ansible provider enabled. Let's skip this step and spin up multiple
  connected virtual machines. Thereby we can use one instance as the
  ```[primary]``` and the others as the ```[secondary]```.

## Dependencies

  - [Virtualbox](https://www.virtualbox.org/)
  - [Vagrant](http://www.vagrantup.com/)
  - If it's impossible to run 64-Bit boxes, you could change the ```config.vm.box``` in your ```Vagrantfile``` to ```"precise32.box"```

## Installation

    $ git clone https://github.com/meggesje/vagrant-ansible-windows.git
    $ cd vagrant-ansible-windows
    $ vagrant up [primary|secondary]

## SSH

  It's important to know that you have to generate and submit your
  ```id_rsa(.pub)``` on your own for now. Or you could force the standard vagrant
  passwords in your ansible configuration.

  But that's easy as pie:

    $ ssh-keygen -t rsa -C "your-cool@email.com"
    $ ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.111.222 # pw: vagrant

  and then:

    $ ansible all -m ping

  If you'd like to use PuTTY on your windows machine you could even convert the
  %HOMEPATH%\.vagrant.d\insecure_private_key to .ppk with a tool like PuTTYGen and
  use it in your PuTTY session. Since Vagrant will forward the box ssh port to
  2222 (or 2200; just look a the boot prompt) you have to use this port instead of
  the standard ssh port ```22```.

## License

  MIT
