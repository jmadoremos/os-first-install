# Raspberry Pi OS

## Updating the operating system

```bash
sudo apt clean
sudo apt update --fix-missing -y
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo reboot
```

## Updating the firmware

```bash
sudo rpi-update
```
## Installing essentials

### Code - OSS (Visual Studio Code - Community Edition, Unofficial)

For more information, refer to [Code - OSS](../code/README.md) page.

### Chromium (Media Edition)

For more information, refer to [Chromium (Media Edition)](../chromium-media-edition/README.md) page.

### Deluged

For more information, refer to [Deluged](../deluged/README.md) page.

### FiraCode

A monospaced font with programming ligatures.

```bash
sudo apt install -y fonts-firacode 
```

### Guake

A drop-down terminal made for GNOME desktop environment.

```bash
sudo apt install -y guake 
```

### OpenCV

For more information, refer to [OpenCV](../opencv/README.md) page.

### Synaptic 

An alternative package manager to **Add/Remove programs**.

```bash
sudo apt install -y synaptic
```

### Uncomplicated Firewall

For more information, refer to [Uncomplicated Firewall](../ufw/README.md) page.

### uGet

A download manager.

```bash
sudo apt install -y uget
```

### XFCE4

For more information, refer to [XFCE4](../xfce4/README.md) page.

### Z Shell

For more information, refer to [Z Shell](../zsh/README.md) page.
