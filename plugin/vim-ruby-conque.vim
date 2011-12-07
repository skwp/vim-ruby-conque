" Run ruby, rspec, rake in ConqueTerm using colorized output
" Maintainer:	Yan Pritzker <yan@pritzker.ws>
" Last change: 2011-12-06
" v0.1

" For rspec 2: default 'rspec' command
" For rspec 1, use this in your config file:
" let g:ruby_conque_rspec_command='spec'
if !exists('g:ruby_conque_rspec_command')
  let g:ruby_conque_rspec_command='rspec'
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
