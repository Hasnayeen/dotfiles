return {
    "rcarriga/nvim-notify",
    config = function ()
        vim.notify = require("notify")
        require("notify").setup({
            background_colour = '#050509',
            timeout = 2000,
        })
        vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#40a02b" })
        vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#40a02b" })
        vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#40a02b" })
    end
}
