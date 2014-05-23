## Vagrant Development Environment for ISM

## Requirements

* Vagrant https://www.vagrantup.com
* Virtualbox https://www.virtualbox.org/
* Internet Connection (to download the base box)
* Vagrant hosts plugin https://github.com/adrienthebo/vagrant-hosts

## Getting started

Clone the repo locally

```
  $ git clone https://github.com/jonmosco/vagrant_env.git
```

Checkout the submodules:

```
  $ git submodule init
  $ git submodule update
```
Edit the Vagrantfile to point to you local repo:

  Line 6
```ruby
  config.vm.synced_folder ".", "/vagrant"
```

Install the vagrant-hosts plugin:

```
  $ vagrant plugin install vagrant-hosts
```

Boot the VM:

```
  $ vagrant up
```
