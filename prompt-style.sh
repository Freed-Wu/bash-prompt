# shellcheck shell=bash disable=SC1091
# GNU/Linux
if [ -f /usr/share/zsh-theme-powerlevel10k/gitstatus/gitstatus.prompt.sh ]; then
	. /usr/share/zsh-theme-powerlevel10k/gitstatus/gitstatus.prompt.sh
# NixOS
elif [ -f /run/current-system/sw/share/zsh-powerlevel10k/gitstatus/gitstatus.prompt.sh ]; then
	. /run/current-system/sw/share/zsh-powerlevel10k/gitstatus/gitstatus.prompt.sh
# Nix
elif [ -f "${XDG_STATE_HOME:-$HOME/.local/state}/nix/profile/share/zsh-powerlevel10k/gitstatus/gitstatus.prompt.sh" ]; then
	. "${XDG_STATE_HOME:-$HOME/.local/state}/nix/profile/share/zsh-powerlevel10k/gitstatus/gitstatus.prompt.sh"
# Old Nix
elif [ -f ~/.nix-profile/share/zsh-powerlevel10k/gitstatus/gitstatus.prompt.sh ]; then
	. "$HOME/.nix-profile/share/zsh-powerlevel10k/gitstatus/gitstatus.prompt.sh"
fi

has_cmd() {
	for opt in "$@"; do
		command -v "$opt" >/dev/null
	done
}

declare -A platforms=(
	[android]=
	[arch]=
	[centos]=
	[debian]=
	[docker]=
	[gentoo]=
	[linux]=
	[macos]=
	[ubuntu]=
	[nixos]=
	[windows]=
)
if has_cmd ps && [[ $(ps -p1 -ocmd=) == /sbin/docker-init ]]; then
	platform=docker
elif [[ $PREFIX == /data/data/com.termux/files/usr ]]; then
	platform=android
elif [[ $OSTYPE == darwin ]]; then
	platform=macos
elif [[ $OSTYPE == msys2 || $OSTYPE == cygwin ]]; then
	platform=windows
elif has_cmd lsb_release; then
	platform=$(lsb_release -i)
	platform=${platform##*:}
	platform=${platform:1}
	platform=$(tr '[:upper:]' '[:lower:]' <<<"$platform")
elif [[ $OSTYPE == linux-gnu ]]; then
	platform=linux
fi
icon=${platforms[$platform]}
if [ -z "$icon" ]; then
	platform=linux
	icon=${platforms[$platform]}
fi
if [[ -n $SSH_TTY || $USER == root ]]; then
	host_info=" \u@\h"
fi

PS1='\[\e[30;47m'" $icon $host_info"'\e[37;43m\e[30m  \s \v \e[33;47m\e[30m  \t \e[37;44m\e[37m  \e[1m\w \e[0;34;40m \e[32m ${GITSTATUS_PROMPT}\e[40m \e[0;30m\e[0m\]\n$ '
unset platforms platform icon host_info has_cmd
