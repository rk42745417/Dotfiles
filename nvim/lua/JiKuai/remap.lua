vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- keymaps
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")
vim.keymap.set("i", "{{", "{")
vim.keymap.set("i", "{}", "{}")

-- Magic move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+Y]])
-- Paste
vim.keymap.set("n", "<leader>pp", [["+p]])


-- Cpp keymaps
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'cpp',
	command = 'nnoremap <F8> :w <bar> !g++ -std=gnu++17 % -o %:r -O2<CR>'
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'cpp',
	command = 'nnoremap <F9> :w <bar> !g++ -std=gnu++17 % -o %:r -Wall -Wextra -Wconversion -Wshadow -Wfatal-errors -fsanitize=undefined -fsanitize=address -g -DEMT<CR>'
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'cpp',
	command = 'nnoremap <F10> :term ./%:r<CR>'
})

-- C keymaps
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'c',
	command = 'nnoremap <F8> :w <bar> !gcc -std=c99 % -o %:r -O2<CR>'
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'c',
	command = 'nnoremap <F9> :w <bar> !gcc -std=c11 % -o %:r -Wall -Wextra -Wconversion -Wshadow -Wfatal-errors -fsanitize=undefined -fsanitize=address -g -DEMT<CR>'
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'c',
	command = 'nnoremap <F10> :term ./%:r<CR>'
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'c',
	command = 'nnoremap <C-C> :s/^\\(\\s*\\)/\\1\\/\\/<CR> :s/^\\(\\s*\\)\\/\\/\\/\\//\\1<CR> $'
})

-- latex keymaps
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'tex',
	command = 'nnoremap <F9> :w <bar> !latexmk -xelatex -shell-escape %<CR>'
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'tex',
	command = 'nnoremap <F10> :!zathura %:r.pdf<CR>'
})

-- python keymaps
vim.api.nvim_create_autocmd("Filetype", {
	pattern = 'py',
	command = 'nnoremap <F9> :w <bar> !python3 %<CR>'
})

