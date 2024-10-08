-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.g.vim_markdown_frontmatter = 1
vim.opt.conceallevel = 2
vim.opt.relativenumber = true
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
local enable_providers = {
	"python3_provider",
}
for _, plugin in pairs(enable_providers) do
	vim.g["loaded_" .. plugin] = nil
	vim.cmd("runtime " .. plugin)
end

vim.g.python3_host_prog = "/home/xrenne/.pyenv/shims/python3.10"
