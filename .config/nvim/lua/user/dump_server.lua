local job_id, buf
vim.notify = require("notify")
-- Define a function to start the Symfony dump server
function start_symfony_dump_server()
	-- Define the command to start the Symfony dump server
	local cmd = { "/home/hasnayeen/.config/composer/vendor/bin/var-dump-server" }

	vim.cmd("botright vs")
	local win = vim.api.nvim_get_current_win()
	local tmp_dir = vim.fn.tempname()
	buf = vim.api.nvim_create_buf(true, false)
	vim.api.nvim_win_set_buf(win, buf)
    vim.api.nvim_win_set_width(win, 60)
	local file_path = "/tmp/log.dump" -- Specify the file path
	vim.api.nvim_buf_set_name(buf, file_path)
	vim.api.nvim_buf_call(buf, function()
		vim.cmd("w! " .. file_path)
	end)
	vim.api.nvim_set_option_value("filetype", "dump", { buf = buf })
	local first_time = true
	local prepend_data = function(_, data)
		-- print("Prepending data", table.unpack(data))
		if first_time then
			print(string.find(data[1], "Quit the server with CONTROL"))
			if string.match(data[1], "Quit the server with CONTROL") then
				print("Symfony dump server started")
				first_time = false
			end
			return
		end

		local line = table.unpack(data)
		if line and #line ~= 0 then
			vim.api.nvim_win_set_cursor(win, { 1, 0 })
			vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
			vim.api.nvim_command("w")
		end
	end
	-- Start the Symfony dump server as a background job
	job_id = vim.fn.jobstart(cmd, {
		stdout_buffered = false,
		stderr_buffered = false,
		on_stdout = prepend_data,
		on_stderr = prepend_data,
		on_exit = function(id, exit_code, event_type)
			print("Job ID:", id)
			print("Exit code:", exit_code)
			print("Event type:", event_type)

			-- Handle exit of the job if needed
			print("Symfony dump server exited")
		end,
	})

	prepend_data(nil, { "Symfony dump server started" })
	print(buf, "buf")

	-- Check if the job started successfully
	if job_id <= 0 then
		print("Failed to start Symfony dump server")
	else
		print("Symfony dump server started with job ID:", job_id)
	end
end

function stop_symfony_dump_server()
	-- Check if the job ID is valid
	if job_id and job_id > 0 then
		-- Stop the Symfony dump server job
		vim.fn.jobstop(job_id)
		print("Stopped Symfony dump server with job ID:", job_id)
		-- Reset the job ID after stopping the server
		job_id = nil
	else
		print("No active Symfony dump server job found")
	end
	vim.api.nvim_buf_delete(buf, { force = true })
end

function clear_dump_log()
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
end

-- add a autocmd to stop the server when the neovim is closed
vim.api.nvim_command("autocmd VimLeavePre * lua stop_symfony_dump_server()")

-- Define the key mappings for the Symfony dump server
local wk = require("which-key")

wk.register({
	x = {
		name = "Symfony",
		s = { ":lua start_symfony_dump_server()<CR>", "[S]tart dump server" },
		c = { ":lua stop_symfony_dump_server()<CR>", "[C]lose dump server" },
		r = { ":lua clear_dump_log()<CR>", "[R]eset dump log" },
	},
}, { prefix = "<leader>" })
