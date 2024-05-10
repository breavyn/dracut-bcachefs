#!/bin/sh

check() {
    require_binaries bcachefs || return 1

    return 0
}

depends() {
    return 0
}

install() {
    inst_multiple bcachefs keyctl

    inst_hook cmdline 90 "$moddir/parse-cmdline.sh"
    inst_hook pre-mount 90 "$moddir/unlock.sh"
    inst_hook mount 90 "$moddir/mount.sh"
}
