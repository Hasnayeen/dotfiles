return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
        opts = {
            inlay_hints = {
                show_parameter_hints = true,
                parameter_hints_prefix = " ",
                other_hints_prefix = " ",
            },
        },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				autostart = false,
			})
			lspconfig.tsserver.setup({
				autostart = false,
			})
            lspconfig.jsonls.setup({
                autostart = false,
            })
			lspconfig.phpactor.setup({})
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                autostart = false,
            })
            lspconfig.marksman.setup({
                autostart = false,
            })

			local wk = require("which-key")
			wk.register({
				l = {
					name = "LSP",
					a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code [A]ction" },
					h = { vim.lsp.buf.hover, "[H]over" },
					d = { vim.lsp.buf.definition, "[D]efinition" },
                    i = { vim.lsp.implementation, "[I]mplementation" },
				},
			}, { prefix = "<leader>" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup()
		end,
	},
	{
		"dgagn/diagflow.nvim",
		event = 'LspAttach',
        opts = {
            placement = 'inline',
            inline_padding_left = 3,
        },
	},
}
