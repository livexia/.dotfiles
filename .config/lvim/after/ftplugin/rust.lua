local bufnr = vim.api.nvim_get_current_buf()
local function desc(description)
  return { noremap = true, silent = true, buffer = bufnr, desc = description }
end

local wk = require("which-key")

wk.register({
  r = {
    name = "Rust",
    m = { "Macro" },
  },
}, { prefix = "<leader>", noremap = true, silent = true, buffer = bufnr })

vim.keymap.set("n", "K", function()
  vim.cmd.RustLsp { "hover", "actions" }
end, desc("Rust Hover Action"))

vim.keymap.set("n", "<leader>a", function()
  vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, desc("Rust Code Actions"))

vim.keymap.set("n", "<leader>rdd", function()
  vim.cmd.RustLsp("debuggables")
end, desc("[r]ust: [dd]ebuggables"))

vim.keymap.set("n", "<leader>rdl", function()
  vim.cmd.RustLsp { "debuggables", bang = true }
end, desc("[r]ust: run [d]ebuggables [l]ast"))

vim.keymap.set("n", "<leader>rr", function()
  vim.cmd.RustLsp("runnables")
end, desc("[r]ust: [r]unnables"))

vim.keymap.set("n", "<leader>rl", function()
  vim.cmd.RustLsp { "runnables", bang = true }
end, desc("[r]ust: [r]unnables [l]ast"))

vim.keymap.set("n", "<leader>rt", function()
  vim.cmd.RustLsp("testables")
end, desc("[r]ust: [t]estables"))

vim.keymap.set("n", "<leader>rtl", function()
  vim.cmd.RustLsp { "testables", bang = true }
end, desc("[r]ust: run [t]estables [l]ast"))

vim.keymap.set("n", "<leader>rme", function()
  vim.cmd.RustLsp("expandMacro")
end, desc("[r]ust: [m]acro [e]xpand"))

vim.keymap.set("n", "<leader>rk", function()
  vim.cmd.RustLsp { "moveItem", "up" }
end, desc("[r]ust: move item up [k]"))

vim.keymap.set("n", "<leader>rj", function()
  vim.cmd.RustLsp { "moveItem", "down" }
end, desc("[r]ust: move item down [j]"))

vim.keymap.set("v", "K", function()
  vim.cmd.RustLsp { "hover", "range" }
end, desc("rust: hover range"))

vim.keymap.set("n", "<leader>re", function()
  vim.cmd.RustLsp("explainError")
end, desc("[r]ust: [e]xplain error"))

vim.keymap.set("n", "<leader>rd", function()
  vim.cmd.RustLsp("renderDiagnostic")
end, desc("rust: [r]ender [d]iagnostic"))

-- vim.keymap.set('n', '<leader>gc', function()
--     vim.cmd.RustLsp('openCargo')
-- end, desc('rust: [g]o to [c]argo.toml'))

-- vim.keymap.set('n', '<leader>gp', function()
--     vim.cmd.RustLsp('parentModule')
-- end, desc('rust: [g]o to [p]arent module'))

vim.keymap.set("n", "J", function()
  vim.cmd.RustLsp("joinLines")
end, desc("rust: join lines"))

vim.keymap.set("n", "<leader>rs", function()
  vim.cmd.RustLsp("ssr")
end, desc("[r]ust: [s]sr"))
