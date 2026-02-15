FROM ubuntu:22.04

LABEL authors="paul02prof"

ENV DEBIAN_FRONTEND=noninteractive
# Créer dossier FTP
RUN mkdir -p /var/ftp

RUN apt update && apt install -y \
    vsftpd \
    openssh-server \
    apache2 \
    sudo

# Création utilisateur faible
RUN useradd -m hacker && \
    echo "hacker:password123" | chpasswd && \
    adduser hacker sudo

# Flags
RUN echo "flag{ftp_access_granted}" > /home/hacker/flag_user.txt && \
    chmod 644 /home/hacker/flag_user.txt

RUN echo "flag{root_compromise}" > /root/flag_root.txt

# FTP mal configuré
RUN echo "listen=YES" > /etc/vsftpd.conf && \
    echo "anonymous_enable=YES" >> /etc/vsftpd.conf && \
    echo "anon_root=/srv/ftp" >> /etc/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd.conf && \
    echo "anon_upload_enable=YES" >> /etc/vsftpd.conf && \
    echo "no_anon_password=YES" >> /etc/vsftpd.conf && \
    echo "pasv_enable=YES" >> /etc/vsftpd.conf && \
    echo "pasv_min_port=30000" >> /etc/vsftpd.conf && \
    echo "pasv_max_port=30010" >> /etc/vsftpd.conf && \
    echo "pasv_address=192.168.56.1" >> /etc/vsftpd.conf

# Indice laissé en FTP
RUN echo "User: hacker" > /var/ftp/creds.txt && \
    echo "Pass: password123" >> /var/ftp/creds.txt && \
    echo "User: hacker" > /srv/ftp/creds.txt && \
    echo "Pass: password123" >> /srv/ftp/creds.txt

# SSH setup
RUN mkdir /var/run/sshd

EXPOSE 21 22 80

CMD service vsftpd start && \
    service ssh start && \
    apachectl -D FOREGROUND
