local M = {}

function M.quickfix_exists()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
    return qf_exists
end

function M.current_word()
  return vim.fn.expand("<cword>")
end

function M.current_selection()
    local register = vim.fn.getreg("\"")
    vim.api.nvim_exec("normal! y", false)
    local filter = vim.fn.trim(vim.fn.getreg("@"))
    vim.fn.setreg("\"", register)
    return filter
end

return M
