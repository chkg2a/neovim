local overrides = require "custom.configs.overrides"
local leet_arg = "leetcode.nvim"
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

---@type NvPluginSpec[]
local plugins = {
  {
    "ziontee113/color-picker.nvim",
    config = function()
      require "color-picker"
    end,
    lazy = false,
  },
  {
    "folke/twilight.nvim",
  },

  {
    "sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup {}
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/.local/share/obsidian_ChK",
        },
      },

      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      -- see below for full list of options 👇
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "dailies",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart({"open", url})  -- Mac OS
        vim.fn.jobstart { "xdg-open", url } -- linux
      end,
      wiki_link_func = function(opts)
        if opts.id == nil then
          return string.format("[[%s]]", opts.label)
        elseif opts.label ~= opts.id then
          return string.format("[[%s|%s]]", opts.id, opts.label)
        else
          return string.format("[[%s]]", opts.id)
        end
      end,
    },
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
      require("lspconfig").jdtls.setup {}
      -- require("lspconfig").jedi_language_server.setup({})
      require("lspconfig").denols.setup {}
      require("lspconfig").volar.setup {}
      require("lspconfig").tsserver.setup {}
      require("lspconfig").cssls.setup {}
      require("lspconfig").pyright.setup {}
      require("lspconfig").gopls.setup {}
      require("lspconfig").clangd.setup { capabilities = capabilities }
      require("lspconfig").ast_grep.setup {}
      require("lspconfig").eslint.setup {}
      require("lspconfig").rust_analyzer.setup {
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = false,
            },
          },
        },
      }
    end, -- Override to setup mason-lspconfig
    lazy = false,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        -- config
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = leet_arg ~= vim.fn.argv()[1],
    opts = {
      arg = leet_arg,
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
  },
  {
    "ThePrimeagen/harpoon",
  },

  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup {
        filetype = {
          go = {
            "cd $dir &&",
            "go run $fileName",
          },
          reactjs = {
            "cd $dir &&",
            "npm run dev",
          },
          kotlin = {
            "cd $dir &&",
            "kotlinc $fileName &&",
            "kotlin $fileNameWithoutExtKt",
          },
          cpp = {
            "cd $dir &&",
            "g++ $fileName -o out.$fileNameWithoutExt -std=c++20 &&",
            "./out.$fileNameWithoutExt &&",
            "rm ./out.$fileNameWithoutExt",
          },
          java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt",
          },
          python = "python3 -u",
          typescript = "deno run",
          rust = {
            "cd $dir &&",
            "cargo build &&",
            "cargo run",
          },
          js = {
            "cd $dir &&",
            "npm run dev",
          },
          cs = {
            "cd $dir &&",
            "mcs -out:$fileNameWithoutExt $fileName &&",
            "$dir/$fileNameWithoutExt",
          },
        },
      }
    end,
    lazy = false,
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  {
    "derektata/lorem.nvim",
    config = function()
      require("lorem").setup {
        sentenceLength = "mixedShort",
        comma = 0.1,
      }
    end,
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "markdown",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "c_sharp",
        "sql",
        "yaml",
        "xml",
        "tsx",
      },
      autotag = {
        enable = true,
      },
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = { "markdown", "markdown_inline" },
          highlight = {
            enable = true,
          },
        }
      end,
    },
    lazy = false,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = { "typescriptreact", "tsx" },
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup {
        auto_update = true,
        neovim_image_text = "The One True Text Editor",
        main_image = "file",
        client_id = "793271441293967371",
        log_level = nil,
        debounce_timeout = 4,
        enable_line_number = false,
        blacklist = {},
        buttons = false,
        file_assets = {},
        show_time = true,

        -- Rich Presence text options
        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
      }
    end,
    lazy = false,
  },

  {
    "ray-x/web-tools.nvim",
    config = function()
      require("web-tools").setup {
        keymaps = {
          rename = nil,         -- by default use same setup of lspconfig
          repeat_rename = ".",  -- . to repeat
        },
        hurl = {                -- hurl default
          show_headers = false, -- do not show http headers
          floating = false,     -- use floating windows (need guihua.lua)
          json5 = false,        -- use json5 parser require json5 treesitter
          formatters = {        -- format the result by filetype
            json = { "jq" },
            html = { "prettier", "--parser", "html" },
          },
        },
      }
    end,
    lazy = false,
  },

  {
    "nullchilly/fsread.nvim",
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    lazy = false,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    enabled = false,
  },
}

return plugins
