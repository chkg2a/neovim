---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><leader>v"] = {"<cmd>vsplit<cr>", "Virtical Split"},
    ["<leader><leader>s"] = {"<cmd>split<cr>", "Horizontal Split"},
    ["<A-h>"] = {"<C-w>h","window left panel"},
    ["<A-l>"] = {"<C-w>l","window right panel"},
    ["<A-j>"] = {"<cmd>2winc > <cr>","incrase window left panel"},
    ["<A-k>"] = {"<cmd>2winc < <cr>","incrase window right panel"},
    ["<C-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<C-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<C-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
	},
	v = {
		[">"] = { ">gv", "indent" },
	},
  t = {
    ["<C-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<C-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<C-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  }
}


M.colorpicker = {
  n = {
    ["<C-c>"] = {"<cmd>PickColor<CR>"}
  };
  i = {
    ["<C-c>"] = {"<cmd>PickColorInsert<CR>"}
  }
}

M.runcode = {
	n = {
		["<leader>r"] = { "<cmd> RunCode <CR>" },
	},
}

M.leetcode = {
  n = {
    ["<A-g>"] = {"<cmd> Leet Run <CR>"},
    ["<A-f>"] = {"<cmd> Leet Submit <CR>"},
    ["<A-d>"] = {"<cmd> Leet desc <CR>"},
  }
}

M.lazygit = {
	n = {
		["<leader>g"] = { "<cmd> LazyGit <CR>" },
	},
}

M.markdownp = {
  n = {
    ["<leader>m"] = { "<cmd> MarkdownPreviewToggle <CR>"}
  }
}

M.harpoon = {
	n = {
		["<A-r>"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>" },
		["<A-t>"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
		["1"] = { "<cmd>lua require('harpoon.ui').nav_next()  <CR>" },
		["2"] = { "<cmd>lua require('harpoon.ui').nav_prev()  <CR>" },
	},
}

M.zen = {
  n = {
    ["<leader>z"] = {"<cmd> ZenMode <CR>"}
  }
}

M.fsread = {
	n = {
		["<leader>f"] = { "<cmd> FSToggle <CR>" },
	},
}

M.undotree = {
	n = {
		["<A-u>"] = { "<cmd> UndotreeToggle <CR>" },
	},
}

M.webtools = {
  n = {
    ["<leader>o"] = {"<cmd> BrowserPreview <CR>"},
  },
  v = {
    ["<leader>r"] = {"<cmd> HurlRun <CR>"},
  }
}

M.url = {
  n = {
    ["gx"] = {"<cmd>URLOpenUnderCursor <CR>"}
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
    ["<leader>t"] = { "<cmd> ObsidianTemplate <CR>" },
  },
  v = {
    ["<A-l>"] = { "<cmd> ObsidianLinkNew <CR>" },
  }
}
-- more keybinds!

return M
