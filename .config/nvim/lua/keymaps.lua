local wk = require("which-key")

-- Insert mode keybinds --
wk.register({
	["<esc>"] = {
		name = "Escape",
		["<esc>"] = { "<esc>", "Escape" },
		s = { "<cmd>w<CR>", "[W]rite" },
		q = { "<cmd>q<CR>", "[Q]uit" },
		e = { "<cmd>q!<CR>", "Force [E]xit" },
		a = { "<cmd>wa<CR>", "Write [A]ll" },
		w = { "<cmd>wqa<CR>", "[W]rite & Quit" },
	},
}, { mode = "i", noremap = true })

-- Common command keybinds --
wk.register({
	q = {
		name = "Quit",
		q = { "<cmd>q<CR>", "[Q]uit" },
		e = { "<cmd>q!<CR>", "Force [E]xit" },
		w = { "<cmd>wqa<CR>", "[W]rite & Quit" },
		s = { "<cmd>w<CR>", "[S]ave" },
		a = { "<cmd>wa<CR>", "[A]ll" },
	},
}, { prefix = "<leader>" })

-- Buffer keybinds --
wk.register({
	b = {
		name = "Buffer",
		n = { "<cmd>bnext<CR>", "[N]ext buffer" },
		p = { "<cmd>bprevious<CR>", "[P]revious buffer" },
		d = { "<cmd>bd<CR>", "[D]elete buffer" },
		f = { "<cmd>bfirst<CR>", "[F]irst buffer" },
		l = { "<cmd>blast<CR>", "[L]ast buffer" },
	},
}, { prefix = "<leader>" })

-- Text modification keybinds --
wk.register({
	["<C-d>"] = { "<cmd>t.<CR>", "[D]uplicate line" },
	["<C-s>"] = { "<cmd>%s/\\s\\+$//e<CR>", "[S]trip trailing whitespace" },
}, { mode = { "i", "n" } })

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

-- Miscellaneous keybinds --
wk.register({
    v = {
        name = "Misc",
        t = { "<cmd>Twilight<CR>", "[T]wilight toggle" },
        z = { "<cmd>ZenMode<CR>", "[Z]en Mode" },
    }
}, { prefix = "<leader>" })
