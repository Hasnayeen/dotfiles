return {
	"adalessa/laravel.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"tpope/vim-dotenv",
		"MunifTanjim/nui.nvim",
		"nvimtools/none-ls.nvim",
	},
	cmd = { "Artisan", "Composer", "Npm", "Laravel" },
	-- keys = {
	-- 	{ "<leader>la", ":Laravel artisan<cr>" },
	-- 	{ "<leader>lr", ":Laravel routes<cr>" },
	-- 	{ "<leader>lm", ":Laravel related<cr>" },
	-- },
	event = { "VeryLazy" },
	config = function ()
	    require("laravel").setup({})
        local wk = require("which-key")
        wk.register({
            z = {
                name = "Laravel",
                a = { ":Laravel artisan<cr>", "Laravel artisan" },
                r = { ":Laravel routes<cr>", "Laravel routes" },
                m = { ":Laravel related<cr>", "Laravel related" },
            },
        }, {
            prefix = "<leader>",
        })
	end
}
