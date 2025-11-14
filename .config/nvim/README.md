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

# harpoon
vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)

# none-ls
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

# lazygit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" })
```
