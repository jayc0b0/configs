#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

# Merge custom X resources
xrdb -merge "${HOME}/.Xresources"

xautolock -time 60 -locker "sudo pm-suspend" -detectsleep &

# Mapping of cap -> mod4
setxkbmap -option caps:none
setxkbmap -option caps:super

# Graphics option
compton --vsync opengl &

# Pulse Audio Start
pulseaudio --start &

# gpg-agent
envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
        eval "$(cat "$envfile")"
    else
            eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
        fi
        export GPG_AGENT_INFO  # the env file does not contain the export statement
        export SSH_AUTH_SOCK   # enable gpg-agent for ssh

# xrandr handling
xrandr --output LVDS-0 --auto --primary --output VGA-0 --auto --left-of LVDS-0 &

exec awesome
