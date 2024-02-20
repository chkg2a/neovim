---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
	},
	v = {
		[">"] = { ">gv", "indent" },
	},
}

M.runcode = {
	n = {
		["<leader>r"] = { "<cmd> RunCode <CR>" },
	},
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
		["<A-j>"] = { "<cmd>lua require('harpoon.ui').nav_next()  <CR>" },
		["<A-k>"] = { "<cmd>lua require('harpoon.ui').nav_prev()  <CR>" },
	},
}

M.zen = {
  n = {
    ["<leader>z"] = {"<cmd> ZenMode <CR>"}
  }
}

M.fsread = {
	n = {
		["<leader>o"] = { "<cmd> FSToggle <CR>" },
	},
}

M.undotree = {
	n = {
		["<A-u>"] = { "<cmd> UndotreeToggle <CR>" },
	},
}

M.webtools = {
  n = {
    ["<A-o>"] = {"<cmd> BrowserPreview <CR>"},
  },
  v = {
    ["<leader>r"] = {"<cmd> HurlRun <CR>"},
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
