Veewee::Definition.declare({
	:hooks => {
		:before_postinstall => Proc.new { 
			definition.box.exec('mkdir /tmp/oracle')
			definition.box.scp('oracle/oracle-xe-11.2.0-1.0.x86_64.rpm.zip', '/tmp/oracle/oracle-xe-11.2.0-1.0.x86_64.rpm.zip')
			definition.box.scp('oracle/xe.rsp', '/tmp/oracle/xe.rsp')
			definition.box.scp('oracle/db_init.sql', '/tmp/oracle/db_init.sql')
		}
	},
  :cpu_count => '1',
  :memory_size=> '1024',
  :disk_size => '24280',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'RedHat6_64',
  :iso_file => "CentOS-6.3-x86_64-minimal.iso",
  :iso_src => "http://mirror.symnds.com/distributions/CentOS-vault/6.3/isos/x86_64/CentOS-6.3-x86_64-minimal.iso",
  :iso_md5 => "087713752fa88c03a5e8471c661ad1a2",
  :iso_download_timeout => 1000,
  :boot_wait => "10",
  :boot_cmd_sequence => [
    '<Tab> text ks=http://%IP%:%PORT%/ks.cfg<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => 300,
  :kickstart_file => "ks.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "veewee",
  :ssh_password => "veewee",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "/sbin/halt -h -p",
  :postinstall_files => [
    "base1.sh",
    "base2.sh",
    "vagrant.sh",
    "virtualbox.sh",
    "oracle.sh",
    "cleanup.sh",
    "zerodisk.sh"
  ],
  :postinstall_timeout => 10000
})
