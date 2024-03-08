local wk = require("which-key")

-- Navigation keybinds --
wk.register({
    m = {
        name = "Navigation",
        h = { "<C-w>h", "[M]ove Left" },
        j = { "<C-w>j", "[M]ove Down" },
        k = { "<C-w>k", "[M]ove Up" },
        l = { "<C-w>l", "[M]ove Right" },
        v = { "<C-w>v", "[V]split" },
        m = { "<C-w>v<C-w>l", "[V]split [M]ove" },
    },
}, { prefix = "<leader>" })

wk.register({
    n = {
        name = "Noice Message",
        d = { "<cmd>NoiceDismiss<CR>", "[N]oice Message [D]ismissal" },
    },
}, { prefix = "<leader>" })

-- Window keybinds --
wk.register({
    w = {
        name = "Window",
        h = { "<C-w>H", "[W]indow Left" },
        j = { "<C-w>J", "[W]indow Down" },
        k = { "<C-w>K", "[W]indow Up" },
        l = { "<C-w>L", "[W]indow R]ight" },
        s = { "<C-w>S", "[W]indow [S]plit" },
        v = { "<C-w>V", "[W]indow] [V]split" },
        q = { "<C-w>Q", "[W]indow [Q]uit" },
    },
}, { prefix = "<leader>" })

