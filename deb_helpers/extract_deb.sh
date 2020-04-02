#!/bin/bash

deb_file=$1
extracted_deb=$(echo $deb_file | sed 's/.deb$//')

mkdir $extracted_deb
cd $extracted_deb

ar x ../$deb_file

mkdir control data

for each in control data; do
    tar xvf ${each}.tar.xz -C $each
done
