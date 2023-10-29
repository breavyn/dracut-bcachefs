This module allows mounting an encrypted bcachefs subvolume as `/`. The root of
the bcachefs filesystem is made available at `/.bcachefs`.

Not working with systemd (yet).

```
# kernel cmdline
rootfstype=bcachefs root=UUID=<external uuid> root_subvol=<root path>
```

Additional subvolumes can be mounted using fstab.
```
# /etc/fstab
/.bcachefs/<home subvol path>   /home   none  defaults,bind 0 0
```
