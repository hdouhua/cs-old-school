#!/usr/bin/env bash


# install VMs
multipass launch --name vm1 --cpus 2 --memory 2G --disk 5G
multipass launch --name vm2 --cpus 2 --memory 2G --disk 5G

# get IP 
multipass list | grep -e '^Name' -e vm1
multipass list | grep -e '^Name' -e vm2

# ssh vm1
multipass shell vm1
exit
multipass shell vm2
exit
