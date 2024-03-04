# shellcheck shell=bash disable=SC1091,SC2059,SC2016,SC2288
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
	local opt
	for opt; do
		if command -v "$opt" >/dev/null; then
			continue
		else
			return $?
		fi
	done
}

prompt_wakatime() {
	local entity project
	entity="$(fc -ln -1)"
	entity=${entity##$'\t'}
	entity=${entity## }
	entity="${entity%% *}"
	# $entity is empty
	[ -n "$entity" ] || return
	project="$(git rev-parse --show-toplevel 2>/dev/null)" || project="$PWD"
	project="$(basename "$project")"
	# subshell to disable job finish message
	# [1]+  Done                    \wakatime XXX
	(\wakatime --write --plugin bash-wakatime --entity-type app --project "$project" --entity "$entity" &>/dev/null &)
}

declare -A platforms=(
	[unknown]=?
	[docker]=
	[android]=
	[linux]=
	[macos]=
	[windows]=
	[arch]=
	[centos]=
	[debian]=
	[gentoo]=
	[ubuntu]=
	[nixos]=
)
if has_cmd ps && [[ $(ps -p1 -ocmd=) == /sbin/docker-init ]]; then
	platform=docker
elif [[ ${PREFIX:-} == /data/data/com.termux/files/usr ]]; then
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
else
	platform=unknown
fi
prompt_icon=${platforms[$platform]}
if [ -z "$prompt_icon" ]; then
	platform=linux
	prompt_icon=${platforms[$platform]}
fi
if [[ -n ${SSH_TTY:-} || $USER == root ]]; then
	prompt_host_info=" \u@\h"
fi
unset platforms platform

prompt_get_ps1() {
	if [ $# = 0 ]; then
		set -- \
			black:white:"$prompt_icon${prompt_host_info:-} \#" \
			black:yellow:' \s \v' \
			black:white:' \t' \
			white:blue:" $(tput bold)\w" \
			white:black:'${GITSTATUS_PROMPT}'
	fi
	local -A colors=(
		[black]=0
		[red]=1
		[green]=2
		[yellow]=3
		[blue]=4
		[purple]=5
		[cyan]=6
		[white]=7
	)
	local ps='' last_bg='' sep='' format=' %s ' prompt_string='\n\$ '
	if [[ ! $1 =~ : ]]; then
		prompt_string=$1
		shift
	fi
	for section in "$@"; do
		if [[ ! $section =~ : ]]; then
			if [[ $section =~ %s ]]; then
				format=$section
			else
				sep=$section
			fi
			continue
		fi
		text=$(printf "$format" "${section##*:}")
		fg=${section%%:*}
		fg=${colors[$fg]:-$fg}
		bg=${section#*:}
		bg=${bg%%:*}
		bg=${colors[$bg]:-$bg}
		if [ -n "$last_bg" ]; then
			ps+="$(tput setaf "$last_bg" setab "$bg")$sep$(tput setaf "$fg")$text"
		else
			ps+="$(tput setaf "$fg" setab "$bg")$text"
		fi
		last_bg=$bg
	done
	ps+="\e[0m$(tput setaf "$last_bg")$sep\e[0m$prompt_string"
	echo "$ps"
}

if has_cmd wakatime; then
	PROMPT_COMMAND="prompt_wakatime; $PROMPT_COMMAND"
fi
