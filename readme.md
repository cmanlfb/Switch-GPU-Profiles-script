gpu-modus – Grafikmodus umschalten (ASUS ROG Strix G16, AMD 610M + RTX 5070 Ti)
==============================================================================

Installation nach Neuinstallation:
  1. NVIDIA-Treiber installieren (z. B. nvidia-driver-595-open), neu starten
  2. Ordner entpacken:  tar xzf gpu-modus.tar.gz
  3. ./gpu-modus/install.sh
  4. ggf. fehlende Pakete installieren (das Script sagt welche)

Benutzung:
  gpu-modus             Menü
  gpu-modus zuhause     NVIDIA direkt (MUX Ultimate) + performance  → Dock, Gaming, 3D, Video
  gpu-modus unterwegs   AMD + NVIDIA on-demand + power-saver        → Akku
  gpu-modus --status    Status anzeigen
  Dazu Starter im Startmenü unter „Einstellungen“.

Grafikwechsel braucht einen Neustart, das Energieprofil wirkt sofort.

Wichtig:
  - Im Unterwegs-Modus kein Dock anschließen (AMD+NVIDIA-Bild gleichzeitig
    führte zu Hängern: "amdgpu flip_done timed out").
  - Kein Bild nach dem Wechsel?  Strg+Alt+F3, anmelden, gpu-modus starten.
  - Notfall von Hand:
      echo 1 | sudo tee /sys/devices/platform/asus-nb-wmi/gpu_mux_mode   (Hybrid)
      sudo prime-select on-demand
      sudo reboot
