" Run ruby, rspec, rake in ConqueTerm using colorized output
" Maintainer:	Yan Pritzker <yan@pritzker.ws>
" Last change: 2011-12-06
" v0.1

"
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
