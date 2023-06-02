#! /bin/bash


echo "Enter Your Name"
read name

#Here mnumber is variable. Using read command we are doing both taking input & storing data in variable.
read -p "Enter ur Mobile Number: " mnumber
read -p "Enter you employee code: " empcode

echo " "
echo "Welcome! $name"
echo "Your Mobile Number is: $mnumber"
echo "Your Employee Code is: $empcode"