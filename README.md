vim-ruby-conque.vim
============

 * Colorized Ruby, Rake, RSpec, and Cucumber output in vim using ConqueTerm
 * Sensible keybindings (feel free to change), all prefixed with 'rc':

```vim
nmap <silent> <Leader>rcrr :call RunRubyCurrentFileConque()<CR>
nmap <silent> <Leader>rcss :call RunRspecCurrentFileConque()<CR>
nmap <silent> <Leader>rcll :call RunRspecCurrentLineConque()<CR>
nmap <silent> <Leader>rccc :call RunCucumberCurrentFileConque()<CR>
nmap <silent> <Leader>rccl :call RunCucumberCurrentLineConque()<CR>
nmap <silent> <Leader>rcRR :call RunRakeConque()<CR>
nmap <silent> <Leader>rcrl :call RunLastConqueCommand()<CR>
```

 * Requires: http://code.google.com/p/conque/
 * Github mirror: https://github.com/rson/vim-conque

 * Install: copy plugin/* to ~/.vim/plugin or if using pathogen,
   copy the whole directroy to ~/.vim/bundle

Recommended keybinings
-------------

Chords are faster than typing out long strings:

```vim
" Cmd-Shift-R for RSpec
nmap <silent> <D-R> :call RunRspecCurrentFileConque()<CR>
" Cmd-Shift-L for RSpec Current Line
nmap <silent> <D-L> :call RunRspecCurrentLineConque()<CR>
" ,Cmd-R for Last conque command
nmap <silent> ,<D-R> :call RunLastConqueCommand()<CR>
```

Usage
-------------
Try some of the keybindings listed above.

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
 * Code by Yan Pritzker and Matt Furden
 * Like it? Fork it and contribute :)
 * Follow my blog: http://yanpritzker.com
 * See also: http://skwp.github.com/dotfiles
