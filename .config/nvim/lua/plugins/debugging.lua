return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

        require("dapui").setup()

        dap.adapters.php = {
          type = 'executable',
          command = 'node',
          args = { '/home/hasnayeen/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js' }
        }

        dap.configurations.php = {
          {
            type = 'php',
            request = 'launch',
            name = 'Listen for Xdebug',
            port = '9003'
          }
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

		vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
	end,
}
