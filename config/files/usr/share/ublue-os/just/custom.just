!include /usr/share/ublue-os/just/bling.just

assemble:
  #!/usr/bin/env bash
  echo 'Assembling distrobox...'
  notify-send 'Distrobox terminal is being assembled...'
  if [[ -f "$HOME/.config/ublue/boxkit.ini" ]]; then
    distrobox assemble create --replace --file "$HOME/.config/ublue/boxkit.ini"
  else
    distrobox assemble create --replace --file /usr/share/ublue-os/boxkit.ini
  fi
  notify-send 'Distrobox terminal has been assembled!'
