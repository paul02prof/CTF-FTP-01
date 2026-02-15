
# 🧨 CTF FTP Misconfiguration Lab

Mini box CTF basée sur Docker avec :
- FTP mal configuré (anonymous activé)
- SSH accessible
- Web server
- Escalade de privilèges simple
- Flags user & root


---

## Technologies utilisées

- Docker
- Ubuntu
- vsftpd
- OpenSSH
- Apache HTTP Server

---
 
## Installation

### Build de l’image

```
git clone https://github.com/paul02prof/ctf-ftp-box.git
cd ctf-ftp-box
```
### Lancement du conteneur

```
docker-compose up --build
```
---

## Services exposés

- Service | Port
- FTP | 2121
- SSH | 2222
- Web | 8081
- Passive FTP | 30000–30010

---

## Objectif du challenge

- Scanner la machine
- Identifier le service FTP
- Exploiter la mauvaise configuration
- Récupérer des identifiants
- Se connecter en SSH
- Trouver les flags user et root

---

## Problème courant (SSH)

Si après un rebuild tu obtiens :

WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED

Supprimer l’ancienne clé :

```
ssh-keygen -f "/root/.ssh/known_hosts" -R "[IP]:2222"
```

---

Projet éducatif destiné à l’entraînement en cybersécurité.
# Capture_The_Flag_ftp_1
# Capture_The_Flag_ftp_1
