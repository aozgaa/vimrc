Complete Vim configuration for both new-machine setup and ongoing maintenance.

# Requirements

Required:
- `git` (clone repository and manage submodules)

Optional:
- [`k`](https://code.kx.com/q/learn/install/) for testing k code snippets
- [`iStyle`](https://github.com/thomasrussellmurphy/istyle-verilog-formatter) for formatting Verilog
- [`clang-format`](https://clang.llvm.org/docs/ClangFormat.html) for formatting C++

# Initial Setup

```bash
git clone git@github.com:aozgaa/vimrc.git ~/.vim
cd ~/.vim
git submodule update --init --recursive
```

For `clangd` support, either:
1. Install `clangd` system-wide (package manager or source build).
2. Let `coc` manage it: `:CocCommand clangd.install`.

# Routine Maintenance

## Update Repository and Plugins

```bash
cd ~/.vim
git pull --rebase
git submodule sync --recursive
git submodule update --init --recursive
git submodule update --remote --recursive
git status
```

## Refresh Vim Help Tags

Run after initial setup and after plugin updates so Vim picks up help/doc changes:

```bash
vim -Eu ~/.vim/vimrc -c "helptags ALL" -c "qa"
```

## Update Coc Maintenance

```bash
vim -Eu ~/.vim/vimrc -c "CocUpdate"
vim -Eu ~/.vim/vimrc -c "CocInstall -sync coc-clangd coc-snippets"
```
