#!/usr/bin/env bash

yum -y update
# yum install -y httpd

yum install -y iftop
#yum install -y iptraf
yum install -y htop
#yum install -y nethogs
#yum install -y nload
#yum install -y tcpdump
#yum install -y iotop
#yum install -y nmon
#yum install -y glances
#yum install -y dstat
#yum install -y iperf3

#yum install -y nginx
# nginx 

#if ! [ -L /var/www ]; then
#  rm -rf /var/www
#  ln -fs /vagrant /var/www
#fi

# service httpd start

yum install -y epel-release

# install python 2.7.13
yum install -y gcc
cd /usr/src
wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
tar xzf Python-2.7.13.tgz
cd Python-2.7.13
./configure
make altinstall
cd ~
python2.7 -V

#yum install -y python-pip
#pip install --upgrade pip

yum -y install ansible
ansible --version


sed -i 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg
sed -i 's/#log_path/log_path/g' /etc/ansible/ansible.cfg

cd /home/vagrant
# if yum broken
#rm -f /var/lib/rpm/__db*
#rpm --rebuilddb

systemctl list-units --type=service

sudo cp /vagrant/inventory /etc/ansible/hosts
cat /etc/ansible/hosts

#sudo ansible-playbook -e @/vagrant/security.yml /vagrant/playbook.yml --ask-pass --extra-vars='ansible_become_pass=vagrant'

#check if zookeeper is running correct
#echo stat | nc  localhost 2181
#echo mntr | nc localhost 2185
#echo ruok | nc 127.0.0.1 5111

#ansible -m setup hostname
#ansible -m debug -a "var=hostvars['hostname']" localhost
#hostvars[host]['ansible_eth0']['ipv4']['address']

#curl -X POST -H "Content-Type:application/json" http://localhost:8080/v2/apps -d@nginx-marathon.json | python -m json.tool > ./nginx-marathon.log

#check consul dns
#dig @127.0.0.1 -p 8600 consul.service._yayun.consul. ANY
# dig @node1 -p 8600 node2.node.consul.

#check docker is started?
#systemctl status docker.service
#systemctl show docker | grep EnvironmentFile
#systemctl status docker | grep Loaded
#grep EnvironmentFile /usr/lib/systemd/system/docker.service

# check haproxy status
#systemctl status haproxy.service -l
#sudo hatop -s /var/run/haproxy.sock
#systemctl list-units --type=service

# mesos-consul
# nslookup leader.mesos.service.consul
# nslookup agent.mesos.service.consul

# CPU查看命令: more /proc/cpuinfo |grep "model name"
# Mem查看命令: grep MemTotal /proc/meminfo

# sudo iptables -t nat -L