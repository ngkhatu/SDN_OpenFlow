#Authored by: Nikhil Khatu for the CSC570 project

#--------------Register vh03_old ------------------
VBoxManage createvm --name "vh03_old Clone_test" --register

#-------------- Adjust the VM settings -----------------------
VBoxManage modifyvm "vh03_old Clone_test" --memory 2048 --ostype Ubuntu_64 --acpi on --vram 12 --ioapic on --pae off --rtcuseutc on --audiocontroller ac97
#-------------NIC settings--------------------------
VBoxManage modifyvm "vh03_old Clone_test" --nic1 intnet --macaddress1 auto --cableconnected1 on --intnet1 "net01" --nictype1 Am79C973
VBoxManage modifyvm "vh03_old Clone_test" --nic2 intnet --macaddress2 auto --cableconnected2 on --intnet2 "net02" --nictype2 Am79C973
VBoxManage modifyvm "vh03_old Clone_test" --nic3 intnet --macaddress3 auto --cableconnected3 on --intnet3 "net03" --nictype3 Am79C973
VBoxManage modifyvm "vh03_old Clone_test" --nic4 intnet --macaddress4 080027bbd531 --cableconnected4 on --intnet4 "netof01" --nictype4 Am79C973
#------------ Enable promiscuous mode on NIC--------------------
VBoxManage setextradata "vh03_old Clone_test" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/IfPolicyPromisc" "allow-all"
VBoxManage setextradata "vh03_old Clone_test" "VBoxInternal/Devices/pcnet/1/LUN#0/Config/IfPolicyPromisc" "allow-all"
VBoxManage setextradata "vh03_old Clone_test" "VBoxInternal/Devices/pcnet/2/LUN#0/Config/IfPolicyPromisc" "allow-all"

#------------------Attach(and create if needed) storage to VM-------------
#VBoxManage createhd --filename "vh03_old Clone_test.vdi" --size 10000
VBoxManage storagectl "vh03_old Clone_test" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "vh03_old Clone_test" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium emptydrive
VBoxManage storagectl "vh03_old Clone_test" --name "SATA Controller" --add sata --sataportcount 1 --bootable on
VBoxManage storageattach "vh03_old Clone_test" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium /home/ngkhatu/Desktop/vh03_old\ Clone.vdi

