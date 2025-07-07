local lspconfig = require("lspconfig")

local get_root_dir = function(bufnr, on_dir)
    local root_files = {
        "ruff.toml",
        "pyproject.toml"
    }
    local fallback_root_files = {
        ".git",
    }
    local filename= vim.api.nvim_buf_get_name(bufnr)
    local primary = lspconfig.util.root_pattern(unpack(root_files))(filename)
    local fallback = lspconfig.util.root_pattern(unpack(fallback_root_files))(filename)

    if primary then
	    on_dir(vim.fn.fnamemodify(primary, ":h"))
    elseif fallback then
	    on_dir(vim.fn.fnamemodify(fallback, ":h"))
    else
        print("ruff.lua ERROR")
    end
end


local config_path = function()
	local root_path = vim.fs.find("ruff.toml", {
	    upward = true,
	    type = "file",
	    path = vim.fn.getcwd(),
	})[1]

    print("============================")
    print("============================")
    print("============================")
    print(root_path)

    return root_path
end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function()
    local clients = vim.lsp.get_active_clients({ name = "ruff_lsp" })
    if #clients == 0 then
      vim.cmd("LspStart ruff_lsp")
    end
  end,
})

local get_cmd_cwd = function()
  local path = util.root_pattern("pyproject.toml", ".git")(vim.fn.expand("%:p")), -- ensure ruff-lsp runs from the right dir
  print("oooooooooooooooooooooooooooooo")
  print("oooooooooooooooooooooooooooooo")
  print("oooooooooooooooooooooooooooooo")
  print("oooooooooooooooooooooooooooooo")
  print("oooooooooooooooooooooooooooooo")
  print("oooooooooooooooooooooooooooooo")
  print(path)
  return path
end

return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    settings = {},
    root_dir = get_root_dir,
    -- get_cmd_cwd,
    -- init_options = {
        -- settings = {
            -- configuration = config_path(),
            -- "/home/pmanteaux/repositories/lucy-deployment/circlecad/ruff.toml",
            -- configurationPreference = "editorOnly"
        -- },
    -- },
}
