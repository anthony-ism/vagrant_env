  ## Vagrant Development Environment for ISM

## Requirements

* Vagrant https://www.vagrantup.com
* Virtualbox https://www.virtualbox.org/
* Internet Connection (to download the base box)
* Vagrant hosts plugin https://github.com/adrienthebo/vagrant-hosts

## Getting started

Clone the repo locally

```
  $ git clone https://github.com/anthony-ism/vagrant_env.git
```

After the repo is cloned locally, cd into the vagrant_env. Inside the vagrant_env, checkout the project's branch (ie "git checkout colin.isminc.com
" for the Colins System). If this is a new project, create a new branch. Reference the Master ISM Port Guide and uptick the 80 port 1 (ie from 8090 to 8091). Add an entry to the Master ISM Port Guide for everyone else's reference as well.

Inside the vagrant_env, checkout the submodules:

```
  $ git submodule init
  $ git submodule update
```

Inside the vagrant_env, install the vagrant-hosts plugin:

```
  $ vagrant plugin install vagrant-hosts
```

Boot the VM:

```
  $ vagrant up
```
