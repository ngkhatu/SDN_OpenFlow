#Authored by: Nikhil Khatu for the CSC570 project

VBoxManage startvm "vh01_new Clone_test" &
VBoxManage startvm "vh02_new Clone_test" &
VBoxManage startvm "vh03_new Clone_test" &
sleep 1
VBoxManage controlvm "vh03_old Clone_test" teleport --host "localhost" --port "6002" --password csc570 &
VBoxManage controlvm "vh01_old Clone_test" teleport --host "localhost" --port "6000" --password csc570 &
VBoxManage controlvm "vh02_old Clone_test" teleport --host "localhost" --port "6001" --password csc570 &

