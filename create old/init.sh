#start VMs
VBoxManage modifyvm "vh03_old" --nicpromisc1 allow-all --nicpromisc2 allow-all --nicpromisc3 allow-all --nicpromisc4 allow-all
VBoxManage startvm "vh01_old"
VBoxManage startvm "vh02_old"
VBoxManage startvm "vh03_old"
