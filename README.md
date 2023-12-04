# bash-prompt

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/bash-prompt/main.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/bash-prompt/main)
[![github/workflow](https://github.com/Freed-Wu/bash-prompt/actions/workflows/main.yml/badge.svg)](https://github.com/Freed-Wu/bash-prompt/actions)
[![codecov](https://codecov.io/gh/Freed-Wu/bash-prompt/branch/main/graph/badge.svg)](https://codecov.io/gh/Freed-Wu/bash-prompt)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/bash-prompt/total)](https://github.com/Freed-Wu/bash-prompt/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/bash-prompt/latest/total)](https://github.com/Freed-Wu/bash-prompt/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt)
[![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt)
[![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt)
[![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt)
[![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt)
[![github/v](https://shields.io/github/v/release/Freed-Wu/bash-prompt)](https://github.com/Freed-Wu/bash-prompt)

This project provides:

- A [powerlevel10k](https://github.com/romkatv/powerlevel10k)-like prompt style
  of bash.

![screenshot](https://github.com/Freed-Wu/Freed-Wu/assets/32936898/5c145ca4-7565-4410-9e84-99cec7476f83)

- A wakatime plugin to statistic how much time you write bash in REPL.

![wakatime](https://user-images.githubusercontent.com/32936898/226532448-84086ab6-241a-45f0-b8c1-6db8a7bb3fcf.jpg)

## Dependencies

- [gitstatus](https://github.com/romkatv/gitstatus): provide git status
- [wakatime-cli](https://github.com/wakatime/wakatime-cli)

## Install

### [AUR](https://aur.archlinux.org/packages/bash-prompt-git)

```sh
paru -S bash-prompt-git
```

### [NUR](https://nur.nix-community.org/repos/freed-wu)

```sh
nix-env -iA nixos.nur.repos.Freed-Wu.bash-prompt
```

## Usage

`~/.bashrc`:

```sh
. /the/path/of/this/plugin/prompt.sh
# GNU/Linux
. /usr/share/bash-prompt/prompt.sh
# NixOS
. /run/current-system/sw/share/bash-prompt/prompt.sh
# Nix
. "${XDG_STATE_HOME:-$HOME/.local/state}/nix/profile/share/bash-prompt/prompt.sh"
```

By default, it will enable wakatime. You can disable it by removing
`prompt_wakatime` from `$PROMPT_COMMAND`.

By default, it will not change your prompt. You should enable it by:

```sh
PS1="$(prompt_get_ps1)"
# or you can customize
PS1="$(prompt_get_ps1 [prompt_string] [[format] fg_color:bg_color:text [sep]] ...)"
```

![prompt_get_ps1](https://github.com/Freed-Wu/bash-prompt/assets/32936898/efe0951f-155a-4b0a-8ef2-ed40fcd79900)

See
[powerline-extra-symbols](https://github.com/ryanoasis/powerline-extra-symbols)
for `sep`.

`text` can be:

- `"$prompt_icon"`: icon of OS
- `'${GITSTATUS_PROMPT}'`: git status information. See
  [gitstatus](https://github.com/romkatv/gitstatus) to know how to customize
  it.
- [prompt escape code](https://www.gnu.org/software/bash/manual/bash.html#Controlling-the-Prompt)

`fg_color`/`bg_color` can be color name or color value.
See _Color Handling_ of
[`man 5 terminfo`](https://man7.org/linux/man-pages/man5/terminfo.5.html).
