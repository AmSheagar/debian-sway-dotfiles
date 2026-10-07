#!/bin/sh

set -eu

REPO_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
BACKUP_DIR="$HOME/.config-backup/debian-sway-dotfiles-$(date +%Y%m%d-%H%M%S)"

echo "======================================"
echo " Debian Sway Dotfiles Installer"
echo "======================================"
echo

if [ "$(id -u)" -eq 0 ]; then
    echo "Error: no ejecutes este instalador como root."
    exit 1
fi

if [ ! -f /etc/debian_version ]; then
    echo "Advertencia: este instalador está diseñado para Debian."
    printf "¿Continuar? [y/N] "
    read -r answer
    case "$answer" in
        y|Y) ;;
        *) echo "Cancelado."; exit 0 ;;
    esac
fi

echo "==> Comprobando dependencias..."

MISSING=""

check_command() {
    command_name="$1"
    package_name="$2"

    if command -v "$command_name" >/dev/null 2>&1; then
        echo "[✓] $command_name"
    else
        echo "[!] Falta: $command_name"
        MISSING="$MISSING $package_name"
    fi
}

check_command sway sway
check_command kitty kitty
check_command zsh zsh
check_command wtype wtype
check_command jq jq
check_command nautilus nautilus
check_command autotiling autotiling

if [ -n "$MISSING" ]; then
    echo
    echo "Se instalarán los siguientes paquetes:"
    echo "$MISSING"
    echo

    if command -v sudo >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y $MISSING
    else
        echo "Error: sudo no está instalado."
        exit 1
    fi
fi

echo
echo "==> Creando directorios..."

mkdir -p "$HOME/.config/sway"
mkdir -p "$HOME/.config/kitty"
mkdir -p "$HOME/.local/bin"

backup_file() {
    source="$1"
    destination="$2"

    if [ -e "$destination" ]; then
        mkdir -p "$BACKUP_DIR"
        cp -a "$destination" "$BACKUP_DIR/"
        echo "[backup] $destination"
    fi
}

echo
echo "==> Instalando configuraciones..."

backup_file \
    "$REPO_DIR/sway/config" \
    "$HOME/.config/sway/config"

cp "$REPO_DIR/sway/config" "$HOME/.config/sway/config"
echo "[✓] Sway"

backup_file \
    "$REPO_DIR/kitty/kitty.conf" \
    "$HOME/.config/kitty/kitty.conf"

cp "$REPO_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
echo "[✓] Kitty"

echo
echo "==> Instalando scripts..."

for script in mac-copy mac-paste noctalia-watch; do
    cp "$REPO_DIR/scripts/$script" "$HOME/.local/bin/$script"
    chmod +x "$HOME/.local/bin/$script"
    echo "[✓] $script"
done

echo
echo "======================================"
echo " Instalación completada"
echo "======================================"

if [ -d "$BACKUP_DIR" ]; then
    echo
    echo "Se creó un backup de las configuraciones anteriores:"
    echo "$BACKUP_DIR"
fi

echo
echo "Nota:"
echo "Noctalia y Zen Browser pueden requerir instalación/configuración adicional."
echo
echo "Ejecuta 'swaymsg reload' para aplicar la configuración de Sway."
