Setup:
```
git clone git@github.com:aozgaa/vimrc.git ~/.vim
cd ~/.vim
git submodule update --init --recursive
```

Optional: get [`k`](https://code.kx.com/q/learn/install/) for testing k code snippets.

Optional: get [`iStyle`](https://github.com/thomasrussellmurphy/istyle-verilog-formatter).
Build it and add it to your PATH (for formating verilog).

Optional: get [`clang-format`](https://clang.llvm.org/docs/ClangFormat.html).
It may be included in your pacakge manager if you have one.
(Though it's nice to get latest features by buildign from source)

Optional: extensions for coc.vim to work with languages:
* coc-clangd (again, nice to have `clangd` from source)
* coc-snippets

See included plugins for additonal dependencies.
