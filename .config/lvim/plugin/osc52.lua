-- see: :h clipboard-osc52
local osc52 = safe_require("vim.ui.clipboard.osc52")

if not osc52 or not os.getenv("SSH_TTY") then
  return
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = osc52.paste("+"),
    ["*"] = osc52.paste("*"),
  },
}
