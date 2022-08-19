-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.mappings = {
  hop = {
    i = {
      ["<A-f>"] = {"<cmd> HopWord <CR>", "hop to word"},
      ["<A-c>"] = {"<cmd> HopChar1 <CR>", "hop to char1"},
      ["<A-C>"] = {"<cmd> HopChar2 <CR>", "hop to char2"},
      ["<A-l>"] = {"<cmd> HopLine <CR>", "hop to line"},
    },
    n = {
      -- Switch buffers
      ["H"] = {"<cmd> bp <CR>", "Go to previous buffer"},
      ["L"] = {"<cmd> bp <CR>", "Go to next buffer"},

      -- NvimTree
      ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "Toggle file explorer"},
      ["<leader>E"] = {"<cmd> lua require('nvim-tree').toggle(false, true) <CR>", "Togle file explorer without focusing"},

      -- Hop
      ["<A-f>"] = {"<cmd> HopWord <CR>", "hop to word"},
      ["<A-c>"] = {"<cmd> HopChar1 <CR>", "hop to char1"},
      ["<A-C>"] = {"<cmd> HopChar2 <CR>", "hop to char2"},
      ["<A-l>"] = {"<cmd> HopLine <CR>", "hop to line"},

      -- LSP
      ["gd"] = {"<cmd> lua vim.lsp.buf.definition() <CR>", "Go to definition"},
      ["gD"] = {"<cmd> lua vim.lsp.buf.declaration() <CR>", "Go to declaration"},
      ["K"] = {"<cmd> lua vim.lsp.buf.hover() <CR>", "Hover"},
      ["gR"] = {"<cmd> lua vim.lsp.buf.rename() <CR>", "Rename symbol"},
      ["gr"] = {"<cmd>   lua vim.lsp.buf.references() <CR>", "References"},
      ["gs"] = {"<cmd> lua vim.lsp.buf.signature_help() <CR>", "Signature help"},
      ["gi"] = {"<cmd> lua vim.lsp.buf.implementation() <CR>", "Go to implementation"},
      ["gT"] = {"<cmd> lua vim.lsp.buf.type_definition() <CR>", "Go to type definition"},
      ["<leader>ls"] = {"<cmd> lua vim.lsp.buf.document_symbol() <CR>", "List document symbols"},
      ["<leader>lw"] = {"<cmd> lua vim.lsp.buf.workspace_symbol() <CR>", "List workspace symbols"},
      ["<leader>lc"] = {"<cmd> lua vim.lsp.buf.code_action() <CR>", "Code actions"},
      ["<leader>ll"] = {"<cmd> lua vim.lsp.buf.show_line_diagnostics() <CR>", "Show line diagnostics"},
      ["<leader>lr"] = {"<cmd> lua vim.lsp.buf.rename() <CR>", "Rename symbol"},
      ["<leader>l="] = {"<cmd> lua vim.lsp.buf.formatting() <CR>", "Formatting"},
      ["<leader>li"] = {"<cmd> lua vim.lsp.buf.incoming_calls() <CR>", "List incoming calls"},
      ["<leader>lo"] = {"<cmd> lua vim.lsp.buf.outgoing_calls() <CR>", "List outgoing calls"},
    }
  }
}

M.ui = {
  theme = "ayu-dark",
}

M.plugins = {
  user = {
    ["neovim/nvim-lspconfig"] = {
      config = function()
         require "plugins.configs.lspconfig"
         require "custom.plugins.configs.lspconfig"
      end,
    },
    ["mfussenegger/nvim-dap"] = {},
    ["rcarriga/nvim-dap-ui"] = {},
    ["goolord/alpha-nvim"] = {
      disable = false,
    },
    ["folke/which-key.nvim"] = {
      disable = false,
    },
    ["phaazon/hop.nvim"] = {
      setup = function()
        require("core.lazy_load").on_file_open "hop.nvim"
      end,
      config = function()
        require("hop").setup()
      end,
    },
    ["max397574/better-escape.nvim"] = {
      config = function()
        require("better_escape").setup()
      end,
    },
    ["turbio/bracey.vim"] = {
      run = "npm install --prefix server"
    }
  },
  override = {
    ["williamboman/mason.nvim"] = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "emmet-ls",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
      },
    },

    ["NvChad/ui"] = {
      statusline = {
         separator_style = "block",
      }
    },
  },
}

return M
