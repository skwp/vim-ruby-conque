" Run ruby, rspec, rake in ConqueTerm using colorized output
" Maintainer:	Yan Pritzker <yan@pritzker.ws>
" Last change: 2011-12-06
" v0.1

function RunRubyCurrentFileConque()
  execute "ConqueTermSplit ruby" bufname('%')
endfunction

function RunRspecCurrentLineConque()
  execute "ConqueTermSplit rspec" bufname('%') " -l "  line('.') " --color --format doc"
endfunction

function RunRspecCurrentFileConque()
  execute "ConqueTermSplit rspec" bufname('%') " --color --format doc"
endfunction

function RunRakeConque()
  execute "ConqueTermSplit rake"
endfunction

nmap <silent> <Leader>rr :call RunRubyCurrentFileConque()<CR>
nmap <silent> <Leader>ss :call RunRspecCurrentFileConque()<CR>
nmap <silent> <Leader>ll :call RunRspecCurrentLineConque()<CR>
nmap <silent> <Leader>RR :call RunRakeConque()<CR>
