# !/bin/bash

# This file will fetch the data and organize the folders accordingly

# preparing the directories
mkdir data/
pushd data/
mkdir raw/
mkdir processed/

# downloading the data
wget "https://raw.githubusercontent.com/brendenlake/omniglot/master/python/images_background.zip"
wget "https://raw.githubusercontent.com/brendenlake/omniglot/master/python/images_evaluation.zip"

# unzip the images folder
unzip images_background.zip
unzip images_evaluation.zip

# re-organize folders
mv images_background processed
mv images_evaluation evaluation
mv *.zip raw/

# move 10 first evaluation subdirs to background dir
pushd evaluation/
all_folders=(*/)
popd
for ((i=0; i<10; i++))
do
  mv "evaluation/${all_folders[i]}" background/
done

mv background processed/
mv evaluation processed/

echo "Data has been downloaded"

