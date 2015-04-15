# Installing the oracle XE DB
# Unzip first
yum -y install unzip bc libaio flex
mkdir /tmp/oracle
unzip /tmp/oracle/oracle-xe-11.2.0-1.0.x86_64.rpm.zip -d /tmp/oracle

cd /tmp/oracle/Disk1
rpm -ivh oracle-xe-11.2.0-1.0.x86_64.rpm
/etc/init.d/oracle-xe configure responseFile=/tmp/oracle/xe.rsp

# Cleanup
rm -rf /home/veewee/oracle
rm -rf /home/veewee/oracle-xe-11.2.0-1.0.x86_64.rpm.zip

