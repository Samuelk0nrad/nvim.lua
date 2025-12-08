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

-- **** C++ **** --
vim.keymap.set("n", "<leader>cc", function()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:r") .. ".out"
  vim.cmd("!" .. "g++ -std=c++17 -Wall " .. file .. " -o " .. output .. " && echo 'Compiled to " .. output .. "'")
end, { desc = "Compile C++ file with g++" })

vim.keymap.set("n", "<leader>cr", function()
  local output = vim.fn.expand("%:r") .. ".out"
  vim.cmd("!" .. output)
end, { desc = "Run compiled C++ program" })

vim.keymap.set("n", "<leader>cd", function()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:r") + ".out"
  vim.cmd(
    "!"
      .. "g++ -std=c++17 -g -Wall "
      .. file
      .. " -o "
      .. output
      .. " && echo 'Compiled with debug symbols to "
      .. output
      .. "'"
  )
end, { desc = "Compile C++ file with debug symbols" })

vim.keymap.set("n", "<leader>dd", function()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:r") .. ".out"
  vim.cmd(
    "!"
      .. "g++ -std=c++17 -g -Wall "
      .. file
      .. " -o "
      .. output
      .. " && echo 'Compiled with debug symbols to "
      .. output
      .. "'"
  )

  if vim.v.shell_error == 0 then
    local dap = require("dap")
    dap.run({
      type = "codelldb",
      request = "launch",
      name = "Build & Debug current file",
      program = output,
      cwd = vim.fn.getcwd(),
      stopOnEntry = false,
    })
  else
    vim.notify("Build faild", vim.log.levels.ERROR)
  end
end, { desc = "Compile C++ file with debug symbols" })
