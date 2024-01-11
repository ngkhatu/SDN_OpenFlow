#Authored by: Nikhil Khatu for the CSC570 project

VBoxManage startvm "ofcontroller Clone"
VBoxManage startvm "router Clone"
sleep 1
VBoxManage startvm "vh03_old Clone_test"
sleep 5
VBoxManage startvm "vh01_old Clone_test"
VBoxManage startvm "vh02_old Clone_test"

