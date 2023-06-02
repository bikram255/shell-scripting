#! /bin/bash

read -p "Enter first number" num1
read -p "Enter second number" num2

#Here it is not single quotation mark.
c=`expr $num1 + $num2` 

echo " Addition of 2 number is: $c"