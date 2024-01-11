#Authored by: Nikhil Khatu for the CSC570 project

#--------------Register vh02_old ------------------
VBoxManage createvm --name "vh02_old Clone_test" --register

#-------------- Adjust the VM settings -----------------------
VBoxManage modifyvm "vh02_old Clone_test" --memory 2048 --ostype Ubuntu_64 --acpi on --vram 12 --ioapic on --pae off --rtcuseutc on --audiocontroller ac97
VBoxManage modifyvm "vh02_old Clone_test" --nic1 intnet --macaddress1 08002789cd69 --cableconnected1 on --intnet1 "net02" --nictype1 Am79C973

#------------ Enable promiscuous mode on NIC--------------------
VBoxManage setextradata "vh02_old Clone_test" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/IfPolicyPromisc" "allow-all"

#------------------Attach(and create if needed) storage to VM-------------
#VBoxManage createhd --filename "vh02_old Clone_test.vdi" --size 10000
VBoxManage storagectl "vh02_old Clone_test" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "vh02_old Clone_test" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium emptydrive
VBoxManage storagectl "vh02_old Clone_test" --name "SATA Controller" --add sata --sataportcount 1 --bootable on
VBoxManage storageattach "vh02_old Clone_test" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium /home/ngkhatu/Desktop/vh02_old\ Clone.vdi
