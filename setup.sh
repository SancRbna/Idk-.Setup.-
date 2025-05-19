#!/bin/bash

set -e

echo "Actualizando sistema..."
sudo pacman -Syu --noconfirm

echo "Instalando drivers de NVIDIA"
sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

echo "Instalando base para Hyprland y Wayland"
sudo pacman -S --noconfirm hyprland wayland wayland-protocols wlroots xorg-xwayland \
  xdg-desktop-portal-hyprland xdg-utils polkit polkit-gnome networkmanager \
  network-manager-applet mesa sddm

sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

echo "Instalando yay (AUR helper)..."
if ! command -v yay &> /dev/null; then
  echo "Clonando y construyendo yay..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd ~
  rm -rf /tmp/yay
else
  echo "yay ya está instalado."
fi

echo "Instalando aplicaciones básicas"
sudo pacman -S --noconfirm firefox libreoffice cmatrix fastfetch obs-studio kitty \
  thunar scrot nano vim playerctl htop wl-clipboard ttf-jetbrains-mono mako \
  waybar hyprpaper gtk3 gtk4 gnome-themes-extra lxappearance qt5ct qt6ct \
  alsa-utils mpv cava neofetch bat btop xdg-user-dirs unzip zip p7zip firejail \
  timeshift flatpak gvfs udisks2 mousepad gedit kate zathura evince zsh xdg-user-dirs dconf

sudo pacman -S --noconfirm papirus-icon-theme materia-gtk-theme

echo "Inicializando carpetas de usuario (Documentos, Imágenes, etc.)"
xdg-user-dirs-update

echo "Configurar .zshrc básico"
cat > ~/.zshrc <<EOF
fastfetch
alias ll='ls -lah'
EOF

echo "Añadiendo Flathub"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

mkdir -p ~/.config/hyprpaper
cat > ~/.config/hyprpaper/hyprpaper.conf <<EOF
preload = ~/Pictures/wallpaper.jpg
wallpaper = HDMI-0,~/Pictures/wallpaper.jpg
EOF

chsh -s /bin/zsh

echo "Instalando Spotify, Discord y Vencord desde AUR con yay"
yay -S --noconfirm spotify discord vencord-bin

echo "Instalando Visual Studio Code"
sudo pacman -S --noconfirm code

echo "Instalando YouTube Music Desktop App (AUR)"
yay -S --noconfirm youtube-music-bin

echo "Configurando tema Elegant para SDDM..."

if [ ! -d /usr/share/sddm/themes/Elegant ]; then
  echo "Descargando tema Elegant para SDDM"
  sudo git clone https://github.com/surajmandalcell/Elegant-sddm.git /usr/share/sddm/themes/Elegant
  sudo chown -R root:root /usr/share/sddm/themes/Elegant
  sudo chmod -R 755 /usr/share/sddm/themes/Elegant
  echo "Tema Elegant instalado correctamente."
else
  echo "Tema Elegant ya está instalado."
fi

echo "Configurando SDDM para usar tema Elegant"
sudo sed -i 's/^Current=.*/Current=Elegant/' /etc/sddm.conf || {
  echo -e "[Theme]\nCurrent=Elegant" | sudo tee -a /etc/sddm.conf > /dev/null
}
sudo systemctl enable sddm.service

echo "Creando configuración Hyprland..."

mkdir -p ~/.config/hypr

cat > ~/.config/hypr/hyprland.conf <<'EOF'
# Configuración básica Hyprland
monitor=HDMI-0,1920x1080@180,0x0,180
monitor=DP-0,1366x768@60,1920x156,60

bind=CTRL+ALT+T,exec,kitty
bind=SUPER+1,workspace,1
bind=SUPER+2,workspace,2
bind=CTRL+SHIFT+R,restart
bind=CTRL+ALT+E,exec,thunar
bind=ALT+F4,closewindow
bind=PRINT,exec,scrot ~/Pictures/screenshot_%Y-%m-%d_%H-%M-%S.png

exec-once = ~/.config/hypr/autostart.sh
EOF

echo "Creando script autostart Hyprland"

cat > ~/.config/hypr/autostart.sh <<'EOF'
#!/bin/bash

mako &
nm-applet &
playerctld &
hyprpaper &
waybar &
udisksd &
EOF
chmod +x ~/.config/hypr/autostart.sh

echo "Creando carpeta Pictures"
mkdir -p ~/Pictures

echo "Activando SDDM"
sudo systemctl enable sddm.service

echo "Reinicia tu sistema y selecciona Hyprland en el gestor de inicio de sesión."
echo "Para reiniciar, usa 'exit' y luego 'reboot'."
