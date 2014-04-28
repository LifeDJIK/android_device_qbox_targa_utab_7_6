#!/bin/sh
VENDOR_NAME=$(basename $(readlink -f $(pwd)/../../))
PRODUCT_NAME=$(basename $(readlink -f $(pwd)/../))
OUTPUT_FILE=local.mk
COPY_DIRS="root system"
ROOT_DIR=$(pwd)
echo -n "Generating $OUTPUT_FILE... ";
if [ -f $OUTPUT_FILE ]; then rm -f $OUTPUT_FILE; fi
echo "# LifeDJIK: Copy local files." > $OUTPUT_FILE;
for dir in $COPY_DIRS; do
cd $dir;
for file in $(find -printf "%P\n"); do
if [ -f $file ]; then
echo PRODUCT_COPY_FILES += device/$VENDOR_NAME/$PRODUCT_NAME/local/$dir/$file:$dir/$file >> $ROOT_DIR/$OUTPUT_FILE; fi; done
cd $ROOT_DIR; done
echo "done!";
