return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = require("user.palette")
		local theme = require("user.lualine_theme")

		local function get_mode_icon()
			local mode_icon = {
				n = "󰆾",
				i = "",
				c = "󰘳",
				v = "󰈈",
				V = "󰈈",
				[""] = "󰈈",
				R = "",
				t = "",
			}
			return mode_icon[vim.fn.mode()]
		end

		local function get_diagnostic_icon()
			return ""
		end

        local function get_buffers_icon()
            return ""
        end

		require("lualine").setup({
			options = {
				theme = theme,
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						get_mode_icon,
						color = { fg = colors.crust, bg = colors.pink, gui = "bold" },
					},
					{
						"mode",
						color = { fg = colors.text, bg = colors.base },
						fmt = function(mode)
							return mode:sub(1, 3)
						end,
					},
				},
				lualine_b = {
					{
						"branch",
						icon = { " ", color = { fg = colors.crust, bg = colors.green } },
						color = { fg = colors.text, bg = colors.base },
					},
					{
						"diff",
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.yellow },
							removed = { fg = colors.red },
							bg = colors.base,
						},
						icon = { " ", color = { fg = colors.crust, bg = colors.yellow } },
					},
				},
				lualine_c = {
                    {
                        get_diagnostic_icon,
                        color = { fg = colors.crust, bg = colors.lavender },
                    },
                    {"diagnostics"},
                },
				lualine_x = {
					"buffer",
					{
						"searchcount",
						icon = { "  ", align = "right", color = { fg = colors.crust, bg = colors.mauve } },
					},
				},
				lualine_y = {
					{
						"buffers",
						color = { fg = colors.text, bg = colors.base },
						hide_filename_extension = true,
						buffers_color = {
							active = { fg = colors.red },
							inactive = { fg = colors.green },
						},
					},
                    {
                        get_buffers_icon,
                        color = { fg = colors.crust, bg = colors.peach },
                    }
				},
				lualine_z = {
					{
						"location",
						icon = { "  ", align = "right", color = { fg = colors.crust, bg = colors.teal } },
						color = { fg = colors.text, bg = colors.base },
					},
				},
			},
		})
	end,
}
