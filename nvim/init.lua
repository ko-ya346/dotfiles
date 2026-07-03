-- vim.cmd.colorscheme("tokyonight")

-- lua ファイルのコメント文字色を調整
vim.api.nvim_set_hl(0, "Comment", {
    fg = "#8b949e", -- 明るめグレー
    italic = true,
})

-- netrm を無効化（起動時の変な挙動をなくす）
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- leader を Space に割り当てる
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.options")
require("config.keymaps")


-- Windows: use PowerShell as default shell
if vim.fn.has("win32") == 1 then
    vim.opt.shell = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end
--
-- ←この下に置く
vim.schedule(function()
  vim.api.nvim_set_hl(0, "Comment", {
    fg = "#a9b1d6",  -- 明るめ
    italic = true,
  })

  vim.api.nvim_set_hl(0, "@comment", {
    fg = "#a9b1d6",  -- 明るめ
    italic = true,
  })
end)
vim.schedule(function()
  -- 行番号
  vim.api.nvim_set_hl(0, "LineNr", {
    fg = "#7aa2f7",
  })

  -- 現在行の番号
  vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = "#ff9e64",
    bold = true,
  })

  -- 左の空白列（LSPアイコンとか出る所）
  vim.api.nvim_set_hl(0, "SignColumn", {
    bg = "NONE",
  })

  -- fold列
  vim.api.nvim_set_hl(0, "FoldColumn", {
    fg = "#565f89",
  })
end)
