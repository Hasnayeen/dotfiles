hyprkeys -jb | from json | get binds | select Bind Dispatcher Command | skip 1 | to csv | rofi -dmenu -i -replace -p "Keybinds"
