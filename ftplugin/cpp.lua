vim.keymap.set("n", "<leader>cc", function()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:r") .. ".out"
  vim.cmd("!" .. "g++ -std=c++17 -Wall " .. file .. " -o " .. output .. " && echo 'Compiled to " .. output .. "'")
end, { desc = "Compile C++ file with g++" })

vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:r") .. ".out"
  vim.cmd("!" .. "g++ -std=c++17 -Wall " .. file .. " -o " .. output .. " && echo 'Compiled to " .. output .. "'")

  vim.cmd("terminal " .. output)
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
