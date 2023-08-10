# Ansible
# how to install Ansible
server
--------

yum install epel-release
yum update -y
yum install openssl -y
yum install ansible -y
ansible --version
cd /etc/ansible 
--------------------

vi ansible.cfg
-----------------
inventory
sudo_user

vi hosts
-----------

[surener] #server ip address
ip
ip
ip
hostname
..
..

[group1]
ip
ip
...
...
...

adduser ansible
passwd ansible

visudo
-------
ansible ALL=(ALL)  NOPASSWD: ALL

client
-------

adduser ansible
passwd ansible

visudo
-------
ansible ALL=(ALL)  NOPASSWD: ALL

su - ansible

server
--------

su - ansible

ssh-keygen -t rsa

ls -la

scp src root@ip:/path
scp -r src root@ip:/path

ssh-copy-id devops37@client-ip

ssh client-ip

ansible batch37 -m ping

ssh-copy-id ansible@localhost
------------------------------------
Some Ansible Commands 
# all means all servers, if we want we can use partucular servername or ip adderss "

ansible all -b -a "ls -l /opt"

ansible all -a "cat /etc/passwd"

ansible 192.168.58.131 -a "cat /etc/passwd"

ansible group -b -a "touch /opt/sony1"

ansible group -a "mkdir /opt/test678" -b

ansible all -m copy -b -a "src=path/of/file dest=/path"

ansible all -m yum -b -a "name=git"
ansible all -m yum -b -a "name=git state=present"

ansible all -a "yum install git -y" -b
ansible all -b -a "yum install git -y"

ansible all -m yum -b -a "name=git state=present"

ansible all -m yum -b -a "name=git state=absent"

ansible all -b -a "yum remove git -y"

ansible all -m yum -b -a "name=httpd state=present"

ansible all -m service -b -a "name=httpd state=started"

ansible all -b -a "service httpd start"

ansible group -b -a "service httpd start"
ansible all -m service -b -a "name=httpd state=started"
Ex: reloaded, restarted, started, stopped

ansible all -b -a "useradd user1"

ansible all -m user -b -a "name=alekhya state=present"

ansible group -b -a "userdel user1"

ansible all -m user -b -a "name=alekhya state=absent"

ansible all -b -a "mkdir /opt/ooooo1"

ansible all -b -a "touch /opt/abc"

ansible all -m file -b -a "path=/opt/123abc state=touch"

ansible all -m file -b -a "path=/opt/456dir state=directory"


# for instal git playbook's  (yaml)
---
- hosts: all
  become: yes
  tasks:
  - name: Installing git package
    yum: name=git state=latest
#command for run playbook: ansible-playbook filename.yaml
or we can use command without playbook. command is "ansible all -m yum -b -a "name=git state=present"

