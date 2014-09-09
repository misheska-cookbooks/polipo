# polipo cookbook

## Overview

Install [Polipo](http://www.pps.univ-paris-diderot.fr/~jch/software/polipo/)
caching web proxy.

with the default configuration, you can access the web interface on port 812 via 
http://192.168.33.34:8123

[![web interface](https://github.com/misheska-cookbooks/polipo/raw/master/img/web_interface.png)]

## Prerequisites

Install the [Chef Development Kit](http://www.getchef.com/downloads/chef-dk)
for your platform.

Enable your shell environment to use the ChefDK ruby:

    eval "$(chef shell-init bash)"

Install the following virtualization software:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)
