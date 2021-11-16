# Get current settings first
dconf read /org/gnome/desktop/input-sources/xkb-options
# Update settings
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"




