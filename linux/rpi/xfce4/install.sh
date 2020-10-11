#!/bin/bash

echo -n "[] Running apt update..."
sudo apt clean &> /dev/null
sudo apt update --fix-missing -y &> /dev/null
echo " done"

echo -n "[] Installing xfce4..."
sudo apt install -y xfce4 &> /dev/null
echo " done"

echo -n "[] Uninstall lxde..."
sudo apt remove -y lxappearance lxde lxde-* lxinput lxmenu-data lxpanel lxpolkit lxrandr lxsession* lxsession lxshortcut lxtask lxterminal xterm &> /dev/null
echo " done"

echo -n "[] Installing xfce4 applications and utilities..."
sudo apt install -y vim nomacs xfce4-terminal xfce4-taskmanager xfce4-session xfce4-session-logout xfce4-session-settings xfce4-settings-editor xfce4-settings-manager &> /dev/null
echo " done"

echo -n "[] Installing xfce plugins..."
sudo apt install -y xfce4-battery-plugin xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-datetime-plugin xfce4-diskperf-plugin xfce4-genmon-plugin xfce4-netload-plugin xfce4-sensors-plugin xfce4-statusnotifier-plugin xfce4-systemload-plugin xfce4-timer-plugin xfce4-xkb-plugin &> /dev/null
echo " done"

echo-n "[] Installing xfce4 power manager..."
sudo apt install -y xfce4-power-manager xfce4-power-manager-data xfce4-power-manager-plugins &> /dev/null
echo " done"

echo -n "[] Installing xfce4 themes..."
sudo apt install -y xfwm4-themes gtk3-engines-xfce pixflat-icons rpd-icons &> /dev/null
echo " done"

echo -n "[] Performing cleanup..."
sudo apt autoremove -y &> /dev/null
sudo apt autoclean -y &> /dev/null
echo " done"

echo "[] Rebooting in 1 minute..."
sudo shutdown -r
