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
" let g:ruby_conque_rspec_runner='spec'
"
function! GetRubyConqueRspecCommand()
  if exists('g:ruby_conque_rspec_runner')
    return g:ruby_conque_rspec_runner
  else
    if executable('rspec')
      return 'rspec'
    elseif executable('bundle exec rspec')
      return 'bundle exec rspec'
    elseif executable('spec')
      return 'spec'
    elseif executable('bundle exec spec')
      return 'bundle exec spec'
    endif
  endif
endfunction

" Always deletes any existing instance prior to runing the next one
function! RunSingleConque(command)

  " Close quickfix and location windows that are in the way
  :cclose
  :lclose

  call CloseSingleConque()
  " Keep track of the last command issued.
  let g:last_conque_command = a:command
  let g:single_conque = conque_term#open(a:command, ['botright split', 'res 10'])
endfunction

function! CloseSingleConque()
  try
    if(exists("g:single_conque"))
      exec "bdelete " . g:single_conque.buffer_name
    endif
  catch
  endtry
endfunction

function! RunRubyCurrentFileConque()
  call RunSingleConque("ruby " . bufname('%'))
endfunction

function! RunRspecCurrentLineConque()
  call RunSingleConque(GetRubyConqueRspecCommand() . " " . bufname('%') . " -l "  . line('.') . " --color")
endfunction

function! RunRspecCurrentFileConque()
  call RunSingleConque(GetRubyConqueRspecCommand() . " " . bufname('%') . " --color")
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

" Requires https://github.com/skwp/vim-spec-finder
function! RunRspecRelated()
  call RunSingleConque(GetRubyConqueRspecCommand() . " " . RelatedSpec() . " --color")
endfunction

" Get around Conques annoying trapping of input in some kind of strange
" inputless input mode. Also added q to close the buffer. n and p jump between
" errors in the output buffer.
function! RubyConqueControls(single_conque)
  :setlocal nolist
  :map <buffer> j j
  :map <buffer> k k
  :map <buffer> q <C-w>c
  :map <silent><buffer> n /^\s\+\d\+)<CR>:noh<CR>zt
  :map <silent><buffer> p ?^\s\+\d\+)<CR>:noh<CR>zt
  :map <silent><buffer> f /Finished in<CR>:noh<CR>zt
endfunction

function! UseRspec1()
  let g:ruby_conque_rspec_runner='spec'
  echo "Now using spec runner (RSpec 1)"
endfunction

function! UseRspec2()
  let g:ruby_conque_rspec_runner='rspec'
  echo "Now using rspec runner (RSpec 2)"
endfunction

call conque_term#register_function('after_startup', 'RubyConqueControls')

command! RunRubyCurrentFileConque call RunRubyCurrentFileConque()
command! RunRspecCurrentFileConque call RunRspecCurrentFileConque()
command! RunRspecCurrentLineConque call RunRspecCurrentLineConque()
command! RunCucumberCurrentLineConque call RunCucumberCurrentLineConque()
command! RunCucumberCurrentFileConque call RunCucumberCurrentFileConque()
command! RunRakeConque call RunRakeConque()
command! RunLastConqueCommand call RunLastConqueCommand()
command! RunRspecRelated call RunRspecRelated()
command! CloseSingleConque call CloseSingleConque()
command! Rspec1 call UseRspec1()
command! Rspec2 call UseRspec2()

nmap <silent> <Leader>rcrr :RunRubyCurrentFileConque<CR>
nmap <silent> <Leader>rcss :RunRspecCurrentFileConque<CR>
nmap <silent> <Leader>rcll :RunRspecCurrentLineConque<CR>
nmap <silent> <Leader>rccl :RunCucumberCurrentLineConque<CR>
nmap <silent> <Leader>rccc :RunCucumberCurrentFileConque<CR>
nmap <silent> <Leader>rcRR :RunRakeConque<CR>
nmap <silent> <Leader>rcrl :RunLastConqueCommand<CR>
nmap <silent> <Leader>rcrel :RunRspecRelated<CR>
nmap <silent> <Leader>rccc :CloseSingleConque<CR>
nmap <silent> <Leader>rcr1 :Rspec1<CR>
nmap <silent> <Leader>rcr2 :Rspec2<CR>
