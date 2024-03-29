return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			-- convert all the keybindings to which keymap
			local wk = require("which-key")
			wk.register({

				s = {
					name = "Search",
					b = { builtin.buffers, "[S]earch Open [B]uffers" },
					f = { builtin.find_files, "[S]earch [F]iles" },
					x = {
						function()
							builtin.find_files({ find_command = { 'rg', '--files', '--no-ignore', '--hidden' }, })
						end,
						"[S]earch Files including Hidden",
					},
					g = { builtin.live_grep, "[S]earch [G]rep" },
					z = {
						function()
							builtin.live_grep({ additional_args = { "--no-ignore" } })
						end,
						"[S]earch Grep including Hidden",
					},
					h = { builtin.help_tags, "[S]earch [H]elp" },
					c = {
						function()
							builtin.commands(require("telescope.themes").get_dropdown({
								previewer = false,
							}))
						end,
						"[S]earch [C]ommands",
					},
					s = {
						function()
							builtin.spell_suggest(require("telescope.themes").get_dropdown({
								previewer = false,
							}))
						end,
						"[S]earch [S]pelling suggestions",
					},
					["/"] = {
						function()
							builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
								previewer = false,
							}))
						end,
						"[/] Fuzzily search in current buffer]",
					},
					["?"] = { builtin.oldfiles, "[?] Find recently opened files" },
				},
			}, { prefix = "<leader>" })

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
