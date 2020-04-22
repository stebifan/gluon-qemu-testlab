#!/bin/sh

URL="https://images.freifunk-troisdorf.de/multi/experimental/factory/"

filename=$(curl -s ${URL} | grep 'gluon.*x86-generic.img.gz' | sed 's_^.*\(gluon.*x86-generic.img.gz\).*$_\1_g')

tmpfile=/tmp/${filename%.gz}

echo Downloading ${filename} to ${tmpfile}.gz
curl -s ${URL}/${filename} -o ${tmpfile}.gz

echo Unpacking ${tmpfile}.gz to ${tmpfile}
gzip -d ${tmpfile}.gz

echo Copy to here ./image.img
cp ${tmpfile} ./image.img
