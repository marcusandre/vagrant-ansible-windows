# Ansible on Windows

**Ansible and Windows are sitting in a tree and p-r-o-v-i-s-i-o-n-i-n-g!**

# Why?

Have you ever had to install Ansible on Windows instead of a lovely Linux
machine? And you'll need to install it if you want to simply ```vagrant up```
with the Ansible provider enabled. Let's skip this step and spin up multiple
connected virtual machines. Thereby we can use one instance as the
```[master]``` and the others as the ```[slave]```.

# Dependencies

- [Virtualbox](https://www.virtualbox.org/)
- [Vagrant](http://www.vagrantup.com/)
- If it's impossible to run 64-Bit boxes, you could change the ```config.vm.box``` in your ```Vagrantfile``` to ```"precise32.box"```

# Installation

    $ git clone https://github.com/meggesje/vagrant-ansible-windows.git
    $ cd vagrant-ansible-windows
    $ vagrant up [master|slave]

# SSH

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

# License

The MIT License (MIT)

Copyright (c) 2013 Marcus André <meggesje@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
