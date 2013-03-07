Ruby Conque & Fast-spec Aware RSpec Finder
============

 * Colorized Ruby, Rake, RSpec, and Cucumber output in vim using ConqueTerm
 * Spec Finder - use `Ctrl-s` to automatically find the related spec and open in a split, fast_spec aware!
 * Sensible keybindings (feel free to change), all prefixed with 'rc':
 * Switch between running rspec1 and rspec2 with `:Rspec1` and `:Rspec2` (you need both installed)

```vim
nmap <silent> <Leader>rcrr :call RunRubyCurrentFileConque()<CR>
nmap <silent> <Leader>rcss :call RunRspecCurrentFileConque()<CR>
nmap <silent> <Leader>rcll :call RunRspecCurrentLineConque()<CR>
nmap <silent> <Leader>rccc :call RunCucumberCurrentFileConque()<CR>
nmap <silent> <Leader>rccl :call RunCucumberCurrentLineConque()<CR>
nmap <silent> <Leader>rcRR :call RunRakeConque()<CR>
nmap <silent> <Leader>rcrl :call RunLastConqueCommand()<CR>

nnoremap <silent> <C-s> :call RelatedSpecVOpen()<CR>
nnoremap <silent> ,<C-s> :call RelatedSpecOpen()<CR>
```

 * Requires: http://code.google.com/p/conque/
 * Github mirror: https://github.com/rson/vim-conque

 * Install: copy plugin/* to ~/.vim/plugin or if using pathogen,
   copy the whole directroy to ~/.vim/bundle

Recommended keybindings
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

Using the Spec Runner
-------------
Try some of the keybindings listed above.

Upon running a test your cursor will be in the Conque buffer, you can use these commands:

    q   closes/quits the buffer
    n   goes to the next Failure message.
    p   goes to the previous Failure message.
    f   goes to the Finished At section for an overview of the test.

Using the Spec Finder
--------------

While inside a ruby file, invoke the shortcut (supplied as `Ctrl-s`), and
the corresponding spec will be open. The assumptions are:

  * Your specs live in spec/ or fast_spec/
  * Your pwd (current dir) is the project root
  * You use the same dir structure in your code and specs so that
    code living at lib/foo/bar.rb has a spec at spec/lib/foo/bar_spec.rb

For more information, please see doc/spec-finder.txt. There are included
functions for opening the spec in the current window, and in a split, as
well as just getting its full path.


Configuration
--------------

This plugin tries to detect whether you use 'rspec' (rspec2) or
'spec' (rspec1) and set the default executable correctly. To override in your ~/.vimrc:

    let g:ruby_conque_rspec_runner='spec'

It will also do the same for cucumber, trying to determine whether to
run 'cucumber' or 'bundle exec cucumber' and set the default correctly.
You can override in your ~/.vimrc

    let g:ruby_conque_cucumber_runner='cucumber'

Contribute
--------------
 * Code by Yan Pritzker and Matt Furden
 * Like it? Fork it and contribute :)
 * Follow my blog: http://yanpritzker.com
 * See also: http://skwp.github.com/dotfiles
