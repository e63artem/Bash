#!/bin/bash

echo "Input directory in which remove all temp files (like this - /home): "
read DIR;
find "$DIR" -name "*~" -exec rm -f {} \;
echo "All temp files are removed"
