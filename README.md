## Vagrant Development Environment for ISM

## Requirements

* Virtualbox
* Internet Connection (to download the base box)
* Vagrant hosts plugin https://github.com/adrienthebo/vagrant-hosts

## Getting started

Clone the repo locally

```
  $ git clone https://github.com/jonmosco/vagrant_env.git
```

Edit the Vagrantfile to point to you local repo:

  Line 6
  config.vm.synced_folder ".", "/vagrant"

Checkout the submodules:

```
  $ git submodule init
  $ git submodule update
```

Boot the VM:

```
  $ vagrant up
```
