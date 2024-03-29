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
                c = { api.call('toggle.linewise.current', 'g@$'), "Toggle [C]omment" },
                b = { api.call('toggle.blockwise.current', 'g@$'), "Toggle [B]lock Comment" },
                m = { api.call('toggle.linewise', 'g@'), "Toggle [M]ultiple Comment" },
            },
        }, { prefix = "<leader>", expr = true})
    end
}
