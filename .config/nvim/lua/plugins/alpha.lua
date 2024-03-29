return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[ ███████████████████████████████████████████████████████████████████████████████████ ]],
			[[ ██                                                                               ██ ]],
			[[ ██ ██╗  ██╗ █████╗ ███████╗███╗   ██╗ █████╗ ██╗   ██╗███████╗███████╗███╗   ██╗ ██ ]],
			[[ ██ ██║  ██║██╔══██╗██╔════╝████╗  ██║██╔══██╗╚██╗ ██╔╝██╔════╝██╔════╝████╗  ██║ ██ ]],
			[[ ██ ███████║███████║███████╗██╔██╗ ██║███████║ ╚████╔╝ █████╗  █████╗  ██╔██╗ ██║ ██ ]],
			[[ ██ ██╔══██║██╔══██║╚════██║██║╚██╗██║██╔══██║  ╚██╔╝  ██╔══╝  ██╔══╝  ██║╚██╗██║ ██ ]],
			[[ ██ ██║  ██║██║  ██║███████║██║ ╚████║██║  ██║   ██║   ███████╗███████╗██║ ╚████║ ██ ]],
			[[ ██ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═══╝ ██ ]],
			[[ ███████████████████████████████████████████████████████████████████████████████████ ]],
		}

        dashboard.section.buttons.val = {}

		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local version = "  󰥱 v"
					.. vim.version().major
					.. "."
					.. vim.version().minor
					.. "."
					.. vim.version().patch
				local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				local footer = version .. "\t" .. plugins .. "\n"
				dashboard.section.footer.val = footer
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
