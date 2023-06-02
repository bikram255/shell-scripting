#! /bin/bash

echo "Pass or Fail"
echo "-------------------------"
read -p "Enter your Name: " name
read -p "Enter the English Mark: " eng
read -p "Enter the Mathematics Mark: " math
read -p "Enter the Science Mark: " sci

if [ $eng -lt 33 ]
then
    echo " You are fail in English"
elif [ $math -lt 33 ]
then
    echo "You are Fail in Mathematics"
elif [ $sci -lt 33 ]
then
    echo "You are Fail in Science"
else
    echo "Congratulations! $name You are Pass!"
fi