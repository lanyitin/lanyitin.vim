local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local function load_plugins()
	local use = require('packer').use
	require('packer').startup(function ()
		use 'wbthomason/packer.nvim' -- Package manager

		use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client

		use 'ray-x/lsp_signature.nvim'

		use 'nvim-treesitter/nvim-treesitter' -- General Parser
		use 'nvim-treesitter/nvim-treesitter-textobjects'
		use 'nvim-treesitter/nvim-treesitter-refactor'

		use 'folke/which-key.nvim'

		use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

		use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }

		use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

		use { 'TimUntersberger/neogit', requires = { { 'nvim-lua/plenary.nvim' }, { 'sindrets/diffview.nvim' } }  }

		use 'kyazdani42/nvim-tree.lua' -- File explorer

		use 'hoob3rt/lualine.nvim'

		use 'kyazdani42/nvim-web-devicons'

		use 'projekt0n/github-nvim-theme' -- Theme
	end)
end

_G.load_config = function()
	require('gitsigns').setup()
	require('which-key').setup()
	-- nvim-tree
	require('nvim-tree').setup()
	-- Treesitter
	require('nvim-treesitter.configs').setup {
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { 'BufWrite', 'CursorHold' },
		},
		ensure_installed = 'all',
		highlight = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = 'gnn',
				node_incremental = 'grn',
				scope_incremental = 'grc',
				node_decremental = 'grm',
			},
		},
		indent = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					[']m'] = '@function.outer',
					[']]'] = '@class.outer',
				},
				goto_next_end = {
					[']M'] = '@function.outer',
					[']['] = '@class.outer',
				},
				goto_previous_start = {
					['[m'] = '@function.outer',
					['[['] = '@class.outer',
				},
				goto_previous_end = {
					['[M'] = '@function.outer',
					['[]'] = '@class.outer',
				},
			},
		},
	}
	-- neogit
	require('neogit').setup {
		integrations = {
			diffview = true,
		},
	}

	-- Set highlight on search
	vim.o.hlsearch = true
	vim.o.incsearch = true

	-- Do not save when switching buffers
	vim.o.hidden = true

	-- Enable mouse mode
	vim.o.mouse = 'a'

	-- clipboard
	vim.o.clipboard = 'unnamedplus'

	-- Enable break indent
	vim.o.breakindent = true

	-- Save undo history
	vim.cmd [[set undofile]]

	-- Case insensitive searching UNLESS /C or capital in search
	vim.o.ignorecase = true
	vim.o.smartcase = true

	-- Decrease update time
	vim.o.updatetime = 250
	vim.wo.signcolumn = 'yes'
	-- Remap space as leader key
	vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
	vim.g.mapleader = ' '
	vim.g.maplocalleader = ' '

	-- Telescope
	require('telescope').setup {
		defaults = {
			mappings = {
				i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
				},
			},
			file_ignore_patterns = { "node_modules", "target"},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case"
				}
			}
		},
	}
	require('telescope').load_extension('fzf')
	--Add leader shortcuts
	vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua require('telescope.builtin').tags()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true })
	-- vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>gco', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>si', [[<cmd>lua require('telescope').extensions.scaladex.scaladex.search()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>m', [[<cmd>lua require('nvim-tree').toggle()<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>ng', [[<cmd>lua require('neogit').open({ kind = "split" })<cr>]], { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>nu', ':PackerUpdate<CR>', { noremap = true, silent = true })

	-- Change preview window location
	vim.g.splitbelow = true


	-- LSP settings
	local nvim_lsp = require 'lspconfig'
	local on_attach = function(_client, bufnr)
		require('lsp_signature').on_attach()

		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

		local opts = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gm', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	end

	-- Enable the following language servers
	local servers = { 'rnix' }
	for _, lsp in ipairs(servers) do
		nvim_lsp[lsp].setup { on_attach = on_attach }
	end

	require('lualine').setup {
		options = {
			theme = 'github_dark'
		}
	}

	require('nvim-web-devicons').setup()

	-- Enable theme
	-- require('github-theme').setup()
end


if fn.isdirectory(install_path) == 0 then
	fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
	load_plugins()
	require('packer').sync()
else
	load_plugins()
	_G.load_config()
end
