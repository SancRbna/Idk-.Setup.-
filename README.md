# Este seria el modelo para tener todas mis configuraciones, en esta ocasion solo seran aplicaciones xdddd


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
   https://github.com/SancRbna/Idk-.Setup.-.git
   cd Idk-.Setup.-
3. Dale permisos de ejecución al script y ejecútalo para instalar y configurar las aplicaciones y Hyprland:
    chmod +x setup.sh
    ./setup.sh
4. Cuando termine deberias reiniciar tu equipo (Eso Creo)
5. En la pantalla de inicio de sesión, selecciona el entorno de escritorio Hyprland y entra con tu Usuario/Contraseña.
6. Nota: Si no tienes Git instalado en tu base Arch, puedes instalarlo primero con:
   ```bash
   sudo pacman -S git
---






I don't Know
