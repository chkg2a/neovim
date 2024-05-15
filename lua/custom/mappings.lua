---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><leader>v"] = { "<cmd>vsplit<cr>", "Virtical Split" },
    ["<leader><leader>s"] = { "<cmd>split<cr>", "Horizontal Split" },
    ["<C-h>"] = { "<C-w>h", "window left panel" },
    ["<C-l>"] = { "<C-w>l", "window right panel" },
    ["<A-h>"] = { "<C-w>h", "window left panel" },
    ["<A-l>"] = { "<C-w>l", "window right panel" },
    ["<A-j>"] = { "<C-w>j", "window left panel" },
    ["<A-k>"] = { "<C-w>k", "window right panel" },
    ["<A-S-h>"] = { "<cmd>2winc > <cr>", "incrase window left panel" },
    ["<A-S-l>"] = { "<cmd>2winc < <cr>", "incrase window right panel" },
    ["<C-5>"]= { "<cmd>vimgrep /\\w\\+/j % | copen<cr>","quick fix"},
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },
    ["<C-8>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<C-9>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    ["<C-0>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<leader>s"] = { "<cmd>'<,'>sort<cr>", "Sort" },
  },
  t = {
    ["<C-h>"] = { "<C-w>h", "window left panel" },
    ["<C-l>"] = { "<C-w>l", "window right panel" },
    ["<A-h>"] = { "<C-w>h", "window left panel" },
    ["<A-l>"] = { "<C-w>l", "window right panel" },
    ["<A-j>"] = { "<C-w>j", "window left panel" },
    ["<A-k>"] = { "<C-w>k", "window right panel" },
    ["<A-S-h>"] = { "<cmd>2winc > <cr>", "incrase window left panel" },
    ["<A-S-l>"] = { "<cmd>2winc < <cr>", "incrase window right panel" },
    ["<C-8>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<C-9>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
    ["<C-0>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.colorpicker = {
  n = {
    ["<C-4>"] = { "<cmd>PickColor<CR>" },
  },
  i = {
    ["<C-4>"] = { "<cmd>PickColorInsert<CR>" },
  },
}

M.runcode = {
  n = {
    ["<leader>r"] = { "<cmd> RunCode <CR>" },
  },
}

M.leetcode = {
  n = {
    ["<A-g>"] = { "<cmd> Leet Run <CR>" },
    ["<A-f>"] = { "<cmd> Leet Submit <CR>" },
    ["<A-d>"] = { "<cmd> Leet desc <CR>" },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd> LazyGit <CR>" },
  },
}

M.markdownp = {
  n = {
    ["<leader>m"] = { "<cmd> MarkdownPreviewToggle <CR>" },
  },
}

M.harpoon = {
  n = {
    ["<A-r>"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>" },
    ["<A-t>"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
    ["1"] = { "<cmd>lua require('harpoon.ui').nav_next()  <CR>" },
    ["2"] = { "<cmd>lua require('harpoon.ui').nav_next()  <CR>" },
    ["<A-S-j>"] = { "<cmd>lua require('harpoon.ui').nav_next()  <CR>" },
    ["<A-S-k"] = { "<cmd>lua require('harpoon.ui').nav_prev()  <CR>" },
  },
}

M.zen = {
  n = {
    ["<leader>z"] = { "<cmd> ZenMode <CR>" },
  },
}

M.fsread = {
  n = {
    ["<C-3>"] = { "<cmd> FSToggle <CR>" },
  },
}

M.undotree = {
  n = {
    ["<A-u>"] = { "<cmd> UndotreeToggle <CR>" },
  },
}

M.webtools = {
  n = {
    ["<leader>o"] = { "<cmd> BrowserPreview <CR>" },
  },
  v = {
    ["<leader>r"] = { "<cmd> HurlRun <CR>" },
  },
}

M.url = {
  n = {
    ["gx"] = { "<cmd>URLOpenUnderCursor <CR>" },
  },
}

M.transparent = {
  n = {
    ["<leader>ts"] = { "<cmd>TransparentToggle <CR>" },
  }
}

M.obsidian = {
  n = {
    ["<A-s>"] = { "<cmd> ObsidianSearch <CR>" },
    ["<A-i>"] = { "<cmd> ObsidianToday <CR>" },
    ["<A-o>"] = { "<cmd> ObsidianOpen <CR>" },
    ["<A-p>"] = { "<cmd> ObsidianPasteImg <CR>" },
    ["<A-b>"] = { "<cmd> ObsidianBacklinks <CR>" },
    ["<A-n>"] = { "<cmd> ObsidianNew <CR>" },
  },
  v = {
    ["<A-l>"] = { "<cmd> ObsidianLinkNew <CR>" },
  },
}
-- more keybinds!

return M
