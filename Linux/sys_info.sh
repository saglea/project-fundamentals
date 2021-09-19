#!/bin/bash

if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi

if [ -f $output ]
then
rm $output
fi

files=(
'/etc/passwd'
'/etc/shadow'
)

#Displays permissions of each file in your file list.
echo -e "\nThe permissions for sensitive /etc files: \n" >> $output
for file in  ${files[@]}
do
   ls -l $file >> $output
done
#checks for sudo abilities of each user that has a home directory
for user in $(ls /home)
do
    sudo -lU $user
done


for x in {0..2}
do
  results=$(${commands[$x]})
  echo "Results of \"commands[$x]}\"commands:"
  echo $results
  echo ""

done

#Define list to use later. 

commands=(
   'date'
   'uname -a'
   'hostname -s'




echo "A Quick System Audit Script" >>  $output
date >> $output
echo "" >> $ouput
echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $putput
echo -e "Uname info: $(uname -a) \n" >> $outputt
echo -e "$ip \n"  >> $putput
echo "Hostname: $(hostname -s) " >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
echo "Memory Info:" >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWHo is logged in: \n $(who -a) \n" >> $output
echo -e "\nexec Files:" >> $output
echo $execs >> $output
echo -e "\nTop 10 Processes" >> $output
ps aux -m |awk {'print $1, $2, $3, $4, $11'} | head >> $output

output=$HOME/research/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
execs=$(find /home -type f -perm 777)

