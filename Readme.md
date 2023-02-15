# Quick Start

Now, I have two branches for neovim, one is using `embed lsp`, anothor is using `coc.nvim`.

Embed lsp is for geek customization, coc is for lightweight configuration.

## Install

For embed lsp users:

```sh
git clone -b lsp https://github.com/jinzhongjia/neovim-config.git ~/.config/nvim
```

For coc users:

```sh
git clone -b coc https://github.com/jinzhongjia/neovim-config.git ~/.config/nvim
```

## Denpendences

- Golang
- Rust
- Python
- Nodejs
- Zig
- Gcc/Clang
- Lazygit
- Lazydocker
- fd (*embed lsp*)
- ripgrep (*embed lsp*)


## Note

When you install this configuration compeletely, you need to run`:checkhealth` for check whether has problem.

### For `embed lsp` users

lsp server and null-ls denpendences are all installed by mason, you can use `:mason` to check installing information

### FOr `coc` users

coc depends `nodejs`, you may need to read coc help!