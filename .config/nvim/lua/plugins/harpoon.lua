return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end
		local wk = require("which-key")
		wk.register({
			h = {
				name = "Harpoon",
				o = {
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					"[O]pen harpoon ui",
				},
				a = {
					function()
						harpoon:list():append()
					end,
					"[A]dd current file to harpoon",
				},
				r = {
                    function()
                        harpoon:list():remove()
                    end,
                    "[R]emove current file from harpoon",
                },
                p = {
                    function()
                        harpoon:list():prev()
                    end,
                    "[P]revious file from harpoon",
                },
                n = {
                    function()
                        harpoon:list():next()
                    end,
                    "[N]ext file from harpoon",
                },
                t = {
                    function()
                        toggle_telescope(harpoon:list())
                    end,
                    "Open harpoon in [T]elescope",
                },
			},
		}, { prefix = "<leader>" })
	end,
}
