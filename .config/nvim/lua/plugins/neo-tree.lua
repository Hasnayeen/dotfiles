return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                    hide_by_name = {},
                    hide_by_pattern = {},
                    always_show = {},
                    never_show = {},
                    never_show_by_pattern = {},
                },
                window = {
                    mappings = {
                      ["<bs>"] = "navigate_up",
                      ["."] = "set_root",
                      ["H"] = "toggle_hidden",
                      ["/"] = "fuzzy_finder",
                      ["D"] = "fuzzy_finder_directory",
                      ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                      -- ["D"] = "fuzzy_sorter_directory",
                      ["f"] = "filter_on_submit",
                      ["<c-x>"] = "clear_filter",
                      ["[g"] = "prev_git_modified",
                      ["]g"] = "next_git_modified",
                      ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
                      ["oc"] = { "order_by_created", nowait = false },
                      ["od"] = { "order_by_diagnostics", nowait = false },
                      ["og"] = { "order_by_git_status", nowait = false },
                      ["om"] = { "order_by_modified", nowait = false },
                      ["on"] = { "order_by_name", nowait = false },
                      ["os"] = { "order_by_size", nowait = false },
                      ["ot"] = { "order_by_type", nowait = false },
                    },
                    fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                      ["<down>"] = "move_cursor_down",
                      ["<C-n>"] = "move_cursor_down",
                      ["<up>"] = "move_cursor_up",
                      ["<C-p>"] = "move_cursor_up",
                    },
                  },
                }
        })
        local wk = require("which-key")
        wk.register({
            ["f"] = {
                name = "NeoTree",
                r = { "<cmd>Neotree refresh<CR>", "[R]efresh" },
                s = { "<cmd>Neotree find<CR>", "[S]earch" },
                t = { "<cmd>Neotree right toggle<CR>", "[T]oggle" },
                o = { "<cmd>Neotree right open<CR>", "[O]pen" },
                c = { "<cmd>Neotree close<CR>", "[C]lose" },
                f = { "<cmd>Neotree focus<CR>", "[F]ocus" },
                q = { "<cmd>Neotree quit<CR>", "[Q]uit" },
            },
        }, { prefix = "<leader>" })
    end
}

