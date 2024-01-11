#vh01
VBoxManage createvm --name "vh01_new" --register
VBoxManage modifyvm "vh01_new" --teleporter on --teleporterport "6000" --memory 2048 --nic1 intnet --macaddress1 auto --cableconnected1 on --intnet1 "new_net" --nictype1 82540EM --ostype Ubuntu_64 --acpi on --vram 12 --ioapic on --pae off --rtcuseutc on --teleporterpassword csc570 --audiocontroller ac97
VBoxManage storagectl "vh01_new" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "vh01_new" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium emptydrive
VBoxManage storagectl "vh01_new" --name "SATA Controller" --add sata --sataportcount 1 --bootable on
VBoxManage storageattach "vh01_new" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "vh01_old.vdi"
VBoxManage startvm "vh01_new" &
#Begin flow
sleep 5
VBoxManage controlvm "vh01_old" teleport --host "localhost" --port "6000" --password csc570

#vh02
VBoxManage createvm --name "vh02_new" --register
VBoxManage modifyvm "vh02_new" --teleporter on --teleporterport "6001" --memory 2048 --nic1 intnet --macaddress1 auto --cableconnected1 on --intnet1 "new_net" --nictype1 82540EM --ostype Ubuntu_64 --acpi on --vram 12 --ioapic on --pae off --rtcuseutc on --teleporterpassword csc570 --audiocontroller ac97
VBoxManage storagectl "vh02_new" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "vh02_new" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium emptydrive
VBoxManage storagectl "vh02_new" --name "SATA Controller" --add sata --sataportcount 1 --bootable on
VBoxManage storageattach "vh02_new" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "vh02_old.vdi"
VBoxManage startvm "vh02_new" &
#begin flow
sleep 5
VBoxManage controlvm "vh02_old" teleport --host "localhost" --port "6001" --password csc570

#vh03
VBoxManage createvm --name "vh03_new" --register
VBoxManage modifyvm "vh03_new" --teleporter on --teleporterport "6002" --memory 2048 --nic1 intnet --macaddress1 auto --cableconnected1 on --intnet1 "new_net" --nictype1 82540EM --ostype Ubuntu_64 --acpi on --vram 12 --ioapic on --pae off --rtcuseutc on --teleporterpassword csc570 --audiocontroller ac97
VBoxManage storagectl "vh03_new" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "vh03_new" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium emptydrive
VBoxManage storagectl "vh03_new" --name "SATA Controller" --add sata --sataportcount 1 --bootable on
VBoxManage storageattach "vh03_new" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "vh03_old.vdi"
VBoxManage startvm "vh03_new" &
#begin flow
sleep 5
VBoxManage controlvm "vh03_old" teleport --host "localhost" --port "6002" --password csc570

