# bash-prompt-style

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/bash-prompt-style/main.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/bash-prompt-style/main)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/bash-prompt-style/total)](https://github.com/Freed-Wu/bash-prompt-style/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/bash-prompt-style/latest/total)](https://github.com/Freed-Wu/bash-prompt-style/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style)
[![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style)
[![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style)
[![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style)
[![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style)
[![github/v](https://shields.io/github/v/release/Freed-Wu/bash-prompt-style)](https://github.com/Freed-Wu/bash-prompt-style)

A [powerlevel10k](https://github.com/romkatv/powerlevel10k)-like prompt style
of bash.

![screenshot](https://github.com/Freed-Wu/Freed-Wu/assets/32936898/5c145ca4-7565-4410-9e84-99cec7476f83)

## Dependencies

- [gitstatus](https://github.com/romkatv/gitstatus): provide git status

## Install

### [AUR](https://aur.archlinux.org/packages/bash-prompt-style-git)

```sh
yay -S bash-prompt-style-git
```

### [NUR](https://nur.nix-community.org/repos/freed-wu)

```sh
nix-env -iA nixos.nur.repos.Freed-Wu.bash-prompt-style
```

## Usage

`~/.bashrc`:

```sh
. /the/path/of/this/plugin/prompt-style.sh
# GNU/Linux
. /usr/share/bash-prompt-style/prompt-style.sh
# NixOS
. /run/current-system/sw/share/bash-prompt-style/prompt-style.sh
# Nix
. "${XDG_STATE_HOME:-$HOME/.local/state}/nix/profile/share/bash-prompt-style/prompt-style.sh"
```

## Customize

```sh
# prompt_string is "\n$ " by default, which can be ignored
# format is a string like ' %s ' to add around whitespace for text,
# which can be ignored
# sep is '' by default, which can be ignored
PS1="$(prompt_get_ps1 [prompt_string] [[format] fg_color:bg_color:text [sep]] ...)"
```

![prompt_get_ps1](https://github.com/Freed-Wu/bash-prompt-style/assets/32936898/3583d5f8-c1b3-4783-b04c-60f7f490cad7)

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
