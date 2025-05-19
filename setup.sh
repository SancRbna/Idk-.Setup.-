#!/bin/bash

set -e

echo "Actualizando sistema..."
sudo pacman -Syu --noconfirm

echo "Instalando drivers de NVIDIA"
sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

echo "Instalando base para Hyprland y Wayland"
sudo pacman -S --noconfirm hyprland wayland wayland-protocols wlroots xorg-xwayland \
  xdg-desktop-portal-hyprland xdg-utils polkit polkit-gnome networkmanager \
  network-manager-applet mesa

sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

echo "Instalando yay (AUR helper)..."
if ! command -v yay &> /dev/null; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd ~
  rm -rf /tmp/yay
fi

echo "Instalando aplicaciones básicas"
sudo pacman -S --noconfirm firefox libreoffice cmatrix fastfetch obs-studio alacritty \
  thunar scrot nano vim playerctl htop wl-clipboard ttf-jetbrains-mono mako

echo "Instalando Spotify, Discord y Vencord desde AUR con yay..."
yay -S --noconfirm spotify discord vencord-bin

echo "Instalando Visual Studio Code"
sudo pacman -S --noconfirm code

echo "Instalando YouTube Music Desktop App (AUR)"
yay -S --noconfirm youtube-music-bin

# Crear configuración de Hyprland
mkdir -p ~/.config/hypr

cat > ~/.config/hypr/hyprland.conf <<'EOF'
# Configuración básica Hyprland
monitor=HDMI-0,1920x1080@180,0x0,180
monitor=DP-0,1366x768@60,1920x156,60

bind=CTRL+ALT+T,exec,alacritty
bind=SUPER+1,workspace,1
bind=SUPER+2,workspace,2
bind=CTRL+SHIFT+R,restart
bind=CTRL+ALT+E,exec,thunar
bind=ALT+F4,closewindow
bind=PRINT,exec,scrot ~/Pictures/screenshot_%Y-%m-%d_%H-%M-%S.png

exec-once = ~/.config/hypr/autostart.sh
EOF

# Crear script de autostart
mkdir -p ~/.config/hypr
cat > ~/.config/hypr/autostart.sh <<'EOF'
#!/bin/bash

mako &
nm-applet &
playerctld &
EOF
chmod +x ~/.config/hypr/autostart.sh

echo "Reinicia tu sistema y selecciona Hyprland en el gestor de inicio de sesión."
echo "Para Reiniciar Usa Exit y Reboot"
