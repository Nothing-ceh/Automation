#!/bin/bash

############################################################################################
#VMware warkstaion pro  installation full setup
▶wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle

#Give executable permission of the file 
chmod +x VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle

sudo ./VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle -y
#Remove Vmware warkstaion 
rm VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle

#VMware Workstation/Player will fail to build kernel modules VMMON & VMNET
#Download the replacement files:
wget https://github.com/mkubecek/vmware-host-modules/archive/workstation-16.2.3.tar.gz
tar -xzf workstation-16.2.3.tar.gz
tar -xzf workstation-16.2.3.tar.gz
#cd into directory:
cd vmware-host-modules-workstation-16.2.3/
#Create tar files of the modules:
tar -cf vmmon.tar vmmon-only
tar -cf vmnet.tar vmnet-only
#Copy files to /usr/lib/vmware.modules.source (elevated privileges needed):
sudo cp -v vmmon.tar vmnet.tar /usr/lib/vmware/modules/source/
#Install modules (elevated privileges needed):
sudo vmware-modconfig --console --install-all

