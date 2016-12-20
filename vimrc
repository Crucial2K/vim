set nocompatible             				 	"We want the latest VIM settings 

so  ~/.vim/plugins.vim						"Source my plugins file, to keep this tidier. Add new plugins to it rather than here

"-----------Where I got the settings from-------------
"https://nvie.com/posts/how-i-boosted-my-vim
"https://laracasts.com/series/vim-mastery



"-----------General Settings-------------
set laststatus=2						"Enable AirLine
set backspace=indent,eol,start					"Make backspace behave like every other editor.
set number 
set hidden							"Hides buffers instead of closing them. This means that you can have unwritten 
								"Changes to a file and open a new file using :e, without being forced to write or undo your changes first. Also, undo buffers and marks are preserved while the buffer is open.

set timeoutlen=1000 ttimeoutlen=0				"Stop the delay between switching modes"	
"set nowrap        						"Don't wrap lines
"set tabstop=4     						"A tab is four spaces
                    						"Allow backspacing over everything in insert mode
"set autoindent    						"Always set autoindenting on
"set copyindent    						"Copy the previous indentation on autoindenting
set shiftwidth=1  						"Number of spaces to use for autoindenting
"set shiftround    						"Use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     						"set show matching parenthesis
set ignorecase    						"Ignore case when searching
"set smartcase     						"Ignore case if search pattern is all lowercase, case-sensitive otherwise
"set smarttab      						"Insert tabs on the start of a line according to shiftwidth, not tabstop
set history=1000         					"Remember more commands and search history
set undolevels=1000      					"Use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                					"Change the terminal's title
set visualbell           					"Don't beep
set noerrorbells         					"Don't beep
"set nobackup							"Don't create a backup file
set noswapfile							"Disable the swapfile

syntax enable 

filetype on
filetype indent on
filetype plugin indent on


let mapleader = ','						"The default leader is \, but a comma is better.	

"-----------Visuals-------------"
colorscheme gruvbox
set background=dark
let g:airline_theme='base16'


"-----------Highlight whitespace-------------"
"Not currently working properly
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:




"-----------Search-------------"
set hlsearch							"Highlight the searched for term
set incsearch							"Start searching for the term immediately


"-----------Folding behaviour-------------"

set foldenable                  				"Enable folding
set foldcolumn=2                				"Add a fold column
set foldmethod=marker           				"Detect triple-{ style fold markers
set foldlevelstart=99           				"Start out with everything unfolded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo	
					" which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>



"-----------Mappings-------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Reload the vimrc file
nmap <silent> <leader>sv :so $MYVIMRC<cr> 

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>		

"Make NERDTree easier to toggle
nmap <C-n> :NERDTreeToggle<cr>

"Toggle paste on and off
set pastetoggle=<F2>

"Toggle line numbers on and off
set number
nnoremap <F3> :set nonumber!<CR>


"Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

"Use w!! to sudo close a file even though you should have used sudo to open it
cmap w!! w !sudo tee % >/dev/nul


"----------- ctrl-p option ------------"
" https://github.com/ctrlpvim/ctrlp.vim

"Invoke 
let g:ctrlp_map = '<c-p>'

"When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'


"-----------Editor behaviour------------"
"Auto close brackets and quotes
""ino ' ''<left>
""ino ( ()<left>
""ino [ []<left>
""ino { {}<left>
""ino {<CR> {<CR>}<ESC>0

"Jump to the next line in the editor on wrapped rows 
nnoremap j gj
nnoremap k gk



"-----------Auto-Commands-------------"
"Automatically source the Vimrc file on save.
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


"-----------Split Management-------------"
"set splitbelow						"New horizontal splits always go below the current window
set splitright						"New vertical splits always go to the right

"-----------Useful Commands-------------"
" Remove all instances of Word from file
":%s/Word//g
