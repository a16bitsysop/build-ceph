#!/bin/sh

# called inside aport folder or first arg is dir to cd into
NME="builder"

[ -n "$1" ] && cd "$1"

if [ ! -f APKBUILD ]
then
  >&2 echo "No APKBUILD file to build"
  exit 2
fi

echo "Updating ..."
sudo apk update
echo "Building ..."
echo "Arch is: $(uname -m)"
abuild checksum
abuild -A
abuild -rK

APKS=$(find /home/"$NME"/packages -name APKINDEX.tar.gz | wc -l)
if [ "$APKS" -lt 1 ]
then
  echo "no apks built, exiting"
  exit 1
fi

echo "Copying Packages"
sudo mkdir -p /tmp/packages/"$(uname -m)"
sudo cp -a /home/"$NME"/packages/* /tmp/packages/"$(uname -m)"
