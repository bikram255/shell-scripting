#! /bin/bash

echo "Pass or Fail"
echo "-------------------------"
read -p "Enter your Name: " name
read -p "Enter the English Mark: " eng
read -p "Enter the Mathematics Mark: " math
read -p "Enter the Science Mark: " sci

if [ $eng -ge 33 ]
then
        if [ $math -ge 33 ]
        then
                if [ $sci -ge 33 ]
                then
                    echo "Congratulations! $name You are Pass!"
                else
                    echo "Sorry! You are fail in 1 Subjects."
                fi
        else
            echo "You are fail in 2 Subjects"
        fi
else
    echo "You are fail in 3 Subjects"
fi