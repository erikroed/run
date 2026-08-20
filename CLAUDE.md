# CLAUDE.md

## Project Overview

Personal developer environment setup repository — a collection of bash installation scripts, dotfiles, and configuration for automating a complete Linux/Ubuntu development environment.

## Key Commands

```bash
./run              # Run all installation scripts in runs/
./run <tool>       # Run a specific installer (e.g., ./run docker)
./run --dry <tool> # Dry-run to preview which scripts would execute
./dev              # Copy dotfiles and configs to system directories (~/.config/, ~/.local/, etc.)
./gitconfig        # Set up this machine's Git identity and SSH key (one identity per machine)
```

There is no build system, test suite, or linter.

## Conventions

- All bash scripts use `#!/usr/bin/env bash` shebang and must be executable.
- Scripts carry no explanatory comments; rationale belongs in the commit message.
- Installation scripts use `sudo` for system-level installs and clean up temporary files after download.
- Git clone operations in scripts use HTTPS (not SSH).
- Commit messages follow `type(scope): message` format (e.g., `fix(fzf): use HTTPS instead of SSH`).
- Neovim plugins follow the Lazy.nvim spec pattern: `return { "owner/plugin-name", config = function() ... end }`.
- Space is the Neovim leader key.
