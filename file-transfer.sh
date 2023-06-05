#!/bin/bash
##############################################################################################################
# Author Name   : Bikram Samantaray
# Author email  : samantaraybikram@gmail.com
# Script        : Transfer backup files from one destination to another destination & 
#                 genarating success & error log files with time stamp & store that in a directory.
# Version       : v1
################################################################################################################
#set -x
#set -e
#set -o

TIME_STAMP=`date +%d-%m-%Y-%H`
SUCCESS_LOG_FILE="$TIME_STAMP"_Success.log
SUCCESS_LOG_FILE_PATH=$HOME/$SUCCESS_LOG_FILE

ERROR_LOG_FILE="$TIME_STAMP"_Error.log
ERROR_LOG_FILE_PATH=$HOME/$ERROR_LOG_FILE


echo "Process Initiated...!" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH
echo "Checking Parameters...!" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH
#Checking if there is 2 Parameters or not.
if [ $# -ne 2 ]
then
        echo " Invalid syntax, Usage : bash file-transfer.sh  <Source Path> <Destination Path>" >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exist 1
fi

echo "Success!"
echo "Checking Path is Directory or Not...!" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH
#Checking if the 2 parameters are source & destination path directory or not.
if [ ! -d $1 ]
then
        echo " Souce Path is Available but it is not a Directory." >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exit 0
fi

if [ ! -d $2 ]
then
        echo " Destination Path is Available but it is not a Directory." >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exit 0
fi
echo "Success!"

echo "Checking source path permission...!" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH
#Checking if the source path has "read, write $ execute" permission or not.
#Read Permission
if [ ! -r $1 ]
then
        echo " $1: Souce path does not have read permission!" >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exit 0
fi
#Write Permission
if [ ! -w $1 ]
then
        echo " $1: Souce path does not have write permission!" >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exit 0
fi

#Execute Permission
if [ ! -x $1 ]
then
        echo " $1: Souce path does not have execute permission!" >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exit 0
fi
echo "Success!"

echo "Checking destination path permission...!" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH
#Checking if the destination path has "read, write $ execute" permission or not.
#Read Permission
if [ ! -r $2 ]
then
        echo " $2: Souce path does not have read permission!" >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exit 0
fi
#Write Permission
if [ ! -w $2 ]
then
        echo " $2: Souce path does not have write permission!" >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exit 0
fi
#Execute Permission
if [ ! -x $2 ]
then
        echo " $2: Souce path does not have execute permission!" >>$ERROR_LOG_FILE_PATH
        date >>$ERROR_LOG_FILE_PATH
        exit 0
fi
echo "Success!"

echo "Inside the source path...!" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH
#Change directory to Source Path.
cd $1
#exit 0

#Creating all the files into temp.tar file
tar -cvf temp.tar * >temp.txt
echo " success! Converted all the files into .tar" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH
#Removing temp.txt
rm -rf temp.txt

#Creating temp.tar to zip file
gzip temp.tar
echo " success! Converted .tar file into .tar.gz" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH

#Moving temp.tar.gz into destination directory
mv temp.tar.gz $2
echo " File transfer process initaited" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH
echo "Success"

#After transferring files delete all the files in source directory.
rm -rf *
echo " Deleted All the file from source path" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH

#Change directory to Destination directory.
cd $2
echo "Inside Destination path" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH

#Unzip the temp.tar.gz file.
tar -xzvf temp.tar.gz >temp.txt
#exit 0
echo " success! Converted .tar.gz file into normal files" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH

#Remove temp.txt
rm -rf temp.txt
#exit 0

#Remove .tar file
rm -rf temp.tar.gz
#exit 0
echo "Success! Removed .tar.gz file" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH

echo "File transferred Successfully!" >>$SUCCESS_LOG_FILE_PATH
date >>$SUCCESS_LOG_FILE_PATH