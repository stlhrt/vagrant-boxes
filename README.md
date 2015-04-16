# Vagrant Base Boxes

## Downloads

## How these boxes were built

These box definitions are for automatic building using [veewee](https://github.com/jedi4ever/veewee) .

Built and released as [Vagrant](https://www.vagrantup.com/) box on [Atlas](https://atlas.hashicorp.com/woznial/boxes/centos-6.3-oracle-xe)

The definitions are roughly based on https://github.com/ismaild/vagrant-boxes , which in turn are based on stock veewee definitions for a minimal CentOS installation, with the following changes:
* Additional reboot to use installed current kernel and allow successful VBoxAddons build
* Added packages required by Oracle XE install
* More memmory by default (1G)
* Swap as required by Oracle 2048MB
* Disabled IPv6
* Disabled firewall
* Enabled HTTP access beyond localhost
* Definition contains also db_init.sql with more commented out optimizations for lighter Oracle instance
* Removed chef & puppet

```sh
$ veewee vbox build CentOS-6.3-x86_64-minimal
# Halt the VM before vagrant boxing to prevent generated ssh key replacing default vagrant key
$ veewee vbox halt CentOS-6.3-x86_64-minimal
$ vagrant package --base CentOS-6.3-x86_64 --output CentOS-6.3-x86_64-.box
```
