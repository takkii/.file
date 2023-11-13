-- appearance

vim.cmd [[
try
  colorscheme iceberg
  syntax enable
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme iceberg
  set background=dark
  syntax enable
endtry
]]

local options = {
fileencodings = "utf-8,cp932",
splitbelow = true,
nobackup = true,
noundofile = true,
noswapfile = true,
number = true,
wildmenu = true,
wildmode = "list:full",
laststatus = 2
guifont = "Source\ Code\ Pro\ Semibold\:h9:sb"
backspace = "indent,eol,start"
lines = 45
columns = 124
encoding = "utf-8"
}

cd ~/
