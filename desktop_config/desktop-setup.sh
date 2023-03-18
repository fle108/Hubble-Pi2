#!/bin/bash

pic_path=$HOME/Pictures/
astro_dir="Astrophotography"
app_folder=$ico_dir/AstroCameraApp
ico_dir=/usr/share/Hubble-Pi2
subname=("H264" "JPG")

if [ -d $pic_path/$astro_dir ]
then
    echo "Directory $astro_dir already exists. exiting section."
else
    echo "Directory $astro_dir not found. Creating it and its subfolders ..." 
    mkdir -p $pic_path/$astro_dir
    for i in ${subname[*]}; do
    mkdir -p $pic_path/$astro_dir/$i
    done
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
echo "Directory $ico_dir already exists. exiting section."
else
echo "Directory $ico_dir not found. Creating it ..."
mkdir -p $ico_dir
cp ./*.png $ico_dir && cp ./*.jpeg $ico_dir
fi
cp ./AstroCam.desktop ~/.local/share/applications/
cp ./CameraPreview.desktop ~/.local/share/applications/

echo "--------------------------------"

if [ -d $app_folder ]
then
echo "Directory $app_folder already exists. exiting section."
else
echo "Directory $app_folder not found. Creating it and its subfolder..."
sudo -H /bin/bash <<EOF
    mkdir -p $app_folder/PythonScripts
    cp ../Astrocam/AstroCam.py $app_folder/PythonScripts
EOF
fi
