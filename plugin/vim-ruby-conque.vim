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
  else
    echohl ErrorMsg
    echo "Warning: 'spec' or 'rspec' could not be found in your path."
    echohl NONE
  endif
endif

function RunRubyCurrentFileConque()
  execute "ConqueTermSplit ruby" bufname('%')
endfunction

function RunRspecCurrentLineConque()
  execute "ConqueTermSplit " g:ruby_conque_rspec_command bufname('%') " -l "  line('.') " --color"
endfunction

function RunRspecCurrentFileConque()
  execute "ConqueTermSplit " g:ruby_conque_rspec_command bufname('%') " --color"
endfunction

function RunRakeConque()
  execute "ConqueTermSplit rake"
endfunction

nmap <silent> <Leader>rr :call RunRubyCurrentFileConque()<CR>
nmap <silent> <Leader>ss :call RunRspecCurrentFileConque()<CR>
nmap <silent> <Leader>ll :call RunRspecCurrentLineConque()<CR>
nmap <silent> <Leader>RR :call RunRakeConque()<CR>
