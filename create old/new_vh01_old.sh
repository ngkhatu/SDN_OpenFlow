VBoxManage createvm --name "vh01_old" --register
VBoxManage modifyvm "vh01_old" --memory 2048 --nic1 intnet --macaddress1 auto --cableconnected1 on --intnet1 "base_net" --nictype1 82540EM --ostype Ubuntu_64 --acpi on --vram 12 --ioapic on --pae off --rtcuseutc on --audiocontroller ac97

#VBoxManage createhd --filename "vh01_old.vdi" --size 10000

VBoxManage storagectl "vh01_old" --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach "vh01_old" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium emptydrive
VBoxManage storagectl "vh01_old" --name "SATA Controller" --add sata --sataportcount 1 --bootable on
VBoxManage storageattach "vh01_old" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "vh01_old.vdi"

VBoxManage startvm "vh01_old"

