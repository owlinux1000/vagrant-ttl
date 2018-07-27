# Vagrant TTL(TeraTermLanguage)

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.txt)

## Install

```
$ git clone https://github.com/owlinux1000/vagrant-ttl
$ cd vagrant-ttl
$ bundle install
$ rake build
$ vagrant plugin install pkg/vagrant-ttl-X.X.X.gem
```

## Usage

You can only use this command in ```VAGRANT_CWD``` and while the virtual machine is running up.
After you executed ```vagrant ttl```, can find the file named as *.ttl.

```
$ vagrant status
Current machine states:

default                   running (virtualbox)

The VM is running. To stop this VM, you can run `vagrant halt` to
shut it down forcefully, or you can run `vagrant suspend` to simply
suspend the virtual machine. In either case, to restart it again,
simply run `vagrant up`.
$ vagrant ttl
[ INFO ] Generating default.ttl
```
