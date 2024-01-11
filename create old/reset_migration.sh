VBoxManage controlvm "vh01_new" poweroff
VBoxManage controlvm "vh02_new" poweroff
VBoxManage controlvm "vh03_new" poweroff
sleep 2
VBoxManage unregistervm "vh01_new" --delete
VBoxManage unregistervm "vh02_new" --delete
VBoxManage unregistervm "vh03_new" --delete

