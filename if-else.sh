#! /bin/bash

read -p "Enter first number" num1
read -p "Enter second number" num2

if [ $num1 -gt $num2 ]
then
    echo " $num1 is greater number"
else
    echo " $num2 is greater number"
fi