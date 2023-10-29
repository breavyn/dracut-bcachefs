#!/bin/sh

if [ "$fstype" != bcachefs ]; then
    return 0
fi

root_subvol=$(getarg root_subvol=)
rootok=1
