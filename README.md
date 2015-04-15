# Vagrant Base Boxes

## Downloads

## How these boxes were built

These box definitions are for automatic building using [veewee](https://github.com/jedi4ever/veewee) .

Built and released as [Vagrant](https://www.vagrantup.com/) box on [Atlas](https://atlas.hashicorp.com/woznial/boxes/centos-6.3-oracle-xe)

The definitions are roughly based on https://github.com/ismaild/vagrant-boxes , which in turn are based on stock veewee definitions for a minimal CentOS installation, with the following changes:
* Additional reboot to use installed current kernel and allow successful VBoxAddons build
* Additional apps: htop, nano
* Added packages required by Oracle XE install
* More memmory by default (1G)
* modified so the disk can grow to 200GB and provide 2.5GB of swap.
* Removed chef & puppet

```sh
$ veewee vbox define CentOS-6.3-x86_64 CentOS-6.3-x86_64-minimal
$ veewee vbox build CentOS-6.3-x86_64
# Eject the disks from the running VM and shutdown.
$ vagrant package --base CentOS-6.3-x86_64 --output CentOS-6.3-x86_64-.box
```
