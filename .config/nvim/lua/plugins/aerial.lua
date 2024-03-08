return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
        local wk = require("which-key")
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
                wk.register({
                    a = {
                        p = { "<cmd>AerialPrev<CR>", "[P]revious" },
                        n = { "<cmd>AerialNext<CR>", "[N]ext" },
                        l = { "<cmd>Telescope aerial<CR>", "[L]ist in telescope" },
                    },
                }, { prefix = "<leader>", buffer = bufnr })
			end,
		})
        wk.register({
            a = {
                name = "Aerial",
                t = { "<cmd>AerialToggle<CR>", "[T]oggle" },
            },
        }, { prefix = "<leader>" })
	end,
}
