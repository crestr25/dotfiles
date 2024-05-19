local M = {}

function M.mark_file()
	require("harpoon.mark").add_file()
	vim.notify("󱡅  marked file")
end

return M
