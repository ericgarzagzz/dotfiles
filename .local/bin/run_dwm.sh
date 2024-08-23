#!/bin/bash
feh --no-fehbg --bg-fill ~/.local/share/wallpapers/wallpaper.png &
picom --config ~/.config/picom/picom.conf &
dwmblocks &
exec dwm
