# Ubuntu

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

This script restores content and packages that are found on a default   
Ubuntu server system in order to make this system more suitable for     
interactive use.

Reinstallation of packages may fail due to changes to the system        
configuration, the presence of third-party packages, or for other       
reasons.

This operation may take some time.

## Configuration

```Dockerfile

# The 'unminimize' command will install the standard Ubuntu Server packages 
# if you want to convert a Minimal instance to a standard Server environment 
# for interactive use.
RUN unminimize

```

## Tools

```bash

$ apt install less
$ apt install man

```

## Commands

```bash

# The 'unminimize' command will install the standard Ubuntu Server packages 
# if you want to convert a Minimal instance to a standard Server environment 
# for interactive use.
$ unminimize

# Read files
$ cat <file_name> # Short files
$ less <file_name> # Long files
$ tail -f <file_name> # read one file
$ tail -f <file_name1> <file_name2> # Read many files at once

# Man is a Unix systems tool used to document and
# learn about commands, files, system calls, etc.
$ man <command_name>

```

## Licencia

Copyright © 2021 JaidenMeiden.
