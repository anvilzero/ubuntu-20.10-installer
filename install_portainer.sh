#!/bin/bash
# chmod a+x on this file, then run:$ sh install_portainer.sh
# Installs Portainer to port 9000
# Sets admin password, loads templates and logo from Github

docker run -d \
  -p 9000:9000 \
  --name portainer \
  --restart unless-stopped \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data portainer/portainer \
  -H unix:///var/run/docker.sock \
  --admin-password='$2y$05$phwSg3ykaHLBDYEEpUHfFeePAlN52B5jX.EOS4GsVPtr9wd008iSO' \
  --templates "https://raw.githubusercontent.com/anvilzero/ubuntu-20.10-installer/master/portainer-templates.json" \
  --logo "https://raw.githubusercontent.com/anvilzero/ubuntu-20.10-installer/master/logo.svg"
