#!/bin/bash

for i in lscpu lshw hwinfo lspci lsscsi lsusb inxi lsblk df 'fdisk -l' mount free dmidecode 
do
    echo ^^^^^^ $i ^^^^^^
    eval $i
done
