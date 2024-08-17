FROM alpine:3.20

# 기본 패키지 및 OpenVPN 설치
RUN apk add --no-cache \
    openvpn \
    curl \
    git \
    htop \
    tree \
    bash \
    openrc \
    && rm -rf /var/cache/apk/*

# 작업 디렉토리 설정
WORKDIR /workspace

# bash를 기본 셸로 설정
SHELL ["/bin/bash", "-c"]


# DNS 서버 설정을 위한 환경 변수
ENV DNS_SERVER1 8.8.8.8
ENV DNS_SERVER2 8.8.4.4

# 컨테이너 시작 시 .bashrc 파일을 소스로 사용하고 DNS 설정을 적용하도록 설정
CMD ["/bin/bash", "-c", "echo \"nameserver $DNS_SERVER1\" > /etc/resolv.conf && echo \"nameserver $DNS_SERVER2\" >> /etc/resolv.conf && source /root/.bashrc && /bin/bash"]