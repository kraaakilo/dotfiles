.PHONY: i3 xfce install installdev installi3

stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list yay --noconfirm --needed -S

installi3: install
	xargs -d '\n' -a packages/i3.list yay --noconfirm --needed -S

installdev: install
	xargs -d '\n' -a packages/dev.list yay --noconfirm --needed -S

i3:
	$(stow) dunst
	$(stow) git
	$(stow) i3
	$(stow) picom
	$(stow) polybar
	$(stow) rofi
	$(stow) xfce4

xfce:
	$(stow) xfce4
