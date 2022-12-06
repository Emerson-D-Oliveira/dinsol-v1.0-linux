#!/bin/sh

#Installing the required library
sudo apt update
sudo apt install gfortran -y
sudo apt install make -y
sudo apt install m4 -y
sudo apt install r-base
sudo apt install wine-stable -y
winepath -w $PWD >pathdir1.txt
sed -i 's=\\=\\\\=g' pathdir1.txt
echo $PWD >pathdir2.txt
cd install
sudo Rscript install_package.R
cd ../source/
make dinsol
cd ../output/.0K
./replace.sh
./make_gui_plot.sh
echo ""
echo " *** The configuration is complete  ****"
echo ""
