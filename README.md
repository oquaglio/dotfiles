# dotfiles

My dotfiles. I use zsh and things seem to work well. I also tested bash, but not very carefully.

## Example Prompt

<img src="https://github.com/user-attachments/assets/0c7cedfe-b8b1-471e-850c-34bacc675863" alt="terminal screenshot" width="800" />


## Installation

1. Clone:

``` SH
git clone --depth 1 --branch master https://github.com/oquaglio/dotfiles.git $HOME/.dotfiles >/dev/null;
```

2. Add the following to .rc files:

``` SH
if [ -f $HOME/.dotfiles/.zshrc ]; then
    source $HOME/.dotfiles/.zshrc
fi
```

``` SH
if [ -f $HOME/.dotfiles/.bashrc ]; then
    source $HOME/.dotfiles/.bashrc
fi
```

3. Reload shell (will also create symbolic links)

4. Add to ~/.gitconfig for git setup:

```SH
[commit]
    template = ~/.gitmessage

[include]
    path = ~/.git_aliases

[core]
    excludesfile = ~/.gitignore
```

5. Add any custom files to source to this dir:

``` SH
~/.dotfiles-local
```

## Setup Locale

### Ubuntu:

```SH
sudo nano /etc/locale.gen
```

Add:
```
en_AU.UTF-8 UTF-8
```

Run gen locale:
```SH
sudo locale-gen
```

Update locale:
```
sudo nano /etc/default/locale
```

```
LANG=en_AU.UTF-8
# Optional: remove or comment out the rest
# LANGUAGE=en_US.UTF-8
# LC_ALL=C
```

Could also do:
```SH
sudo update-locale LANG=en_AU.UTF-8
```
Check:
```SH
locale
```

## Getting Updates

(These are aliases that have been added as part of these dotfiles)

Get latest updates from github and reload everything ("[up]date dotfiles"):

```SH
up
```

Re-run the shell (which will source the config) without getting updates from github ("[r]e[l]oad"):

```SH
rl
```

## Optional

I use starship prompt. Install it with your package manager and add it to your .rc file(s):

```SH
eval "$(starship init zsh)"
```

Also add this for the prompt:

For WSL distros:
```SH
export DISTRO_NAME="$WSL_DISTRO_NAME"
```
Note: WSL_DISTRO_NAME is automatically set by the WSL runtime

or:

```SH
export DISTRO_NAME="My Distro"
```

or:

```
export DISTRO_NAME=$(. /etc/os-release; echo $ID$VERSION_ID)
```

## What's in the Box

The most useful tools, aliases, and functions provided by these dotfiles.
Anything wrapping an external binary (`fzf`, `eza`, `bat`, `rg`, `fd`, `zoxide`,
`atuin`, `starship`, etc.) is auto-installed via `install_deps -i`.

### Shell management

| Command | What it does |
|---|---|
| `up` | Pull latest dotfiles from origin and reload the shell. |
| `rl` | Re-source shell config without pulling. Also warns about any missing deps. |
| `ipkg <pkg>` | Distro-agnostic package install (apt/dnf/yum/pacman/zypper/apk). |
| `install_deps` | List missing CLI deps the dotfiles use. `-i` to install, `-u` to also upgrade. |
| `e [<term>]` | Print env vars (sorted, with match count). Optional `<term>` filters case-insensitively and highlights. |
| `paths` | Print `$PATH`, `$MANPATH`, `$PYTHONPATH`, etc. line-by-line. |

### Navigation

| Command | What it does |
|---|---|
| `z <term>` | Jump to most-used dir matching `<term>` (zoxide). `z foo bar` matches both. |
| `zi [<term>]` | Interactive fzf picker over the zoxide db. |
| `f` | Fuzzy-pick a directory under `.` (with `eza` tree preview) and `cd` into it. |
| `-` | Toggle between current and last dir (`cd -`). |
| `..`, `..2`, `..3`, `..4`, `..5` | Up N levels. |

### Listing & searching

| Command | What it does |
|---|---|
| `l` | `eza` long listing — all files, icons, git status, sorted dirs first. |
| `lt` | Same as `l` plus directory total sizes. |
| `tt` | `tree -alpugifhDFC` — colored tree with perms, owner, size. |
| `fz` | Fuzzy-pick any file with `bat` preview. Compose: `vim "$(fz)"`. |
| `fzrg <term>` | Ripgrep → fzf → open match in `$EDITOR` at the right line. Smart-case. |

### Git

| Command | What it does |
|---|---|
| `g` | No args: print user config + `git diff --stat`. With args: passthrough to `git`. |
| `gw` | `git-wtf` — branch/upstream status summary. |
| `gf` | List tracked files by last-modified, with size. |
| `gfe` | Find empty dirs (git won't track them). |
| `gke` | Drop a `.gitkeep` into every empty dir to make git track them. |
| `gitstale` | List local branches that look stale (no upstream, merged, etc.). |
| `gitprune` | Interactively delete stale local branches. |
| `fbr`, `gco`, `fadd` | fzf-powered branch/checkout/add helpers. |
| `nukegitdirs` | Recursively delete nested `.git` dirs (with confirmation prompt). |

### Docker

| Command | What it does |
|---|---|
| `d` | No args: `docker ps -a`. With args: passthrough. |
| `dr` | Running containers. |
| `da` | All containers. |
| `di` | Images. |
| `dl <id>` | Logs. |
| `dn` | Networks. |
| `dexec` | fzf-pick a running container and `exec -it` into a shell. |
| `dlog` | fzf-pick a container and tail its logs. |
| `dauth` | Decode auths from `~/.docker/config.json`. |
| `docker_du` | Disk usage breakdown across images/containers/volumes. |
| `docker_clean` | Interactive prune of unused docker resources. |

### Kubernetes

| Command | What it does |
|---|---|
| `k` | Alias for `kubectl`. |
| `kp` | `kubectl get pods -A -o wide`. |
| `kex <kind>` | `kubectl explain`. |
| `kr` | `kubectl api-resources`. |
| `kpod` | fzf-pick a pod across all namespaces; tail logs. `-e` to `exec -it` instead. |
| `mk` | `minikube kubectl --`. |

### AWS

| Command | What it does |
|---|---|
| `a` / `aws` | No args: show current account, ARN, region, profile, and AWS_* env vars. |
| `sa <profile>` | Export `AWS_PROFILE=<profile>`. |
| `awsprofile` | fzf-pick a profile from `~/.aws/config` and verify with `sts`. |
| `chaws` | Check current AWS session is valid. |
| `awskill` | Unset all `AWS_*` env vars. |
| `s3cat s3://...` | Cat an S3 object (pretty-prints JSON via `jq`). |

### Python

| Command | What it does |
|---|---|
| `venvs` | Audit Python venvs on disk (size, last-used). |
| `venvs_clean` | Interactive cleanup of stale venvs. |

### System info

| Command | What it does |
|---|---|
| `sys` | System overview: distro, kernel, CPU, memory, disk, uptime. |
| `load` | Load averages shown as per-CPU % (color-coded) plus memory used. |
| `kern` | Kernel version, architecture, loaded module count, available kernels. |
| `svc` | Detected init system (systemd/sysVinit/openrc) and its running services. |
| `meminfo` | `free -m -l -t -h` — memory and swap totals (incl. low/high). |
| `cpi` | `lscpu` — CPU details. |

### Network

| Command | What it does |
|---|---|
| `net [<term>]` | Plain-English network overview: ports **exposed** to other machines (your attack surface), interface-bound and **local-only** listeners, and **active** connections to remote hosts (loopback IPC filtered out) — with the program behind each. Ends with a counts summary, host IPs and gateway. Optional `<term>` filters by port/program/IP. Tries passwordless `sudo` for full program names. |
| `conn [<term>]` | Raw `ss` socket dump (all states) with the owning user resolved per PID. Optional `<term>` filters. |
| `ports` | `ss -tulanp` — listening TCP/UDP sockets with process. |

### Files & processes

| Command | What it does |
|---|---|
| `sfch` | Snapshot filesystem timestamps now (see "Using the fch Function" below). |
| `fch [path]` | Show files changed since the last `sfch`. |
| `probe <name\|path>` | Inspect a file, binary, or command: PATH/type resolution, realpath & symlink chain, file/MIME type, stat metadata, owning package, checksums, linked libs. Each section notes the command used. |
| `extract <archive>` | Distro/format-agnostic archive extractor. |
| `fkill` | fzf-pick a process and kill it. |
| `psm` / `psm10` | Processes sorted by memory (top 10 variant). |
| `psc` / `psc10` | Processes sorted by CPU (top 10 variant). |
| `psk <pid>` | `kill -9` (SIGKILL — unmaskable). |
| `pst <pid>` | `kill -15` (SIGTERM — graceful). |

### Productivity shortcuts

| Command | What it does |
|---|---|
| `c` | `clear`. |
| `t <name>` | `type` — show what an alias/function expands to. |
| `n`, `sn` | `nano` / `sudo nano`. |
| `v`, `sv` | `vim` / `sudo vim`. |
| `now`, `nowdate` | Current time / date. |
| `todo` | Open `~/.todo` in `$EDITOR`. |
| `sortclip`, `dedupclip` | Sort / dedupe clipboard contents (X11). |

## How-Tos

### Using the fch Function

This function scans your disk for file changes.

If you just want to check your home dir:

1. Run before changes (captures current timestamp):
``` SH
sfch
```

2. Do your things that result in files changes...

3. Check the files that changed:
```SH
fch
```

If you want to check the root dir (/), you need to run with sudo:
(But, sudo doesn't have any of our dotfiles, so first we source them manually)

``` SH
sudo -E zsh -c 'source $DOTFILES_ROOT/functions/file; sfch'
```

``` SH
sudo -E zsh -c 'source $DOTFILES_ROOT/functions/file; fch /'
```

## Testing

```SH
sudo -E bash -c '. $DOTFILES_ROOT/functions/_utils; set-x;  sfch'
bash -c 'source $DOTFILES_ROOT/.zshrc'
```

## Ref
https://github.com/p3rception/dotfiles



