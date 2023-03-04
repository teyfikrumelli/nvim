local keymap = vim.keymap -- for conciseness

keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
keymap.set("n", "<F1>", "<cmd>lua require'dap'.step_over()<CR>")
keymap.set("n", "<F2>", "<cmd>lua require'dap'.step_into()<CR>")
keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_out()<CR>")
keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>")
keymap.set("n", "<leader>dt", "<cmd>lua require'dap-go'.debug-test()<CR>")
keymap.set("n", "<leader>do", "<cmd>lua require'dapui'.open()<CR>")

require("nvim-dap-virtual-text").setup()
require("dap-go").setup()
require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
