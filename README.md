vim-ruby-conque.vim
============

 * Colorized Ruby, Rake, RSpec, and Cucumber output in vim using ConqueTerm
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
 * Github mirror: https://github.com/rson/vim-conque

 * Install: copy plugin/* to ~/.vim/plugin or if using pathogen, 
   copy the whole directroy to ~/.vim/bundle

Usage
-------------
This fork differs from the original in that I've modified the Conque buffers key bindings and
added the ability to repeat your last command, allowing you to repeat a test while editing elsewhere.

When I use Conque, despite setting it not to enter Insert mode, it still enters insert mode.
I've added bindings to both insert and normal mode to remove the annoyance of this issue as well
as make navigation within the test buffer more pleasant.

Upon running a test your cursor will be in the Conque buffer, you can use these commands:

    q   closes/quits the buffer
    n   goes to the next Failure message.
    p   goes to the previous Failure message.
    f   goes to the Finished At section for an overview of the test.



Configuration
--------------

This plugin tries to detect whether you use 'rspec' (rspec2) or 
'spec' (rspec1) and set the default executable correctly. To override in your ~/.vimrc:

    let g:ruby_conque_rspec_command='spec'

Contribute
--------------
 * Like it? Fork it and contribute :)
 * Follow my blog: http://yanpritzker.com
