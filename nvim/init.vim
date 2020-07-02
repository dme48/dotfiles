set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=/home/diego/.config/nvim/bundle/Vundle.vim

call vundle#begin('/home/diego/.config/nvim/bundle/Vundle.vim')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'neomake/neomake'
Plugin 'lervag/vimtex'
call vundle#end()


"Cosas básicas
"set ttymouse=xterm2
set clipboard+=unnamedplus
syntax on
set number
set clipboard=unnamed "Utilizar el clipboard del sistema
" Splits open at the bottom and right
set splitbelow splitright
set tabstop=4 "Un tab son 4 espacios
set softtabstop=4    "También al editar	
set expandtab "tab son literalmente espacios
set shiftwidth=4
colorscheme Atelier_SulphurpoolDark

filetype indent on "aprende a indentar en función de la extensión

set wildmenu "visual autocomplete

set showmatch  "hightlight matching [{()}]

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"si se escribe jk/JK en el modo insert se escapará al modo normal 
inoremap jk <Esc>
inoremap JK <Esc>
",h desabilita el Highlighting
nnoremap ,h :nohl<CR>

"""""""
"LATEX"
"""""""
"Shortcut para goyo
autocmd BufEnter *.tex nnoremap ,g :Goyo 100<CR>

"Atajo para escribir \ref{}, colocandose dentro de los corchetes
autocmd BufEnter *.tex inoremap ,r \ref{}<esc>i

"Atajo para escribir \ref{}, colocandose dentro de los corchetes
autocmd BufEnter *.tex inoremap ,tt \texttt{}<esc>i

"Compila los tex con F5.
autocmd BufEnter *.tex inoremap <F5> <esc>:w<CR> :!clear<CR> :!pdflatex %<CR>

"doble espacio para ir y sustituir el siguiente ·
autocmd BufEnter *.tex nnoremap <Space><Space> <esc>/·<CR>cl

",i carga varios paquetes
autocmd BufEnter *.tex inoremap ,i <esc>:read /home/diego/.config/nvim/snippets/latex/init.tex <Cr>kdd

",e carga entorno ecuacion (\begin{eq.}, \end{ec})
autocmd BufEnter *.tex inoremap ,e <esc>:read /home/diego/.config/nvim/snippets/latex/ec.tex <Cr>kdd

",f carga entorno figura 
autocmd BufEnter *.tex inoremap ,f <esc>:read /home/diego/.config/nvim/snippets/latex/fig.tex <Cr>kdd

",vb carga entorno verbatim 
autocmd BufEnter *.tex inoremap ,vb <esc>:read /home/diego/.config/nvim/snippets/latex/verbatim.tex <Cr>kdd
"
",wf carga entorno wrap-figura (para articulos con multicol)
autocmd BufEnter *.tex inoremap ,wf <esc>:read /home/diego/.config/nvim/snippets/latex/wrapfig.tex <Cr>kdd

",al carga entorno de ecuaciones paralelas
autocmd BufEnter *.tex inoremap ,al <esc>:read /home/diego/.config/nvim/snippets/latex/align.tex <Cr>kdd

",pr inicializa una PResentación
autocmd BufEnter *.tex nnoremap ,pr <esc>:read /home/diego/.config/nvim/snippets/latex/beamer.tex <Cr>kdd

"al dejar vim se eliminan los archivos auxiliares.
autocmd VimLeave *.tex ! ~/.scripts/texclear %

"Deja de señalar los guiones bajos
let g:tex_no_error=1
let g:vimtex_view_method='zathura'


"Octave
autocmd BufEnter *.m map <F5> :w<CR> :!clear<CR> :!octave %<CR>
"R
autocmd BufEnter *.R map <F5> :w<CR> :!clear<CR> :!Rscript %<CR>
"PYTHON
autocmd BufEnter *.py map <F5> :w<CR> :!clear<CR> :!python %<CR>
" Configuración neomake (lining)
" When writing a buffer (no delay), and on normal mode changes (750ms).
call neomake#configure#automake('nw', 750)
