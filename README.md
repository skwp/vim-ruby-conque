vim-ruby-conque.vim
============

 * Colorized ruby, rake, and rspec output in vim using ConqueTerm
 * Dead simple -  ~20 lines of code
 * Sensible keybindings (feel free to change):
    * <code>nmap <silent> <Leader>rr :call RunRubyCurrentFileConque()<CR> </code>
    * <code>nmap <silent> <Leader>ss :call RunRspecCurrentFileConque()<CR></code>
    * <code>nmap <silent> <Leader>ll :call RunRspecCurrentLineConque()<CR></code>
    * <code>nmap <silent> <Leader>RR :call RunRakeConque()<CR></code>

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
