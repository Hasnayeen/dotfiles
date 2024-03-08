return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
    config = function ()
        local api = require('Comment.api')
        local wk = require('which-key')
        wk.register({
            mode = {"n", "v"},
            c = {
                name = "Comment",
                c = { api.toggle.linewise.current, "Toggle [C]omment" },
                b = { api.toggle.blockwise.current, "Toggle [B]lock Comment" },
                m = { api.call('toggle.linewise', 'g@'), "Toggle [M]ultiple Comment" },
            },
        }, { prefix = "<leader>", expr = true})
    end
}
