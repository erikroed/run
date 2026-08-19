# run
Dev environment inspired by the "My Dev Setup Is Better Than Yours" - https://frontendmasters.com/courses/developer-productivity-v2/

To get started:

1. Clone repo to computer
2. Run the scripts:

```sh
# Navigate into folder
cd run

# Install everything inside the runs folder
./run

# Or install specific tool from the runs folder
./run <tool>

# Or multiple tools at once
./run <tool1> <tool2>

# in example for docker
./run docker

# Install dotfiles, aliases etc.
./dev
```

## Project layout

Projects live directly in `$HOME/code`:

```
~/code/
├── run
├── homelab
└── ...
```

`tmux-sessionizer` lists the directories immediately under `~/code`, so
anything placed there shows up in the project switcher. Nothing installed by
`./run` belongs there: tools built from source live in `/opt` (`runs/fzf`,
`runs/neovim`) and downloads use a temporary directory (`runs/k8sgpt`).

