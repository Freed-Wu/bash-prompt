#! /usr/bin/env bats
#shellcheck disable=SC1090
setup() {
	cd "$(dirname "$BATS_TEST_FILENAME")/.." || exit
	. test/setup.sh
	export TERM=xterm
	. ./prompt.sh
}

@test prompt_get_ps1 {
	run printf "$(prompt_get_ps1 '' '%s' black:white:a '>' ' %s ' white:blue:b '<')"
	assert_output "$(printf "\e[30m\e[47ma\e[37m\e[44m>\e[37m b \e[0m\e[34m<\e[0m")"
}
