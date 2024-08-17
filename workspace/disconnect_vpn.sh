#!/bin/sh

# OpenVPN 프로세스 찾기 및 종료
pkill -f openvpn

# VPN 연결 해제
echo "vpn 연결 해제 시작"
while ip addr show tun0 >/dev/null 2>&1; do
    sleep 1
done
echo "vpn 연결 해제 성공"