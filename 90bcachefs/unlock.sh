#!/bin/sh

if [ "$fstype" != bcachefs ]; then
    return 0
fi

dev="${root#block:}"

if bcachefs unlock -c "$dev" >/dev/null 2>&1; then
    info "Please unlock $dev:"
    for _ in 1 2 3; do
        bcachefs unlock "$dev" && \
          keyctl link @u @s && \
          info "$dev successfully unlocked" && \
          return 0
    done

    die "maximum number of tries exceeded for $dev"
fi
