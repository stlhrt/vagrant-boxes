# Installing the oracle XE DB

echo "Disabling IPv6 ####################################################"
# Disable ipv6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
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

echo ". /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh" >> /home/vagrant/.bashrc

source /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
echo exit | sqlplus -S system/manager@localhost/xe @/tmp/oracle/db_init.sql

# Cleanup
rm -rf /tmp/oracle

# Reboot
/etc/init.d/sshd stop && reboot
