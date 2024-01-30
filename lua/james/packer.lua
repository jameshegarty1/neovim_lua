-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function()
      vim.cmd('colorscheme tokyonight')
    end

  })


  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  use ("nvim-lua/plenary.nvim")
  use ("ThePrimeagen/harpoon")
  use ("mbbill/undotree")
  use ("tpope/vim-fugitive")

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
  use 'mfussenegger/nvim-dap'
  use ({
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    }
  })
  use ('dart-lang/dart-vim-plugin')

  -- For REST framework testing
  use {
      "rest-nvim/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
          require("rest-nvim").setup({
              -- Open request results in a horizontal split
              result_split_horizontal = false,
              -- Keep the http file buffer above|left when split horizontal|vertical
              result_split_in_place = false,
              -- stay in current windows (.http file) or change to results window (default)
              stay_in_current_window_after_split = false,
              -- Skip SSL verification, useful for unknown certificates
              skip_ssl_verification = false,
              -- Encode URL before making request
              encode_url = true,
              -- Highlight request on run
              highlight = {
                  enabled = true,
                  timeout = 150,
              },
              result = {
                  -- toggle showing URL, HTTP info, headers at top the of result window
                  show_url = true,
                  -- show the generated curl command in case you want to launch
                  -- the same request via the terminal (can be verbose)
                  show_curl_command = false,
                  show_http_info = true,
                  show_headers = true,
                  -- table of curl `--write-out` variables or false if disabled
                  -- for more granular control see Statistics Spec
                  show_statistics = false,
                  -- executables or functions for formatting response body [optional]
                  -- set them to false if you want to disable them
                  formatters = {
                      json = "jq",
                      html = function(body)
                          return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
                      end
                  },
              },
              -- Jump to request line on run
              jump_to_request = false,
              env_file = '.env',
              custom_dynamic_variables = {},
              yank_dry_run = true,
              search_back = true,
          })
      end
  }


end)
