Protean
=======

> "We take one each, and when Harry sets the date of the next meeting he'll
> change the numbers on *his* coin, and because I've put a Protean Charm on
> them, they'll all change to mimic his."

Protean is a find/replace plugin that replaces the current word under cursor
(or current visual selection) and automatically moves the cursor to the next
match to repeat the substitution.

Usage
-----

Use `<Plug>Protean-Replace` to change the current word under cursor or current
visual selection.  Type in the replacement and upon exiting insert mode, the
cursor will automatically be moved to the next match.

Use `.` to repeat the substitution or `n` to skip to the next match

By default Protean maps `s` (mnemonic 'substitution') to
`<Plug>Protean-Replace`, but these mappings can be overriden by specifying your
own.


Requirements
------------

Protean requires Tim Pope's [repeat.vim][], to repeat the substitution on
subsequent matches.


Installation
------------

* [Pathogen][]
    * `cd ~/.vim/bundle && git clone https://github.com/pgdouyon/vim-protean.git`
* [Vim-Plug][]
    * `Plug 'pgdouyon/vim-protean'`
* Manual Install
    * Copy all the files into the appropriate directory under `~/.vim` on \*nix or
      `$HOME/_vimfiles` on Windows

License
-------

Copyright (c) 2015 Pierre-Guy Douyon.  Distributed under the MIT License.


[repeat.vim]: https://github.com/tpope/vim-repeat
[Pathogen]: https://github.com/tpope/vim-pathogen
[Vim-Plug]: https://github.com/junegunn/vim-plug
