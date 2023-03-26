#!/bin/bash

USER_HOME=$(eval echo ~${SUDO_USER})
pic_path=$USER_HOME/Pictures/
astro_dir="Astrophotography"
ico_dir=/usr/share/Hubble-Pi2
app_folder=$ico_dir/AstroCameraApp/
subname=("H264" "JPG")

if [ -d $pic_path/$astro_dir ]
then
    echo "Directory $astro_dir already exists."
else
    echo "Directory $astro_dir not found. Creating it and its subfolders ..." 
    mkdir -p $pic_path/$astro_dir
    for i in ${subname[*]}; do
    mkdir -p $pic_path/$astro_dir/$i
    done
    chown -R $SUDO_USER $pic_path/$astro_dir
    errcode=$?
    if [ $errcode -ne 0 ]; then
    echo "error when trying to create Folders, please verify you have rights"
    else
    echo "Folders created ! location: $pic_path"
    fi
fi

echo "--------------------------------"

if [ -d $ico_dir ]
then
echo "Directory $ico_dir already exists."
else
echo "Directory $ico_dir not found. Creating it ..."
mkdir -p $ico_dir
cp ./*.png $ico_dir && cp ./*.jpeg $ico_dir
fi
cp ./AstroCam.desktop $USER_HOME/.local/share/applications/
ln -s $USER_HOME/.local/share/applications/AstroCam.desktop $USER_HOME/Desktop/AstroCam.desktop
cp ./CameraPreview.desktop $USER_HOME/.local/share/applications/
ln -s $USER_HOME/.local/share/applications/CameraPreview.desktop $USER_HOME/Desktop/CameraPreview.desktop

echo "--------------------------------"

if [ -d $app_folder ]
then
echo "Directory $app_folder already exists."
else
echo "Directory $app_folder not found. Creating it and its subfolder..."
mkdir -p $app_folder/PythonScripts
cp ../Astrocam/AstroCam.py $app_folder/PythonScripts
chmod +x $app_folder/PythonScripts/AstroCam.py
fi
