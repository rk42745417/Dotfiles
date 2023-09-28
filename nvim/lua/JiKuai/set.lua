--basic configurations
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true

-- additional configurations
vim.opt.mouse = "n"
vim.opt.autochdir = true

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd('Filetype', {
	pattern = {'javascript'},
	command = 'set tabstop=2 | set softtabstop=2 | set shiftwidth=2'
})

-- Set true color
vim.opt.termguicolors = true

--encoding
vim.opt.fileencodings = "ucs-bom,utf-8,cp932,gb18030,gbk,gb2312,cp936"
vim.opt.encoding = "utf-8"
