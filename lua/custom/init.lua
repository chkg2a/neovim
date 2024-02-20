-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.g.vim_markdown_frontmatter = 1
vim.opt_local.conceallevel = 2
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/luasnip.lua"
vim.lsp.set_log_level("debug")
local enable_providers = {
	"python3_provider",
}
for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end

vim.g.python3_host_prog = "/home/xrenne/.pyenv/shims/python3.10"
