VBoxManage controlvm "vh01_old" poweroff
VBoxManage controlvm "vh02_old" poweroff
VBoxManage controlvm "vh03_old" poweroff
VBoxManage unregistervm "vh01_old" --delete
VBoxManage unregistervm "vh02_old" --delete
VBoxManage unregistervm "vh03_old" --delete

VBoxManage dhcpserver remove --netname "base_net"
VBoxManage dhcpserver remove --netname "old_net"
VBoxManage dhcpserver remove --netname "store_net"

#VBoxManage controlvm "vh01_old" poweroff
#VBoxManage controlvm "vh02_old" poweroff
#VBoxManage controlvm "vh03_old" poweroff
