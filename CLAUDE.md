# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal zsh/bash dotfiles for WSL2 + Linux. Cloned to `$HOME/.dotfiles` and sourced from the user's `~/.zshrc` / `~/.bashrc`. There is no build, no lint, no test suite — changes are validated by reloading the shell (`rl`) or restarting it.

## Load flow (critical for knowing where to put things)

The entry point (`.zshrc` or `.bashrc`) sets `DOTFILES_ROOT`, then sources `.init`, then `.sources`.

`.init` defines the helper functions that the rest of the repo relies on: `pathadd`, `prepend_path`, `setenv`, `source_if_exists`, `eval_if_exists`, `source_files`, `run_if_exists`, `reload_shell_config` (alias `rl`). It also runs `scripts/create_symlinks.sh` **only when the repo HEAD has changed** (gated by `~/.cache/dotfiles_head`) — don't expect symlinks to refresh on every shell start.

`.sources` then sources files from `config/` and `functions/` in this strict order. The order is load-bearing — env/paths must exist before functions that reference them, functions must exist before aliases that wrap them:

1. `config/**/*.env`         — env vars
2. `config/**/*.paths`       — PATH-like manipulation (uses `pathadd` / `prepend_path` from `.init`)
3. Shell-specific: zsh → `config/zsh/*.zsh` + `config/**/*.zsh`; bash → `config/bash/*.bash` + `config/**/*.bash`
4. `config/**/*.rc`          — shell-agnostic rc snippets
5. `config/**/*.functions`   — shared shell functions
6. `functions/*`             — every file in `functions/` (no extension filter)
7. `config/**/*.aliases`     — aliases (last so they can reference any function above)
8. `$DOTFILES_LOCAL_ROOT/*`  — machine-local overrides from `~/.dotfiles-local` (gitignored, sourced last)
9. `config/.shellrc`         — final hook for run-once commands

**Adding new config**: drop a file under `config/<tool>/` with the right extension and it auto-loads. No registration needed. The subdirectory is purely organizational — globbing is recursive.

## Directory layout

- `bin/` — scripts on `PATH` (added in `config/.paths`). Made executable automatically by `.init`. `bin/aws/` is also on PATH.
- `config/` — sourced config grouped by tool. Many tool subdirs (`aws/`, `git/`, `k8s/`, `terraform/`, etc.) exist as empty placeholders ready to receive files.
- `functions/` — shell function library files, all sourced. Files have no extension by convention.
- `scripts/` — one-off setup helpers, not auto-sourced. `create_symlinks.sh` is invoked from `.init`.

## Symlinks created on install

`scripts/create_symlinks.sh` is the only place that touches `$HOME` outside the repo. It currently links: `~/.config/starship.toml`, `~/.nanorc`, `~/.nano`, `~/.config/nano`, `~/.gitmessage`, `~/.gitignore`, `~/.git_aliases`. If you add a new tool whose config can't read env vars (like `.gitconfig`), add it here.

## Shell compatibility

Most code targets both zsh and bash. Watch for:
- `source_files` uses zsh-native globbing under zsh and `find` under bash — preserve both branches when editing it.
- `.zshrc` does zsh-specific work (compinit, plugins under `$ZSH_PLUGINS_DIR=$HOME/.zsh/plugins`, lazy-load NVM, starship init, atuin, direnv). `.bashrc` is minimal — just sources `.init` and `.sources`.
- Shell-specific code goes in `config/zsh/*.zsh` or `config/bash/*.bash`. Shared code uses `*.rc`, `*.functions`, or `*.aliases`.

## Common workflows

- `up` — pull latest from origin and reload shell (auto-stashes local changes first).
- `rl` — re-source rc files without pulling.
- `ipkg <pkg>` — distro-agnostic install via `functions/install_package` (apt/dnf/yum/pacman/zypper/apk).
- `sfch` / `fch <path>` — mark-and-diff filesystem snapshot (see README for the sudo invocation pattern).
- `venvs` / `venvs_clean` — Python venv disk audit + cleanup (`functions/python`).
- `docker_du` / `docker_clean` — Docker disk audit + cleanup (`functions/docker`).
- `gitstale` / `gitprune` — list / interactively delete stale local branches (`functions/git`).

## Linting

`.pre-commit-config.yaml` runs shellcheck on bash-compatible files and `zsh -n`
on zsh files. Install once with `pip install pre-commit && pre-commit install`,
then it runs on every commit. To lint everything now: `pre-commit run --all-files`.

zsh-specific files (`.zshrc`, `config/zsh/*.zsh`, `functions/setup_terminal_keys`)
are excluded from shellcheck because it can't parse zsh syntax.

## Conventions

- Local-only customization goes in `~/.dotfiles-local/` (sourced last, gitignored, outside repo).
- Use `source_if_exists` / `eval_if_exists` / `run_if_exists` from `.init` rather than bare `source` or `eval` — the repo runs on machines that may lack any given tool, and missing tools must not error out shell startup.
- Use `pathadd` / `prepend_path` instead of writing to `$PATH` directly. They dedupe and check that the directory exists.
- Keep startup fast: NVM is lazy-loaded, public-IP lookup runs in background with a cache file, symlink script is HEAD-gated. New work in the startup path should respect that.
