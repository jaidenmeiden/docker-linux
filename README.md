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

$ apt-get install less
$ apt-get install man

# Linux console font and keytable utilities (chvt)
$ apt-get install kbd
# This package (kbd) allows you to set up the Linux console, change the font, resize 
# text mode virtual consoles and remap the keyboard. You will probably 
# want to install a set of data files, such as the one in the "console-data" package.

# Install the ssh server in the image building script
$ sudo apt-get install -y ssh
$ sudo apt-get install -y openssh-server
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

### SSH

[ssh](https://www.geeksforgeeks.org/ssh-command-in-linux-with-examples/?ref=gcse)
To exit from editor digit `Ctrl + z`

```bash
# Change ssh password
$ ssh localhost
> New password:
> Retype new password:

```

## Licencia

Copyright © 2021 JaidenMeiden.
