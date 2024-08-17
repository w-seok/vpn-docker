#!/bin/sh

# 기존 OpenVPN 프로세스 찾기 및 종료
if pgrep -x "openvpn" > /dev/null
then
    pkill -f openvpn

    # VPN 연결 해제 확인
    while ip addr show tun0 >/dev/null 2>&1; do
        sleep 1
    done
fi


# VPN 연결 시작
openvpn --config /etc/openvpn/config.ovpn --daemon 

# VPN 연결 확인
echo "vpn 연결 시작"
while ! ip addr show tun0 >/dev/null 2>&1; do
    sleep 1
done
echo "vpn 연결 성공"

# bash 실행
/bin/bash
