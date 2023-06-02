#! /bin/bash

echo "Pass or Fail"
echo "-------------------------"
read -p "Enter your Name: " name
read -p "Enter the English Mark: " eng
read -p "Enter the Mathematics Mark: " math
read -p "Enter the Science Mark: " sci

if [ $eng -ge 33 -a $math -ge 33 -a $sci -ge 33 ]
then
    echo "Congratulations! $name You are Pass!"
else
    echo "Sorry! You are fail."
fi