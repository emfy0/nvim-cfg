vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'catppuccin/nvim', as = 'catppuccin' }

  use({ -- autoclose and autorename tags
    "windwp/nvim-ts-autotag", requires = "nvim-treesitter/nvim-treesitter"
  })

  use 'numToStr/Comment.nvim'

  use 'lewis6991/gitsigns.nvim'

  use 'towolf/vim-helm'

  use 'tpope/vim-abolish'

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use {
    "ngscheurich/edeex.nvim",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require("edeex").setup({mapping = "<C-e>", autoformat = false})
    end
  }

  use 'slim-template/vim-slim'

  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}

  use 'michaeljsmith/vim-indent-object'

  use 'qpkorr/vim-bufkill'

  use 'christoomey/vim-tmux-navigator'

  use 'RRethy/nvim-treesitter-endwise'

  use 'folke/zen-mode.nvim'

  use 'norcalli/nvim-colorizer.lua'

  use({
    'ramojus/mellifluous.nvim',
    requires = { 'rktjmp/lush.nvim' },
    config = function()
      require'mellifluous'.setup({ --[[...]] }) -- optional, see configuration section.
    end,
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  use 'mg979/vim-visual-multi'

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  use({
    'Wansmer/treesj',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        ---@type boolean Use default keymaps (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = true,
        ---@type boolean Node with syntax error will not be formatted
        check_syntax_error = true,
        ---If line after join will be longer than max value,
        ---@type number If line after join will be longer than max value, node will not be formatted
        max_join_length = 120,
        ---Cursor behavior:
        ---hold - cursor follows the node/place on which it was called
        ---start - cursor jumps to the first symbol of the node being formatted
        ---end - cursor jumps to the last symbol of the node being formatted
        ---@type 'hold'|'start'|'end'
        cursor_behavior = 'hold',
        ---@type boolean Notify about possible problems or not
        notify = true,
        ---@type boolean Use `dot` for repeat action
        dot_repeat = true,
        ---@type nil|function Callback for treesj error handler. func (err_text, level, ...other_text)
        on_error = nil,
        ---@type table Presets for languages
        -- langs = {}, -- See the default presets in lua/treesj/langs
      })
    end,
  })

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use 'vim-crystal/vim-crystal'

  use({
    'apple/pkl-neovim',
    requires = "nvim-treesitter/nvim-treesitter",
    run = ":TSInstall! pkl"
  })
end)

