# My layout

My custom layout. Only chaged symbols making it easier on my wrists to type them.

Copy or symlink this file to system keyboard layout directory
```bash
cp prog-colemak-dh /usr/share/X11/xkb/symbols/prog-qwerty
```
## Wayland

For hyprland add this to your config

```
input {
    kb_layout = prog-colemak-dh
}
```

For any other wayland compositors you wanna check their docs on keyboard layouts

## Preview
![preview](./preview.png)
