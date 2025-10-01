#!/bin/bash

[ "$(id -u)" -eq 0 ]||{
    echo "sudo ile kullanın" >&2
    exit 1
}

echo "Sunucu paketi indiriliyor..."
curl -so /tmp/pi-server.deb "https://raw.githubusercontent.com/HasanAgitUnal/Installs/master/AkllSnf-Server/pi-server.deb"

echo "Eklenti indiriliyor..."
curl -so /tmp/plugin.zip "https://raw.githubusercontent.com/HasanAgitUnal/Installs/master/AkllSnf-Server/plugin.zip"

echo "Sunucu paketi kuruluyor..."
dpkg -i /tmp/pi-server.deb &>/dev/null
dpkg --configure -a &>/dev/null # fix dependecies

echo "Eklenti kuruluyor..."
pi-server plugin-install /tmp/plugin.zip

echo "Sunucu Kuruldu"
echo "IP: $(hostname -I)"
