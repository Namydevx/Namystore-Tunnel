#!/bin/bash
# ========================================
# Installer BadVPN UDP Gateway
# By: NamyDevx
# ========================================

GITHUB_RAW="https://github.com/Namydevx/Namystore-Tunnel/raw/main/BadVPN-UDPWG"

# Download Binary BadVPN
echo "[+] Mengunduh badvpn..."
wget -q -O /usr/bin/badvpn "${GITHUB_RAW}/badvpn"
chmod +x /usr/bin/badvpn

# Download Systemd Service Files
echo "[+] Mengunduh file service systemd..."
wget -q -O /etc/systemd/system/badvpn1.service "${GITHUB_RAW}/badvpn1.service"
wget -q -O /etc/systemd/system/badvpn2.service "${GITHUB_RAW}/badvpn2.service"
wget -q -O /etc/systemd/system/badvpn3.service "${GITHUB_RAW}/badvpn3.service"

# Reload systemd
systemctl daemon-reload

# Aktifkan & Jalankan Service
for i in 1 2 3; do
    systemctl disable badvpn$i.service > /dev/null 2>&1
    systemctl stop badvpn$i.service > /dev/null 2>&1
    systemctl enable badvpn$i.service
    systemctl start badvpn$i.service
done

echo "[✓] BadVPN berhasil diinstal dan dijalankan di port 7100, 7200, 7300"
