vim-ruby-conque.vim
============

 * Colorized Ruby, Rake, RSpec, and Cucumber output in vim using ConqueTerm
 * Dead simple -  ~20 lines of code
 * Sensible keybindings (feel free to change):
 
```
    nmap <silent> <Leader>rr :call RunRubyCurrentFileConque()<CR>
    nmap <silent> <Leader>ss :call RunRspecCurrentFileConque()<CR>
    nmap <silent> <Leader>ll :call RunRspecCurrentLineConque()<CR>
    nmap <silent> <Leader>cc :call RunCucumberCurrentFileConque()<CR>
    nmap <silent> <Leader>cl :call RunCucumberCurrentLineConque()<CR>
    nmap <silent> <Leader>RR :call RunRakeConque()<CR>
    nmap <silent> <Leader>rl :call RunLastConqueCommand()<CR>
```

 * Requires: http://code.google.com/p/conque/

 * Install: copy plugin/* to ~/.vim/plugin or if using pathogen, 
   copy the whole directroy to ~/.vim/bundle

Configuration
--------------

This plugin tries to detect whether you use 'rspec' (rspec2) or 
'spec' (rspec1) and set the default executable correctly. To override in your ~/.vimrc:

    let g:ruby_conque_rspec_command='spec'

Contribute
--------------
 * Like it? Fork it and contribute :)
 * Follow my blog: http://yanpritzker.com
