#!/usr/bin/env bash
# Installiert gpu-modus für den aktuellen Benutzer (ohne root)
set -e
cd "$(dirname "$0")"

install -Dm755 gpu-modus "$HOME/.local/bin/gpu-modus"
for f in applications/*.desktop; do
    install -Dm644 "$f" "$HOME/.local/share/applications/$(basename "$f")"
done
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

# Abhängigkeiten prüfen
fehlt=()
command -v whiptail         >/dev/null || fehlt+=(whiptail)
command -v prime-select     >/dev/null || fehlt+=(nvidia-prime)
command -v powerprofilesctl >/dev/null || fehlt+=(power-profiles-daemon)
command -v glxinfo          >/dev/null || fehlt+=(mesa-utils)

echo "gpu-modus installiert nach ~/.local/bin"
if ((${#fehlt[@]})); then
    echo "Es fehlen noch Pakete:  sudo apt install ${fehlt[*]}"
fi
[[ -e /sys/devices/platform/asus-nb-wmi/gpu_mux_mode ]] \
    || echo "Hinweis: gpu_mux_mode nicht gefunden (asus-nb-wmi geladen? NVIDIA-Treiber installiert?)"
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) echo "Hinweis: ~/.local/bin ist nicht im PATH – einmal ab- und wieder anmelden." ;; esac
