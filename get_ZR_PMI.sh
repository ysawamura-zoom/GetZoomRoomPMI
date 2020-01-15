#!/bin/bash
###########################################################################
# Shell script to print out PMI number of each ZoomRoom from the tenant
# This script will require jq
# tested on MacOS 10.14
# Get the token from Zoom's Marketplace and place it.
# 2. Change the permission to 755 and run it
#
# example
# chmod 755 ./get_ZR_PMI.sh
# ./get_ZR_PMI.sh
#

token="!!!!!!!!!REPLACE WITH YOUR OWN TOKEN!!!!!!!!!"
touch ./1.log
touch ./2.log
touch ./3.log

input1="./1.log"
input2="./2.log"
input3="./3.log"

curl --request GET --url 'https://api.zoom.us/v2/rooms?page_size=30' --header 'authorization: Bearer '$token > $input1
cat $input1 | jq '.rooms' | jq '.[]' | jq '.id' >> $input2

touch 3.sh
echo "#!/bin/sh" > 3.sh

while IFS= read -r line2
do
  echo "curl -s --request GET --url https://api.zoom.us/v2/users/$line2 --header 'authorization: Bearer $token' >> $input3" >> 3.sh
  echo "echo \ >> $input3" >> 3.sh
done < "$input2"

chmod 755 3.sh
./3.sh


while IFS= read -r line3
do
 val1=$(echo -n $line3 | jq '.first_name')
 val2=$(echo -n $line3 | jq '.pmi')
 echo $val1 " : " $val2
done < "$input3"


rm -rf $input1 $input2 $input3
rm -rf 3.sh
