#!/bin/bash

[ "$(id -u)" -eq 0 ]||{
    echo "sudo ile kullanın" >&2
    exit 1
}

echo "Sunucu paketi indiriliyor..."
curl -so /tmp/pi-server.deb "https://github.com/HasanAgitUnal/AkllSnf-Server/releases/download/install/pi-server.deb"

echo "Eklenti indiriliyor..."
curl -so /tmp/plugin.zip "https://github.com/HasanAgitUnal/AkllSnf-Server/releases/download/install/plugin.zip"

echo "Sunucu paketi kuruluyor..."
dpkg -i /tmp/pi-server.deb

echo "Eklenti kuruluyor..."
pi-server plugin-install /tmp/plugin.zip

echo "Kurulum tamamlandı"
echo "IP: $(hostname -I)"
