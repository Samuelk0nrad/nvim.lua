vim.keymap.set("n", "<leader>r", function()
  vim.cmd("terminal " .. "go run .")
end, { desc = "Run compiled C++ program" })
