# Ubuntu Image

## Additional Configuration

```Dockerfile

# The 'unminimize' command will install the standard Ubuntu Server packages 
# if you want to convert a Minimal instance to a standard Server environment 
# for interactive use.
RUN yes | unminimize

# Change the root password
RUN echo 'root:Docker!' | chpasswd
# Or
RUN echo 'Docker!' | passwd --stdin root 

# Install the ssh server in the image building script
RUN sudo apt-get install -y openssh-server
# Start the ssh server
RUN sudo /etc/init.d/ssh start
# Or probably even in the last lines of the Dockerfile
USER root
CMD [ "sh", "/etc/init.d/ssh", "start"]

```

## Tools

```bash

$ apt install vi
$ apt install less
$ apt install man
$ apt install systemctl

# Linux console font and keytable utilities (chvt)
$ apt install kbd
# This package (kbd) allows you to set up the Linux console, change the font, resize 
# text mode virtual consoles and remap the keyboard. You will probably 
# want to install a set of data files, such as the one in the "console-data" package.

# Install the ssh server in the image building script
$ sudo apt install -y ssh
$ sudo apt install -y openssh-server
# Start the ssh server
$ sudo /etc/init.d/ssh start

# Change the root password
$ passwd root

```

## Useful Commands

[cat](https://www.geeksforgeeks.org/cat-command-in-linux-with-examples/?ref=gcse)

[less](https://www.geeksforgeeks.org/less-command-linux-examples/?ref=gcse)

[tail](https://www.geeksforgeeks.org/tail-command-linux-examples/?ref=gcse)

[head](https://www.geeksforgeeks.org/head-command-linux-examples/?ref=gcse)

```bash

# The 'unminimize' command will install the standard Ubuntu Server packages 
# if you want to convert a Minimal instance to a standard Server environment 
# for interactive use.
$ unminimize

# Read files
$ cat <file_name> # Short files

$ less <file_name> # Long files

# In tail, you can press Ctrl-C to end forward mode and scroll through the file, 
# then press F to go back to forward mode again.
$ tail -f <file_name> # read one file
$ tail -f <file_name1> <file_name2> # Read many files at once

$ head -n<rows_number> # Show first -v lines
$ head -vn<rows_number> # Show the header with the file name
$ head -n<rows_number> | sort -r # Inverse order

# Man is a Unix systems tool used to document and
# learn about commands, files, system calls, etc.
$ man <command_name>

```

## Permissions (r || w || x)

[chmod](https://www.geeksforgeeks.org/chmod-command-linux/?ref=gcse)

```bash
# Values are used for permissions and the sum define specific permission
# r => 4
# w => 2
# x => 1
# - => 0

$ chmod u+x <file_name> # User (Add permissions)
$ chmod u-w <file_name> # User (Remove permissions)
$ chmod g+x <file_name> # Group
$ chmod o+x <file_name> # Others
$ chmod a+x <file_name> # all

# Assign file or directory to specific user and group
$ sudo chmod root:root <file_name>
$ sudo chmod root: <file_name> # Short command version

```

## Terminals (Commands)

[tty](https://www.geeksforgeeks.org/tty-command-in-linux-with-examples/?ref=gcse)

[chvt](https://www.geeksforgeeks.org/chvt-command-in-linux-with-examples/)

[w](https://www.geeksforgeeks.org/w-command-in-linux-with-examples/)

```bash

# Command in Unix operating systems to print the file name 
# of the terminal connected to standard input.
$ tty

# Change the virtual terminal in the foreground
$ sudo chvt 5

# W is a command line utility that displays information 
# about currently logged in users and what each user is doing.
$ w

```

### Find out information

[who](https://www.geeksforgeeks.org/who-command-in-linux/)

```bash
# Show information about users connected to the system information about system startup
$ who
$ who -H
$ who -Hu
$ who -m
$ who am i
$ whoami
$ who -b
$ who -r
$ who -q

```

### Processes on a system

[ps](https://www.geeksforgeeks.org/ps-command-in-linux-with-examples/?ref=gcse)

```bash
# Extract information about system processes
$ ps
# Show all processes
# UNIX format
$ ps -A
$ ps -e
$ ps -r
# BSD format
$ ps ax
$ ps aux
$ ps aux | grep <string_searched>
# Show all processes executed by a specific command
$ ps -C <command_name>
# Show all processes executed by a user
$ ps -u 1000
$ ps -U root -u root u
# Show processes by group property
$ ps -fG cas
$ ps -g 1
# Show processes by PID
$ ps -f --ppid <number_process>
# Show processes by TTY
$ ps -t tty1
$ ps -ft tty1

```

### Kill processes

[kill](https://www.geeksforgeeks.org/kill-command-in-linux-with-examples/?ref=gcse)

```bash
# Kill processes
$ kill <number_process>
$ kill -9 <number_process>

```

### Text editors

[vi editor](https://www.geeksforgeeks.org/vi-editor-unix/?ref=gcse)

To exit from editor digit `Ctrl + z`

```bash
# Work with text editors
$ vi <filename>
```
[jobs](https://www.cyberciti.biz/faq/unix-linux-jobs-command-examples-usage-syntax/)

[fg](https://www.geeksforgeeks.org/fg-command-in-linux-with-examples/?ref=gcse)

```bash
# Review processes 
$ jobs
# Return to previous process
$ fg 
```

Create file with `vi` editor

```bash
## Create file
$ vi script.sh
```

Content `script.sh`
```vi
#!/bin/bash
echo "Jaiden Meiden"
```
Execute script
```bash
$ ./script.sh
$ ./script.sh & # keep console
$ nohup ./script.sh & # Generate exit called  nohup.out
```

### Monitoring system resources

[top](https://www.geeksforgeeks.org/top-command-in-linux-with-examples/?ref=gcse)

[htop](https://www.geeksforgeeks.org/htop-command-in-linux-with-examples/?ref=gcse)

[htop](https://www.geeksforgeeks.org/htop-command-in-linux-with-examples/?ref=gcse)

To exit from editor digit `Ctrl + c`

```bash
$ top
$ htop

# Load average
$ cat /proc/cpuinfo | grep "processor"
# flag -i is case sensitive
$ cat /proc/cpuinfo | grep -i "Processor"

# Memory
$ free
$ free -h

# Hard disk
$ du
$ du -hsc /home/

```

[sort](https://www.geeksforgeeks.org/sort-command-linuxunix-examples/?ref=gcse)

To exit from editor digit `Ctrl + c`

```bash
# Which processes consume more CPU?
$ sudo ps auxf | sort -nr -k 3
$ sudo ps auxf | sort -nr -k 3 | head -5

# Which processes consume more RAM?
$ sudo ps auxf | sort -nr -k 4
$ sudo ps auxf | sort -nr -k 4 | head -5
```

### Network parameters analysis

[ifconfig](https://www.geeksforgeeks.org/ifconfig-command-in-linux-with-examples/?ref=gcse)

[ip](https://www.geeksforgeeks.org/ip-command-in-linux-with-examples/?ref=gcse)

[hostname](https://www.geeksforgeeks.org/hostname-command-in-linux-with-examples/?ref=gcse)

[route](https://www.geeksforgeeks.org/route-command-in-linux-with-examples/?ref=gcse)

[nslookup](https://www.geeksforgeeks.org/route-command-in-linux-with-examples/?ref=gcse)

[curl](https://www.geeksforgeeks.org/curl-command-in-linux-with-examples/?ref=gcse)

[wget](https://www.geeksforgeeks.org/wget-command-in-linux-unix/?ref=gcse)


```bash
$ ifconfig

$ ip a
$ ip -4 a # Search IPV4
$ ip -6 a # Search IPV6

# Used to obtain the DNS(Domain Name System)
$ hostname

# To display routing table in full numeric form.
$ route -n

# It is a useful command for getting information from the DNS server
$ nslookup [option]
$ nslookup google.com

# It is a command-line tool to transfer data to or from a server
$ curl [options] [URL...]

# It is the non-interactive network downloader which is used to download files from the server even when the user has not logged on to the system
$ wget [option] [URL]
```

## Package management

### Red Hat / CentOS / Fedora

Its package manager is`.rpm` (Red hat Package Manager). Package manager data base is located in `/var/lib/rpm`.

The command `rpm -qa` allows us to list all the `rpms` installed into machine. With `rpm -i package-name.rpm` install the package and with `rpm -e package-name.rpm` remove them.

The package can be installed from a repository without have to know the file route or the dependencies with the command `yum install package-name`.

We can also search specific packages with the command `yum search posible-package-name`.

### Debian / Ubuntu

Its package manager is `.deb`. We can perform installations with `dpkg -i nombre-del-paquete.deb` o repositories `apt`.

Its data base is located in `/var/lib/dpkg`. With the command `dpkg -l` list all the `debs` installed into machine. We can install the package with `dpkg -i package-name` and we remove them from the system with `dpkg -r package-name`.

If we have a configured software, we can use the command `dpkg-reconfigure package-name` run setup wizard again (If is possible).

We can also perform the installations with the command `apt install package-name` and search the package with `apt search posible-package-name`.

## Nagios: Unpacking, decompressing, compiling, and installing packages

[Nagios](https://www.nagios.org/)

Install some tools to manage MySQL database

```bash
$ sudo apt install build-essential libgd-dev openssl libssl-dev unzip apache2 php gcc libdbi-perl libdbd-mysql-perl
```

Nagios installation

```bash
$ wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.4.tar.gz -O nagioscore.tar.gz
```

Decompressing and Unpacking files with `tar`

```bash
$ tar xvzf nagioscore.tar.gz
```

Enter the folder and run the following commands:

```bash
# 1:
sudo ./configure --with-https-conf=/etc/apache2/sites-enabled
# 2:
sudo make all
# 3:
sudo make install-groups-users # Optional, If you have eeror with: sudo make install
sudo usermod -a -G nagios www-data # Optional, If you have eeror with: sudo make install
sudo make install
# 4:
sudo make install-init
# 5:
sudo make install-commandmode
# 6:
sudo make install-config
#7:
sudo make install-webconf
```

```bash
sudo systemctl (status, start, restart, reload, stop, enable, disable, list-dependencies) nagios
```

## Users, fundamental task into management of operating systems

[id](https://www.geeksforgeeks.org/id-command-in-linux-with-examples/?ref=gcse)

User passwords are store in the file `etc/shadow`, however these are encrypted

```bash
# Unique identifier for user (uid)
$ id
$ whoami

# System Users
$ cat /etc/passwd

# User passwords
$ sudo cat /etc/passwd
# Show permissions
$ ls -l /etc/passwd

# Change password
$ passwd
$ passwd <username> # Change password from others users

```

## User Groups

[useradd](https://www.geeksforgeeks.org/useradd-command-in-linux-with-examples/?ref=gcse)

[adduser](https://www.geeksforgeeks.org/adduser-command-in-linux-with-examples/?ref=gcse)

[userdel](https://www.geeksforgeeks.org/userdel-command-in-linux-with-examples/?ref=gcse)

[usermod](https://www.geeksforgeeks.org/usermod-command-in-linux-with-examples/?ref=gcse)

[sudo](https://www.geeksforgeeks.org/sudo-command-in-linux-with-examples/?ref=gcse)

[gpasswd](https://www.geeksforgeeks.org/gpasswd-command-in-linux-with-examples/?ref=gcse)

You never must modify file `etc/passwd` manually

```bash
# Unique identifier for user (uid)
# Create user without password, we should manually configure user
$ sudo useradd <username> 
# Create user with password and create directory into /home/
$ sudo adduser <username>
# Remove Users
$ userdel <username>
# Modify user information
$ usermod

# Commands History
$ history
$ history | grep passwd

# Change to another user
$ su - <username> # Switch User
$ sudo su - <username> # Switch User

# Verify groups
$ groups <username>

# Add user to a group
$ sudo gpasswd -a <username> <groupname>
$ sudo gpasswd -a <username> root # Debian (Full access)
$ sudo gpasswd -a <username> wheel # CentOS (Full access)
# Another form
$ sudo usermod -aG <groupname> <username>

# Remove user from group
$ sudo gpasswd -d <username> <groupname>

# User permission list
$ sudo -l

```

## PAM (Linux Pluggable Authentication Modules)

[PAM](https://www.pathname.com/fhs/pub/fhs-2.3.pdf)

[libpwquality-tools](https://packages.debian.org/es/sid/admin/libpwquality-tools)

`PAM` is a mechanism for users administration into operating systems.

```bash
# PAM directories
$ ls /etc/pan.d/
$ ls /etc/security/
$ ls /lib64/security/

# We can test how strong our passwords are
# CentOS
$ pwscore

# Debian
$ apt install libpwquality-tools
$ pwscore

# Permission list
$ ulimit
$ ulimit -a
# Limit permissions
$ ulimit -u <maximum-process-number>

```

Create file with `vi` editor to test `ulimit`

```bash
## Create file
$ vi script.sh
```

Content `script.sh`
```vi
#!/bin/bash
echo "Jaiden Meiden"
$0
```

Execute script
```bash
$ chmod +x script.sh
$ ./script.sh

```

Schedule limit user access to the system

```bash
# Acesses schedule
$ vi /etc/security/time.conf

```
Content `time.conf` (Example to limit schedule)
```vi
...
...
...
# Another silly example, user 'root' is denied xsh access
*;*;user1|user2|user3;wk0800-1800
# from pseudo terminals at the weekend and on mondays.
...
...
...
```

### SSH Command

SSH is a protocol that help us connect to our servers 

[ssh](https://www.geeksforgeeks.org/ssh-command-in-linux-with-examples/?ref=gcse)

To exit from editor digit `Ctrl + z`

```bash
# Activate password authentication
$ sudo vi /etc/ssh/sshd_config

# Restart the service
$ sudo systemctl stop ssh
$ sudo systemctl status ssh
$ sudo systemctl start ssh

# Generate key
$ ssh-keygen

# Copy key to server
$ ssh-copy-id -i ~/.ssh/id_rsa.pub <user>@<ip_address>

# Login with ssh
$ ssh <user>@<ip_address>
$ ssh -v <user>@<ip_address> # You can put four times letter `v`

```

Content `sshd_config` (Available options)
```vi
...
...
...
# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication yes
PermitEmptyPasswords no
...
...
...
```

```bash
# Change ssh password
$ ssh localhost
> New password:
> Retype new password:

```

### Configure DNS with `bind`

[bind](https://www.geeksforgeeks.org/bind-command-in-linux-with-examples/?ref=gcse)

[netstat](https://www.geeksforgeeks.org/netstat-command-linux/?ref=gcse)

[dig](https://www.geeksforgeeks.org/dig-command-in-linux-with-examples/?ref=gcse)

```bash
# bind installation
$ sudo apt install aptitude
$ sudo apt install net-tools
$ sudo apt install -y bind9
$ sudo apt install dnsutils

# Validate the installation with `netstat` and verify that port 53 is listening
$ netstat -ltn
# To make queries to the DNS we can use several tools, including `dig`
$ dig <server_url> @127.0.0.1
# The following after installing it is to verify everything that is included within the package
$ dpkg -L bind9

```

The main configuration file will be `/etc/bind/named.conf`, we also have the `/etc/bind/rndc.key` file in which you can configure the key that can be used to gain access to the domain name.

### Start, stop and reload services

[systemctl](https://www.geeksforgeeks.org/systemctl-in-unix/?ref=gcse)

The `systemctl` command allows us to manage the processes of our operating system. Our services may be **active** (ie turned on) or **inactive** (turned off). We can also configure whether they are **enabled** or **disabled** to run automatically at system startup.

[journalctl](https://www.geeksforgeeks.org/journalctl-command-in-linux-with-examples/?ref=gcse)

The `journalctl` command allows us to see the logs of the processes of our operating system. Remember that all of them are stored in the `/var/log/` folder.

```bash
# View the status of our services
$ sudo systemctl status <nombre-servicio>
# Enable or disable the automatic startup of our services
$ sudo systemctl (enable, disable) <nombre-servicio>
# Turn services on, off, or restart
$ sudo systemctl (start, stop, restart) <nombre-servicio>
# View all system services
$ sudo systemctl list-units -t service --all

# See the logs of our services and do a follow-up
$ sudo journalctl -fu <nombre-servi>
# See how much space our logs take up
$ sudo journalctl --disk-usage
# Show the list of computer boots
$ sudo journalctl --list-boots
# Filter the logs by the type of message
$ sudo journalctl -p (critic, info, warning, error)
# View the logs in JSON format
$ sudo journalctl -o json

```

### NGINX and NGINX Amplify

A practical guide to how Kubernetes traffic management tools – including an Ingress controller and service mesh – can help you solve the challenges of resilience, visibility, and security that come with running Kubernetes in production.

[NGINX](https://www.nginx.com/)

NGINX Amplify is a free, SaaS based monitoring tool for NGINX Open Source and NGINX Plus. With NGINX Amplify you can monitor performance, keep track of infrastructure assets, and improve configuration with static analysis. NGINX Amplify also monitors the underlying OS, application servers (like PHP FPM), databases, and other components. NGINX Amplify is simple to set up, yet powerful enough to provide critical insight into NGINX and system performance.

[NGINX Amplify](https://www.nginx.com/products/nginx-amplify/)

## Licencia

Copyright © 2021 JaidenMeiden.
