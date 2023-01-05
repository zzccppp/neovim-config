# what is this ?

This is a NEOVIM configuration for the minimum plugins, and 100% lua!

The difference with branch `main` is the number of plugins is smallest.

And now it is can used on mainstream Linux distributions and windows, all dependencies are modularized, you can easily use it on your computer after installing required external dependencies

I suggest you to use neovide, a neovim client, which is written in rust (supports gpu acceleration), and my configuration already includes the configuration of neovide

![home](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/home.png)

![file_browser](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/file_browser.png)

![file_find](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/file_find.png)

![file_find_grep](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/file_find_grep.png)

![floaterm1](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/floaterm1.png)

![floaterm_lazygit](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/floaterm_lazygit.png)

![debug_with_dap](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/debug_with_dap.png)

![mason](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/mason.png)

![symbols_outlines](https://github.com/jinzhongjia/neovim-config/blob/lsp/.img/symbols_outlines.png)

## dependencies

It is recommended to use the system's package manager to install the following dependencies

- [Nerd fonts](https://www.nerdfonts.com/font-downloads)
- [git](https://git-scm.com/downloads)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [lazydocker](https://github.com/jesseduffield/lazydocker)

## QuickStart

1. **Git clone configuration to local**

Then you clone this config with command:

> Unix, Linux

```bash
# This will git clone the neovim-config to your system path
git clone -b lazy_lsp https://github.com/jinzhongjia/neovim-config.git ~/.config/nvim
```

2. **Open Nvim To Auto Configurate**

Now, you just need to use this command `nvim` to open neovim!

And then you will see that message which tell you missing a lot of plugins, dont worry, just press `ENTER` to continue, then the `packer` will Automatically install all plugins.

That looks cool, doesn't it?

3. **Exit And Reopen Neovim**

Exit and reopen neovim, it will auto install the lsp, dap, null-ts, treesitter dependencies!

Maybe you need to type `:checkhealth` to check out possible errors.

4. **Enjoy your self!**

Now, you have config `Neovim` completely, enjoy it!

## Recommend Environment

The following environments may be used in lsp (language server proctool), it is recommended to install!

- GO
- RUST
- CLANG
- GCC
- NODE
- RUBY

## Feature

- Syntax highlight is based on `tree-sitter` embled Neovim
- Grammar complement is based on `lsp`(Language Server protocol) and snippet
- Code Format is based on `null-ls`
- Code Debug is based on `dap`
- Diagnostics is based on `lsp`, `null-ls`

## Preconfiguration languages

- golang
- javascript or typescript
- html, css, tailwindcss3
- rust
- c/cpp
- python
- lua
- bash
- sql

for using other languages, you can Configurate in `lua/lsp/list.lua`, `lua/null-ts/list.lua`, `lua/dap/list.lua`
