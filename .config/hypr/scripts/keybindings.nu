grep -oP '(?<=bind = ).*' ~/dotfiles/.config/hypr/keybindings.conf | sed 's/$mainMod/SUPER/g' | sed 's/,\([^,]*\)$/ = \1/' | sed 's/, exec//g' | sed 's/^,//g' | rofi -dmenu -i -replace -p "Keybinds"
