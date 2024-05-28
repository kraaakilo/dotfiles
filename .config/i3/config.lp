# Handle Brightness on my Thinkpad
bindsym XF86MonBrightnessUp exec --no-startup-id ~/.config/i3/scripts/brightness up
bindsym XF86MonBrightnessDown exec --no-startup-id ~/.config/i3/scripts/brightness down

# Handle Mouse Sensitivity on my Thinkpad
exec_always --no-startup-id "xinput --set-prop $(xinput list | grep TouchPad | awk '{print $6}' | cut -d '=' -f2) 'libinput Accel Speed' 0.7"