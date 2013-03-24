#!/bin/bash
#
# ./gameplay-install.sh [master | next]
#
# Download GamePlay resources from HTTP server and extract from ZIP
#
# Helps prevent repo bloat due to large binary files since they can
# be hosted separately.
#

# prefix=http://www.jimmydev.com
# prefix=http://jfinale.appoverdrive.com
prefix=http://www.clicknectdev.com

branchname=$1
if [[ "$branchname" == "" ]]; then
  branchname="next"
fi

filename=gameplay-deps-$branchname

echo Downloading $filename.zip from $prefix...
curl -# -O $prefix/$filename.zip
echo Extracting $filename.zip... please standby...
unzip -q $filename.zip
echo Cleaning up...
rm $filename.zip
echo Done.
