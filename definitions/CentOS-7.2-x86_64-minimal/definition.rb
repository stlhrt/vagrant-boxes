Veewee::Definition.declare({
	# :hooks => {
	# 	:before_postinstall => Proc.new {
	# 	}
	# },
  :cpu_count => '1',
  :memory_size=> '1024',
  :disk_size => '24280',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'RedHat6_64',
  :iso_file => "CentOS-7-x86_64-Minimal-1511.iso",
  :iso_src => "http://mirror.symnds.com/CentOS/7.2.1511/isos/x86_64/CentOS-7-x86_64-Minimal-1511.iso",
  :iso_md5 => "88c0437f0a14c6e2c94426df9d43cd67",
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
    "cleanup.sh",
    "zerodisk.sh"
  ],
  :postinstall_timeout => 10000
})
