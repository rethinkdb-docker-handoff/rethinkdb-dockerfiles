#! /usr/bin/env bash

base=2.0.1
new=$1
suffix=$2

for distro in jessie trusty utopic wheezy vivid; do
  cp -r "./$distro/$base" "./$distro/$new"
  gsed -i "s/$base/$new$suffix/" "./$distro/$new/Dockerfile"
done
git add ./*/"$new"
git commit -m "Add $new"
git tag "$new" -m "$new"
