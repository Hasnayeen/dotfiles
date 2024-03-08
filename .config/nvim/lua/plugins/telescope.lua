return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
			vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch Open [B]uffers" })
			vim.keymap.set("n", "<leader>sf", function()
				builtin.find_files({ hidden = true })
			end, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })

			vim.keymap.set("n", "<leader>sc", function()
				builtin.commands(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[S]earch [C]ommands" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer]" })

			vim.keymap.set("n", "<leader>ss", function()
				builtin.spell_suggest(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[S]earch [S]pelling suggestions" })
			-- vim.keymap.vim.keymap.set('n', '<leader>ff', builtin.find_files)
			-- vim.keymap.vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			-- vim.keymap.vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			-- vim.keymap.vim.keymap.set('n', '<leader>fht', builtin.help_tags, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					aerial = {
						-- Display symbols as <root>.<parent>.<symbol>
						show_nesting = {
							["_"] = false, -- This key will be the default
							json = true, -- You can set the option for specific filetypes
							yaml = true,
						},
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("noice")
		end,
	},
}
