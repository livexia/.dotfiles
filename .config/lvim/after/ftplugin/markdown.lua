local wk = require "which-key"

local mkdp_opts = {
  name = "MarkDown",

  p = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" },
  s = { "<cmd>MarkdownPreviewStop<cr>", "Markdown Preview Stop" },
  t = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle" },
}

wk.register({
  m = mkdp_opts,
}, { prefix = "<leader>" })

-- local keymap = vim.keymap.set
-- keymap("n", "<leader>mm", "", desc("Markdown"))
-- keymap("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", desc("Markdown Preview"))
-- keymap("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc("Markdown Preview Stop"))
-- keymap("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc("Markdown Preview Toogle"))
