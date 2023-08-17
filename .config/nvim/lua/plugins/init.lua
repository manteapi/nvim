local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- bootstrap lazy.nvim: https://github.com/folke/lazy.nvim
	-- stylua: ignore
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

plugins = {
	{ "nvim-lua/plenary.nvim", name = "plenary", lazy = true },

	{
		"nvim-treesitter/nvim-treesitter",
		name="treesitter"
	},
	{
		"nvim-neorg/neorg",
		ft="norg",
		dependencies={{"plenary", "treesitter"}},
		build= ":Neorg sync-parsers",
		cmd="Neorg",
		config=function() require("plugins.neorg") end,
	}
}

require("lazy").setup(plugins)
