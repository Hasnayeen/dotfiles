local harpoon = require("plugins.harpoon")

local function set(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss Noice Message"})

-- Harpoon keybinds --
-- Open harpoon ui
set("n", "<leader>ho", function()
	harpoon.ui.toggle_quick_menu()
end)

-- Add current file to harpoon
set("n", "<leader>ha", function()
	harpoon.mark.add_file()
end)

-- Remove current file from harpoon
set("n", "<leader>hr", function()
	harpoon.mark.rm_file()
end)

-- Remove all files from harpoon
set("n", "<leader>hc", function()
	harpoon.mark.clear_all()
end)

-- Quickly jump to harpooned files
set("n", "<leader>1", function()
	harpoon.ui.nav_file(1)
end)

set("n", "<leader>2", function()
	harpoon.ui.nav_file(2)
end)

set("n", "<leader>3", function()
	harpoon.ui.nav_file(3)
end)

set("n", "<leader>4", function()
	harpoon.ui.nav_file(4)
end)

set("n", "<leader>5", function()
	harpoon.ui.nav_file(5)
end)

