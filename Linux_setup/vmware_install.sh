#!/bin/bash
#Uninstall old version VMware workstation pro 
sudo vmware-installer --uninstall-product vmware-workstation  --yes
############################################################################################

#Then, install the prerequisites, GNU Compiler Collection and Build Essential, which will be used during the installation process. Run the command:
sudo apt install gcc build-essential
#VMware warkstaion pro  installation full setup
wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle

#Give executable permission of the file 
chmod +x VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle

sudo ./VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle -y
#Remove Vmware warkstaion 
rm VMware-Workstation-Full-16.2.3-19376536.x86_64.bundle
#Install modules (elevated privileges needed):
sudo vmware-modconfig --console --install-all

#Licence Key free 
echo " YF390-0HF8P-M81RQ-2DXQE-M2UT6

ZF71R-DMX85-08DQY-8YMNC-PPHV8  "