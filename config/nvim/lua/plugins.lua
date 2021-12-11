vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Sensible defaults
  use 'tpope/vim-sensible'

  -- Color schemes
  use 'navarasu/onedark.nvim'

  -- Look and feel
  use 'ryanoasis/vim-devicons'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- LSP
  use "neovim/nvim-lspconfig"
  use "nvim-lua/completion-nvim"
  use "folke/trouble.nvim"

  use {
    'ojroques/nvim-lspfuzzy',
    requires = {
      {'junegunn/fzf'},
      {'junegunn/fzf.vim'},  -- to enable preview (optional)
    },
  }

  -- Snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  -- Fuzzy finder
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Kitty integration
  use 'knubie/vim-kitty-navigator'

  -- Commands
  use 'folke/which-key.nvim'

  -- Syntax
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'lukas-reineke/indent-blankline.nvim'

	-- Direnv
	use 'direnv/direnv.vim'

	-- Git
	use 'lewis6991/gitsigns.nvim'

	-- File explorer
	use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'
  -- nvimLightbulb
  use 'kosayoda/nvim-lightbulb'
  -- Terraform
  use 'hashivim/vim-terraform'
  -- Delve
  use 'sebdah/vim-delve'
end)
