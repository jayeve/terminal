#!/bin/bash

set -ex

#Manifest="/Volumes/backup/1996_federal_tax_retruns/manifest.txt"
Manifest="/Users/jevans/scratch/videos.txt"
File="links.txt"
Lines=$(cat $File)
for line in $Lines
do
  youtube-dl --restrict-filename --download-archive $Manifest -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $line && echo $line >> $Manifest
done
