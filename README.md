Axel's Ansible Playbooks to Tweak Raspberry Pi Installations
============================================================

Motivation
----------

To deploy [Debian](https://www.debian.org/) or
[Raspbian](https://www.raspbian.org/) to a
[Raspberry Pi](https://www.raspberrypi.org/), you usually install a
precompiled image on an SD card. Usually these images contain some
packages you don't want and miss some other packages, you always want
to have installed.

These Ansible playbooks tweak a Raspbian Jessie installation based on
the 
[official Raspbian 8 Jessie Lite images by the Raspberry Pi Foundation](https://www.raspberrypi.org/downloads/raspbian/)
or
[Debian 8 Jessie images by Sjoerd Simons](http://sjoerd.luon.net/posts/2015/02/debian-jessie-on-rpi2/).

Requirements
------------

* A local network with dynamic DNS, e.g. one with `dnsmasq` as DHCP
  server and DNS cache, which allows lookups without domain.
* The playbooks are primarily to fix annoyances with the named images
  and hence also rely on some properties of those images like their
  default hostnames (`jessie-rpi` or `raspberrypi`)
* NOOBS based images not (yet) supported.

Things To Do Manually Before Running The Playbooks
--------------------------------------------------

* Copy the image to an SD card
* Plug the SD card into the Raspberry Pi, power it on and check 
* Copy your SSH public key to `.ssh/authorized_keys` to the Raspberry
  Pi:
  * Debian: `ssh-copy-id root@jessie-rpi` (Password: `debian`)
  * Raspbian: `ssh-copy-id pi@raspberrypi` (Password: `raspberry`)


Things To Do Manually After Running The Playbooks
-------------------------------------------------

* Reboot
* Purge package `systemd`. A simple `aptitude install` should already suffice.
