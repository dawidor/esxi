NAME=$1
ID=$(vim-cmd vmsvc/getallvms | grep $1 | cut -d ' ' -f 1) 
vim-cmd vmsvc/power.on $ID


