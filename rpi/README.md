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

### Code - OSS (a.k.a. Visual Studio Code - Community Edition, Unofficial)

An integrated development environment.

```bash
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/rpi/code/install.sh | sudo bash
```

### Chromium (Media Edition)

A web browser with DRM-enabled.

```bash
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/rpi/chromium-media-edition/install.sh | sudo bash
```

### Deluged

A torrent client and console application.

```bash
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/rpi/deluged/install.sh | sudo bash
```

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

An open-source set of libraries for image processing using Python.

```bash
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/rpi/opencv/install.sh | sudo bash
```

### Synaptic 

An alternative package manager to **Add/Remove programs**.

```bash
sudo apt install -y synaptic
```

### ufw

An easy-to-configure firewall.

```bash
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/rpi/ufw/install.sh | sudo bash
```

### uGet

A download manager.

```bash
sudo apt install -y uget
```

### XFCE4

An alternative desktop environment to LXDE.

> This replaces LXDE permanently.

```bash
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/rpi/xfce4/install.sh | sudo bash
```

### Z Shell

An alternative shell to bash.

> This replaces bash as the default shell.

```bash
curl -L https://raw.githubusercontent.com/jmadoremos/os-first-install/master/rpi/zsh/install.sh | sudo bash
```
