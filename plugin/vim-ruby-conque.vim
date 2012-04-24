" ============================================================================
" File:        vim-ruby-conque.vim
" Description: Run ruby, rspec, rake in ConqueTerm using colorized output
" Maintainer:  Yan Pritzker <yan@pritzker.ws>
" Last Change: December 8, 2011
" Version:     0.0.1
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================

" Automatically uses 'rspec' if you have rspec2
" installed, or 'spec' for rspec1. You can override
" This by setting up your vimrc like this:
"
" let g:ruby_conque_rspec_command='spec'
"
if !exists('g:ruby_conque_rspec_command')
  if executable('rspec')
    let g:ruby_conque_rspec_command='rspec'
  elseif executable('spec')
    let g:ruby_conque_rspec_command='spec'
  endif

endif

" Always deletes any existing instance prior to runing the next one
function! RunSingleConque(command)
  try
    if(exists("g:single_conque"))
      exec "bdelete " . g:single_conque.buffer_name
    endif
  catch
  endtry
  " Keep track of the last command issued.
  let g:last_conque_command = a:command
  let g:single_conque = conque_term#open(a:command, ['botright split', 'res 10'])
endfunction

function! RunRubyCurrentFileConque()
  call RunSingleConque("ruby " . bufname('%'))
endfunction

function! RunRspecCurrentLineConque()
  call RunSingleConque(g:ruby_conque_rspec_command . " " . bufname('%') . " -l "  . line('.') . " --color")
endfunction

function! RunRspecCurrentFileConque()
  call RunSingleConque(g:ruby_conque_rspec_command . " " . bufname('%') . " --color")
endfunction

function! RunCucumberCurrentLineConque()
  call RunSingleConque("cucumber" . " " . bufname('%') . ":" . line('.'))
endfunction

function! RunCucumberCurrentFileConque()
  call RunSingleConque("cucumber" . " " . bufname('%'))
endfunction

function! RunRakeConque()
  call RunSingleConque("rake")
endfunction

function! RunLastConqueCommand()
  if exists("g:last_conque_command")
    call RunSingleConque(g:last_conque_command)
  else
    echo "You haven't run a Vim-Ruby-Conque command to repeat."
  endif
endfunction

" Get around Conques annoying trapping of input in some kind of strange
" inputless input mode. Also added q to close the buffer. n and p jump between
" errors in the output buffer.
function! RubyConqueControls(single_conque)
  :map <buffer> j j
  :map <buffer> k k
  :map <buffer> q <C-w>c
  :map <silent><buffer> n /^\s\+\d\+)<CR>:noh<CR>zt
  :map <silent><buffer> p ?^\s\+\d\+)<CR>:noh<CR>zt
  :map <silent><buffer> f /Finished in<CR>:noh<CR>zt
  :imap <buffer> j <Esc>j
  :imap <buffer> k <Esc>k
  :imap <buffer> q <Esc><C-w>c
  :imap <silent> <buffer> n <Esc>/^\s\+\d\+)<CR>:noh<CR>zt
  :imap <silent> <buffer> p <Esc>?^\s\+\d\+)<CR>:noh<CR>zt
  :imap <silent> <buffer> f <Esc>/Finished in<CR>:noh<CR>zt
endfunction

call conque_term#register_function('after_startup', 'RubyConqueControls')

nmap <silent> <Leader>rcrr :call RunRubyCurrentFileConque()<CR>
nmap <silent> <Leader>rcss :call RunRspecCurrentFileConque()<CR>
nmap <silent> <Leader>rcll :call RunRspecCurrentLineConque()<CR>
nmap <silent> <Leader>rccl :call RunCucumberCurrentLineConque()<CR>
nmap <silent> <Leader>rccc :call RunCucumberCurrentFileConque()<CR>
nmap <silent> <Leader>rcRR :call RunRakeConque()<CR>
nmap <silent> <Leader>rcrl :call RunLastConqueCommand()<CR>
