local packer_boot = require("utils.packer_boot")

local packer_startup = {
	function(use)
		use({ "wbthomason/packer.nvim" })

		use({ "nvim-lua/plenary.nvim" }) -- nvim lua helpers

		use({ "dstein64/vim-startuptime" })

		use({
			"kylechui/nvim-surround", -- ys / ds / cs
			config = [[require("config/nvim-surround")]],
		})

		use({ -- automatic pairs
			"windwp/nvim-autopairs",
			config = [[require("config/autopairs")]],
		})

		use({ -- highlight pairs
			"andymass/vim-matchup",
			config = [[require("config/matchup")]],
		})

		use({ -- highlight current word
			"RRethy/vim-illuminate",
			config = [[require("config/illuminate")]],
		})

		use({ "preservim/vim-markdown" })

		use({
			"akinsho/toggleterm.nvim",
			tag = "v2.*",
			config = [[require("config/toggleterm")]],
		})

		use({
			"kevinhwang91/nvim-bqf",
			ft = "qf",
			config = [[require("config/nvim-bqf")]],
		})

		use({
			"kevinhwang91/nvim-hlslens",
			config = [[require("config/nvim-hlslens")]],
		})

		-- install without yarn or npm
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})

		use({ "rcarriga/nvim-notify", config = [[require("config/nvim-notify")]] })

		use({
			"nvim-neotest/neotest",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"nvim-neotest/neotest-vim-test",
				"vim-test/vim-test",
			},
			config = [[require("config/neotest")]],
		})

		use({
			"folke/todo-comments.nvim", -- flashy highlights for todo comments
			requires = "nvim-lua/plenary.nvim",
			config = [[require("config/todo-comments")]],
		})

		use({
			"karb94/neoscroll.nvim", -- smooth scrolling
			config = [[require("config/neoscroll")]],
		})

		use({
			"lukas-reineke/indent-blankline.nvim", -- vertical guideliens for code blocks
			ft = {
				"lua",
				"python",
				"c",
				"cpp",
				"rust",
				"qml",
				"sh",
				"zsh",
				"bash",
				"c",
				"cpp",
				"cmake",
				"html",
				"racket",
			},
			config = [[require("config/indent-blankline")]],
		})

		use({ "godlygeek/tabular" }) -- line up texts

		use({
			"norcalli/nvim-colorizer.lua", -- show color in terminal #B22222
			config = [[require("config/colorizer")]],
		})

		use({ -- strip trailing whitespaces
			"ntpeters/vim-better-whitespace",
			config = [[require("config/better-whitespace")]],
		})

		use({
			"chentoast/marks.nvim",
			config = [[require("config/marks")]],
		})

		use({
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = [[require("config/hop")]],
		})

		use({
			"max397574/better-escape.nvim",
			config = [[require("config/better-escape")]],
		})

		use({ -- greeting screen
			"glepnir/dashboard-nvim",
            event = "VimEnter",
			config = [[require("config/dashboard")]],
		})

		use({
			"kyazdani42/nvim-tree.lua", -- tree filesystem explorer
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			config = [[require("config/nvimtree")]],
		})

		use({
			"nvim-treesitter/nvim-treesitter",
            -- WARNING: This causes trouble when installing plugins for the first time
			-- run = ":TSUpdate",
			config = {
                [[require("config/treesitter")]],
        		-- [[require("config/treesitter-textobjects")]],
			    [[require("config/treesitter-context")]],
            },
            requires = {
                -- "nvim-treesitter/nvim-treesitter-textobjects",
                "nvim-treesitter/nvim-treesitter-context",
                "nvim-treesitter/playground"
            }
        })

		use({
			"neovim/nvim-lspconfig", -- good defaults for lsp
			requires = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
			},
			config = {
				[[require("config/lsp")]],
			},
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
		})

		use({
			"j-hui/fidget.nvim",
			config = [[require("config/fidget")]],
            tag = "legacy"
		})

        use ({
            'mfussenegger/nvim-dap-python',
            requires = {
                'mfussenegger/nvim-dap',
            },
            config = [[require("config/nvim-dap")]]
        })

		use({ "tjdevries/nlua.nvim" })

		use({
			"liuchengxu/vista.vim",
			config = [[require("config/vista")]],
		}) -- symbols visualizer WARNING: vista requires ctags

		use({
			"folke/tokyonight.nvim",
			config = [[require("config/tokyonight")]],
		}) -- color scheme

		use({ "folke/neodev.nvim" })

		-- completion
		use({
			"hrsh7th/nvim-cmp",
			config = [[require("config/cmp")]],
			requires = {
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "saadparwaiz1/cmp_luasnip" },
			},
		})

		use({
			"onsails/lspkind.nvim",
			config = [[require("config/lspkind")]],
		}) -- lsp pictograms

		-- snippets
		use({
			"L3MON4D3/LuaSnip",
			config = [[require("config/luasnip")]],
		})
		--
		-- tmux
		use({ "christoomey/vim-tmux-navigator" })

		-- fuzzy finder
		-- -------------

		-- fzf
		use({ "junegunn/fzf", dir = "~/.fzf", run = "./install --all" })
		use({ "junegunn/fzf.vim" })

		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				{ "nvim-telescope/telescope-file-browser.nvim" },
			},
			config = [[require("config/telescope")]],
		})

		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = [[require("config/lualine")]],
		}) -- nice UI/UX for status line

		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = [[require("config/bufferline")]],
		}) -- nice UI/UX for buffer line
		--
		use({ "kazhala/close-buffers.nvim", config = [[require("config/close-buffers")]] }) -- shortcuts to close buffer w.r.t different conditions

		use({ "numToStr/Comment.nvim", config = [[require("config/comment")]] }) -- comments

		-- git
		use({
			"TimUntersberger/neogit", -- magit for neovim
			requires = "nvim-lua/plenary.nvim",
			config = [[require("config/neogit")]],
		})

		use({
			"lewis6991/gitsigns.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
			config = [[require("config/gitsigns")]],
		}) -- git gutter

		use({ "rhysd/git-messenger.vim" }) -- current line git message displayer

		use({
			"ruifm/gitlinker.nvim", -- git code browser
			requires = "nvim-lua/plenary.nvim",
			config = [[require("config/gitlinker")]],
		})

		use("NoahTheDuke/vim-just") -- syntax highlight for justfiles

		use({
			"simrat39/rust-tools.nvim", -- enhanced tools for rust development
		})

		use({
		"nvim-neorg/neorg",
		after = {
			"nvim-treesitter",
		},
           -- WARNING: This causes trouble when installing plugins for the first time
		run = ":Neorg sync-parsers",
		config = [[require("config/neorg")]],
		requires = "nvim-lua/plenary.nvim",
		})
	end,
	config = { autoremove = true },
}

packer_boot.bootstrap(packer_startup)

-- FIXME: Make this a binding instead
-- local packer = vim.api.nvim_create_augroup("Packer", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = packer,
-- 	pattern = "plugins.lua",
-- 	command = "source <afile> | PackerSync",
-- })

local raw_notify = require("utils.raw_notify").notify

vim.keymap.set("n", "<leader><leader>r", function()
	local current_file = vim.fn.expand("%:p", "", "")
	if vim.bo.filetype == "vim" then
		vim.cmd([[:silent! write]])
		vim.cmd([[:source %]])
		raw_notify(" " .. current_file .. " reloaded !", "achieve")
	elseif vim.bo.filetype == "lua" then
		vim.cmd([[:silent! write]])
		vim.cmd([[:luafile %]])
		raw_notify(" " .. current_file .. " reloaded !", "achieve")
	else
		raw_notify("" .. current_file .. " could not be loaded !", "error")
	end
end)
