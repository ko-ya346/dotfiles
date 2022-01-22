" tabでスペースを挿入 
set expandtab 
" tabで挿入される文字幅 
set softtabstop=4
" インデント幅 
set shiftwidth=4 
" yコピーがクリップボードに入る 
set guioptions+=a 
" 対応するかっこを強調表示 
set showmatch 
" 行末のスペースを可視化 
set listchars=tab:^\ ,trail:~ 
" 対応するかっこ、ブレースを表示 
set showmatch matchtime=1 
" 大文字小文字を区別せず検索 
set ignorecase 
" 検索コマンドで、打ち込んだところまでのパターンのテキストを表示 
set incsearch 
" 大文字を含む検索をしたらignorecaseを上書き 
set smartcase 

" 下にステータスバーを常に表示
set laststatus=2 
" 改行時にインデントを引き継ぐ
set autoindent 
"　挿入モードからノーマルモードに移行
inoremap <silent> jj <ESC>

" カラースキーム
colorscheme ron
" yankをクリップボードに貼り付け（wsl内はちょっと変わってる）
set clipboard& 
set clipboard=unnamedplus 

augroup Yank 
  au! 
  autocmd TextYankPost * :call system('clip.exe', @") 
