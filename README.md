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
anything placed there shows up in the project switcher. Build trees and
downloads belong in `~/.cache` instead — see `runs/neovim` and `runs/k8sgpt`.

## Bluetooth audio auto-switching

Makes the system automatically switch audio output to a Bluetooth headset when it connects, and back to the default speakers when it disconnects.

### 1. Find your preferred fallback sink name

```bash
pactl list sinks short
```

Note the name of the sink you want as your default (e.g. your USB audio adapter).

### 2. Create the WirePlumber config file

```bash
mkdir -p ~/.config/wireplumber/wireplumber.conf.d
```

Create `~/.config/wireplumber/wireplumber.conf.d/51-bluetooth-auto-switch.conf`:

```
monitor.bluez.rules = [
  {
    matches = [{ device.name = "~bluez_card.*" }]
    actions = {
      update-props = {
        bluez5.auto-connect = [ hfp_hf hsp_hs a2dp_sink hfp_ag hsp_ag a2dp_source ]
        bluez5.hw-volume    = [ hfp_hf hsp_hs a2dp_sink hfp_ag hsp_ag a2dp_source ]
      }
    }
  }
  {
    matches = [
      { node.name = "~bluez_input.*" }
      { node.name = "~bluez_output.*" }
    ]
    actions = {
      update-props = {
        priority.session = 2000
      }
    }
  }
]

monitor.alsa.rules = [
  {
    matches = [
      { node.name = "<YOUR_SINK_NAME_HERE>" }
    ]
    actions = {
      update-props = {
        priority.session = 1500
      }
    }
  }
]
```

Replace `<YOUR_SINK_NAME_HERE>` with the sink name from step 1.

### 3. Clear any pinned default and restart WirePlumber

```bash
wpctl clear-default 0
systemctl --user restart wireplumber
```
