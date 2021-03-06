# Pitagora-Galaxy 0.3.5

## Installation

The scripts are tested on Ubuntu 16.04.3.

* AWS: Ubuntu Server 16.04 LTS (HVM), SSD Volume Type (ami-15872773)

Install Git and clone this repository.

    $ sudo apt-get update
    $ sudo apt-get install -y git
    $ git clone -b v0.3.5 https://github.com/pitagora-galaxy/pitagora-galaxy.git
    $ cd pitagora-galaxy/scripts

Install OS Packages, Python, Galaxy. Set MySQL password to 'galaxy' when its prompt asks.

    $ sh 01_install.sh
    ..
    serving on http://127.0.0.1:8080
    (Ctl + C to exit)

Configure Galaxy installation (database, disks, proxy, etc.)

* AWS: Edit this script: /dev/sd[b|c] to /dev/xvd[b|c]
```
$ sh 02_config.sh
..
/dev/sdb is entire device, not just one partition!
Proceed anyway? (y,n) y
..
/dev/sdc is entire device, not just one partition!
Proceed anyway? (y,n) y
..
Miniconda2 will now be installed into this location:
/home/ubuntu/miniconda2
[/home/ubuntu/miniconda2] >>> Enter
..
Do you wish the installer to prepend the Miniconda2 install location
to PATH in your /home/ubuntu/.bashrc ? [yes|no]
[no] >>> no
```

Access http://<ip_address>/galaxy/ and create an admin user as admin@pitagora-galaxy.org. Then create an api key.

Install Galaxy tools from ToolShed or from GitHub.

    $ . ~/.profile
    $ sh 03_tools.sh <api_key>

Import Pitagora's workflows.

    $ sh 04_workflows.sh <api_key>

## Workflows

* For the details of workflows, see our [wiki](http://wiki.pitagora-galaxy.org/wiki/index.php/Workflows).
