set nocompatible             				 "We want the latest VIM settings 

so  ~/.vim/plugins.vim					"Source my plugins file, to keep this tidier. Add new plugins to it rather than here

set laststatus=2					"Enable AirLine
set backspace=indent,eol,start				"Make backspace behave like every other editor.
set number 


set timeoutlen=1000 ttimeoutlen=0			"Stop the delay between switching modes"	

syntax enable 
filetype plugin indent on


let mapleader = ','					"The default leader is \, but a comma is better.	

"-----------Visuals-------------"
colorscheme gruvbox
set background=dark
let g:airline_theme='base16'


"-----------Search-------------"
set hlsearch						"Highlight the searched for term
set incsearch						"Start searching for the term immediately



"-----------Mappings-------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>		

"Make NERDTree easier to toggle
nmap <C-n> :NERDTreeToggle<cr>

"Auto close brackets and quotes
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>0


"-----------Auto-Commands-------------"
"Automatically source the Vimrc file on save.
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


"-----------Split Management-------------"
set splitbelow						"New horizontal splits always go below the current window
set splitright						"New vertical splits always go to the right

