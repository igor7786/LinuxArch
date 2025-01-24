if [ -f "/usr/bin/swayidle" ]; then
    echo "swayidle is installed."
    swayidle -w timeout 240 'nwg-lock -f' timeout 260 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
else
    echo "swayidle not installed."
fi
