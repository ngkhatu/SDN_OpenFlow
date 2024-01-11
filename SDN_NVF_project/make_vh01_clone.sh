#Authored by: Nikhil Khatu for the CSC570 project

#--------Register vh01_new---------------
VBoxManage createvm --name "vh01_new Clone_test" --register

#--------------Adjust the VM settings (exactly the same as old)-----------------
VBoxManage modifyvm "vh01_new Clone_test" --teleporter on --teleporterport "6000" --teleporterpassword csc570
VBoxManage modifyvm "vh01_new Clone_test" --memory 2048 --ostype Ubuntu_64 --acpi on --vram 12 --ioapic on --pae off --rtcuseutc on --audiocontroller ac97
#---------------NIC settings-------------------
VBoxManage modifyvm "vh01_new Clone_test" --nic1 intnet --macaddress1 0800272d2fe2 --cableconnected1 on --intnet1 "net04" --nictype1 Am79C973
#----------------Enable promiscuous mode on NIC---------------
VBoxManage setextradata "vh01_new Clone_test" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/IfPolicyPromisc" "allow-all"

#------------------Attach storage to VM----------------------------
VBoxManage storagectl "vh01_new Clone_test" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "vh01_new Clone_test" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium emptydrive
VBoxManage storagectl "vh01_new Clone_test" --name "SATA Controller" --add sata --sataportcount 1 --bootable on
VBoxManage storageattach "vh01_new Clone_test" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium /home/ngkhatu/Desktop/vh01_old\ Clone.vdi

