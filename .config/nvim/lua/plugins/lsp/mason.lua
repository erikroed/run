return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"ts_ls",
			"lua_ls",
			"eslint",
		},
	},
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "»",
						package_uninstalled = "x",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
}
