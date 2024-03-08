return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'catppuccin',
           		globalstatus = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "█", right = "█" },
            },
            sections = {
                lualine_x = {'buffer', 'searchcount'},
            },
            inactive_winbar = {
                lualine_y = {'%m'},
                lualine_z = {'filename'}
            }
        })
    end
}
