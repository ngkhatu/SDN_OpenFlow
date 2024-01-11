
# Set new VM parameters and enable teleportation
# --nic<1-N> none|null|nat|bridged|intnet|hostonly|generic
#--nictype<1-N> Am79C970A|Am79C973|82540EM|82543GC|82545EM|virtio
# --intnet<1-N> network

--nic1 intnet --macaddress1 auto --cableconnected1 on --intnet1 "new_net"
--nic2 intnet --macaddress2 auto --cableconnected2 on --intnet2 ""
--nic3 intnet --macaddress3 auto --cableconnected3 on --intnet3 ""
--nic4 intnet --macaddress4 auto --cableconnected4 on --intnet4 ""
--ostype Ubuntu_64 --hwvirtex on




#pause old VMs to demonstrate old network isn't needed after migration
#VBoxManage controlvm "vh01_old" pause
#VBoxManage controlvm "vh02_old" pause
#VBoxManage controlvm "vh03_old" pause

VBoxManage controlvm "vh01_new" poweroff
VBoxManage controlvm "vh02_new" poweroff
VBoxManage controlvm "vh03_new" poweroff


VBoxManage controlvm "vh01_old" poweroff
VBoxManage controlvm "vh02_old" poweroff
VBoxManage controlvm "vh03_old" poweroff




#setup DHCP servers
VBoxManage dhcpserver add --netname "base_net" --ip 10.1.1.1 --netmask 255.255.255.0 --lowerip 10.1.1.2 --upperip 10.1.1.254--enable
VBoxManage dhcpserver add --netname "new_net" --ip 10.1.2.1 --netmask 255.255.255.0 --lowerip 10.1.2.2 --upperip 10.1.2.254 --enable
VBoxManage dhcpserver add --netname "store_net" --ip 10.1.3.1 --netmask 255.255.255.0 --lowerip 10.1.3.2 --upperip 10.1.3.254 --enable

VBoxManage dhcpserver remove --netname "base_net"
VBoxManage dhcpserver remove --netname "new_net"
VBoxManage dhcpserver remove --netname "store_net"

