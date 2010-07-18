# openser.vim

This is a slightly edited copy of 
[http://www.vim.org/scripts/script.php?script_id=2242](http://www.vim.org/scripts/script.php?script_id=2242)

## Changes

I've added filetype detection and tweaked the syntax file to allow routes 
in this format:

    route[1]
    {
      // do something
    }

## Installation

**Pathogen**

    cd ~/.vim/bundle
    git clone git://github.com/itspriddle/vim-openser

**Old School**

    git clone git://github.com/itspriddle/vim-openser
    cd vim-openser
    cp ftdetect/openser.vim ~/.vim/ftdetect
    cp syntax/openser.vim ~/.vim/syntax

