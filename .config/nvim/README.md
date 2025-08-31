# Nvim config

This folder contains my neovim config.

## Keybindings

This section will describe my configured keybindings for the different plugins, so I have them all in one place to remind myself about them:

```txt
# Remappings
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("v", "<leader>y", '"+y')

# telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

# lsp-config
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

# none-ls
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
```
