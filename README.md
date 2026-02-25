Setup:
```
git clone git@github.com:aozgaa/vimrc.git ~/.vim
cd ~/.vim
git submodule update --init --recursive
```

Update packages/plugins:
```
cd ~/.vim
git pull --rebase
git submodule sync --recursive
git submodule update --init --recursive
git submodule update --remote --recursive
git status
```

If you want to save updated plugin versions in this repo:
```
cd ~/.vim
git add .
git commit -m "Update plugin submodules"
```

Inside Vim after updates (recommended):
```vim
:helptags ALL
```

Optional Coc maintenance:
```vim
:CocUpdate
:CocInstall -sync coc-clangd coc-snippets
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
