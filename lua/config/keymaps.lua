-- keymaps are automatically loaded on the verylazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- Optional: remove LazyVim's default mappings (some terminals treat <C-/> and <C-_> the same)
vim.keymap.del({ "n", "t" }, "<C-/>")
pcall(vim.keymap.del, { "n", "t" }, "<C-_>")

-- Now define your own toggle
vim.keymap.set({ "n", "t" }, "<C-/>", function()
  -- Global, single terminal toggle
  Snacks.terminal.toggle()
end, { desc = "Toggle global terminal" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
