# Este seria el modelo para tener todas mis configuraciones, en esta ocasion solo seran aplicaciones xdddd
-El script está pensado para usarse con Arch Linux y Hyprland.

-Se recomienda revisar el script antes de ejecutarlo para entender qué se instala y configura!!

# Arch Linux Setup con Hyprland

Este repositorio contiene un script `setup.sh` para instalar y configurar Arch Linux con Hyprland y las aplicaciones que uso habitualmente xd.

---

## ¿Qué hace el script?

- Actualiza el sistema.
- Instala los drivers de NVIDIA.
- Instala Hyprland, Wayland y sus dependencias.
- Habilita NetworkManager para la gestión de red.
- Instala `yay` para manejar paquetes los AUR.
- Instala aplicaciones básicas:
  - Firefox, LibreOffice, fastfetch, OBS Studio.
  - Spotify, Discord + Vencord, Visual Studio Code.
  <br>
    `El uso de vencord puede llegar a ser baneable al parecer.`
  - YouTube Music Desktop App, Flatpak.
- Configura un archivo básico para utilizar Hyprland.

---

## Cómo usar

1. Instala Arch Linux usando `archinstall`, seleccionando un perfil limpio sin escritorio.
2. Clona este repositorio:
   ```bash
    git clone https://github.com/SancRbna/Idk-.Setup.-.git
    cd Idk-.Setup.-
3. Dale permisos de ejecución al script y ejecútalo para instalar y configurar las aplicaciones y Hyprland:
   ```bash
    chmod +x setup.sh
    ./setup.sh
5. Cuando termine deberias reiniciar tu equipo (Eso Creo)
   ```bash
   exit
   reboot
7. En la pantalla de inicio de sesión, selecciona el entorno de escritorio Hyprland y entra con tu Usuario/Contraseña.
8. Nota: Si no tienes Git instalado en tu base Arch, puedes instalarlo primero con:
   ```bash
   sudo pacman -S git base-devel
---

## Personalización
  -Puedes modificar el archivo `~/.config/hypr/hyprland.conf` para cambiar la configuración de Hyprland.
  -Añade o quita paquetes dentro de `setup.sh` según tus necesidades.
---
Este script descarga e instala componentes con distintas licencias.
En particular, el tema SDDM "Elegant" se instala desde su repositorio oficial
y está licenciado bajo GNU GPL v3.0 por surajmandalcell.

I don't Know
