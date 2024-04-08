return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "●", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "◆", texthl = "", linehl = "debugBreakpoint", numhl = "debugBreakpoint" }
		)
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "", linehl = "debugPC", numhl = "debugPC" })
		dap.defaults.fallback.force_external_terminal = true

		require("dapui").setup({
			layouts = {
				{
					elements = {
						"watches",
						{ id = "scopes", size = 0.5 },
						{ id = "repl", size = 0.15 },
					},
					size = 30,
					position = "right",
				},
				{
					elements = {
						"console",
					},
					size = 0.25,
					position = "bottom",
				},
			},
			controls = {
				enabled = true,
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "↻",
					terminate = "□",
				},
			},
		})

		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { "/home/hasnayeen/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
		}

		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = "9003",
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local wk = require("which-key")
		wk.register({
			["<leader>d"] = {
				name = "Debug",
				h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Show [H]over" },
				p = { "<cmd>lua require('dap.ui.widgets').preview()<CR>", "Show [P]review" },
				f = {
					"<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)<CR>",
					"Show [F]rames",
				},
				s = {
					"<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
					"Show [S]copes",
				},
				b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle [B]reakpoint" },
				t = { "<cmd>DapTerminate<CR>", "[T]erminate" },
			},
			{
				["<F5>"] = { "<cmd>DapContinue<CR>", "Continue" },
				["<F6>"] = {
					function()
						dap.pause()
					end,
					"Pause",
				},
				["<F7>"] = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
				["<F8>"] = {
					function()
						dap.terminate()
						dap.close()
						vim.cmd("sleep 50ms")
						dap.repl.close()
						dapui.close()
					end,
					"Close All",
				},
				["<F10>"] = { "<cmd>DapStepInto<CR>", "Step Into" },
				["<F11>"] = { "<cmd>DapStepOver<CR>", "Step Over" },
				["<F12>"] = { "<cmd>DapStepOut<CR>", "Step Out" },
			},
		}, { mode = { "n", "v" } })
	end,
}
