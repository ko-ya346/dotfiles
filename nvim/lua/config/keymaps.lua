vim.keymap.set("i", "jj", "<esc>")
-- ターミナルで Esc でノーマルモードに
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.opt.clipboard = "unnamedplus"
-- 行末から次の行に & 行頭から前の行に
vim.opt.whichwrap = "b,s,[,],<,>"
-- 挿入モードでバックスペースや Ctrl-h を使えるようにする
vim.opt.backspace = "indent,eol,start"
-- 行番号
vim.opt.number = true
-- タブを4文字分に
vim.opt.tabstop = 4
-- タブをスペース4文字分に
vim.opt.expandtab = true
-- インデントを増やすときも減らすときもスペース4文字分に
vim.opt.shiftwidth = 4
-- 自動インデント
vim.opt.autoindent = true
-- 文字の表示幅を指定. single は US-ASCII の文字と同じ幅を使用
vim.opt.ambiwidth = "single"
-- コマンドラインでtab を押したときに、ステータスラインにtab補完の候補を表示
vim.opt.wildmenu = true
-- 常にステータスラインを表示する
vim.opt.laststatus = 2
-- 入力中のコマンドを表示する
vim.opt.showcmd = true
-- 検索したときにハイライトを付ける(うざいので消す方法用意したい)
vim.opt.hlsearch = true
-- バッファを保存せずに切り替えられるようになる (バッファは要調査)
vim.opt.hidden = true
-- バックアップファイルを生成する
vim.opt.backup = true
-- バックアップファイルの生成先
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backup"
-- floating windows をちょっと透明にする
vim.opt.winblend = 20
-- ポップアップメニューを半透明にする
vim.opt.pumblend = 20
-- カラースキーム
vim.opt.termguicolors = true
-- 改行時にブロックに応じて自動でインデント数を調整して挿入
vim.opt.smartindent = true
-- 折り返しOFF
vim.opt.wrap = false
-- 数の増減を10進数で
vim.opt.nrformats = "bin,hex,alpha"
-- swap ファイルを生成させない (backup があるので大丈夫)
vim.opt.swapfile = false
-- 挿入するときに幅を無視する
vim.opt.formatoptions:remove('t')
-- 行をつなぐときスペース入れない
vim.opt.formatoptions:append('M')
-- 255 以上のマルチ文字でブレーク???
vim.opt.formatoptions:append('m')
-- マウスドラッグで visual mode になるのを無効化
vim.opt.mouse = ''

-- 新しいターミナルバッファが開かれたときに客家
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = '*', -- すべてのターミナルバッファに対して適用
  command = 'startinsert', -- インサートモードで開始
})
-- 入力モード解除時に全角/半角の状態を保存して、サイド入力モードに入るときに自動で変更してくれる
-- 嬉しみが分からん
vim.cmd [[
if executable('fcitx5')
  let g:fcitx_state = 1
  augroup fcitx_savestate
    autocmd!
    autocmd InsertLeave * let g:fcitx_state = str2nr(system('fcitx5-remote'))
    autocmd InsertLeave * call system('fcitx5-remote -c')
    autocmd InsertEnter * call system(g:fcitx_state == 1 ? 'fcitx5-remote -c': 'fcitx5-remote -o')
  augroup END
endif
]]
