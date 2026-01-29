# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal developer environment setup repository — a collection of bash installation scripts, dotfiles, and configuration for automating a complete Linux/Ubuntu development environment.

## Key Commands

```bash
./run              # Run all installation scripts in runs/
./run <tool>       # Run a specific installer (e.g., ./run docker)
./run --dry <tool> # Dry-run to preview which scripts would execute
./dev              # Copy dotfiles and configs to system directories (~/.config/, ~/.local/, etc.)
./gitconfig        # Interactive setup for dual personal/work Git profiles with separate SSH keys
```

There is no build system, test suite, or linter.

## Architecture

- **`run`** — Main orchestrator. Discovers and sequentially executes all executable files in `runs/`. Accepts an optional filter argument to match specific scripts.
- **`runs/`** — ~38 standalone bash installer scripts, each named after the tool they install (e.g., `runs/docker`, `runs/go`, `runs/neovim`). Scripts are independent with no inter-dependencies.
- **`dev`** — Copies config directories from `.config/` and `.local/` plus shell dotfiles (`.bash_aliases`, `.bash_profile`) to the user's home directory.
- **`gitconfig`** — Interactive script that sets up conditional git includes and separate SSH keys for personal vs. work directories.

### Dotfiles / Configuration

- **`.config/nvim/`** — Neovim config using Lazy.nvim plugin manager. Entry point is `init.lua`, plugins are defined in `lua/plugins/`, editor options in `lua/config/options.lua`, keybindings in `lua/config/keybindings.lua`.
- **`.config/tmux/tmux.conf`** — Tmux with Ctrl+a prefix and catppuccin theme.
- **`.local/scripts/`** — Custom shell utilities (`tmux-sessionizer` for fuzzy project switching, `ready-tmux` for project startup).
- **`.bash_aliases`** — Shell aliases (e.g., `vim` → `nvim`, `k` → `kubectl`).
- **`.bash_profile`** — PATH extensions and shell initialization.

## Conventions

- All bash scripts use `#!/usr/bin/env bash` shebang and must be executable.
- Installation scripts use `sudo` for system-level installs and clean up temporary files after download.
- Git clone operations in scripts use HTTPS (not SSH).
- Commit messages follow `type(scope): message` format (e.g., `fix(fzf): use HTTPS instead of SSH`).
- Neovim plugins follow the Lazy.nvim spec pattern: `return { "owner/plugin-name", config = function() ... end }`.
- Space is the Neovim leader key.
