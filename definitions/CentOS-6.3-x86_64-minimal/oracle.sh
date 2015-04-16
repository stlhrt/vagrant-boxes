# Installing the oracle XE DB

# Disable ipv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

# Disable firewall
service iptables save
service iptables stop
chkconfig iptables off

# Or you can just open Oracle ports
#iptables -I INPUT 4 -m state --state NEW -p tcp --dport 1521 -j ACCEPT
#iptables -I INPUT 4 -m state --state NEW -p tcp --dport 8080 -j ACCEPT

# Unzip first
yum -y install unzip bc libaio flex
mkdir /tmp/oracle
unzip /tmp/oracle/oracle-xe-11.2.0-1.0.x86_64.rpm.zip -d /tmp/oracle

cd /tmp/oracle/Disk1
rpm -ivh oracle-xe-11.2.0-1.0.x86_64.rpm
/etc/init.d/oracle-xe configure responseFile=/tmp/oracle/xe.rsp

# Cleanup
rm -rf /tmp/oracle

# Reboot
/etc/init.d/sshd stop && reboot
