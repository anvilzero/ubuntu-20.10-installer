#!/bin/bash
# chmod a+x on this file, then run: $ ./install_portainer.sh
# Installs Portainer to port 9000
# Sets admin password, loads templates and logo from Github
# Create a password hash, but double escape $ via $$ (EDIT: not needed):
# docker run --rm httpd:2.4-alpine htpasswd -nbB admin your_password | cut -d ":" -f 2
# Password is only set on first start, re-create volume to set new password

docker run -d \
  -p 9000:9000 \
  --name portainer \
  --restart unless-stopped \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce \
  -H unix:///var/run/docker.sock \
  --admin-password='$2y$05$QklZiF5H/wKSotHQPQHA3uO7rgzZ7F5DTvlVNrr9sUYDOcIcoR0a.' \
  --templates "https://raw.githubusercontent.com/anvilzero/ubuntu-20.10-installer/master/portainer-templates.json" \
  --logo "https://github.com/anvilzero/ubuntu-20.10-installer/raw/main/logo.png"
