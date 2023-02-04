local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = {
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = false, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
}

require("lazy").setup({
    "folke/lazy.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "mrjones2014/nvim-ts-rainbow",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        event = "VeryLazy",
        build = function()
          local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
          ts_update()
        end,
        config = function()
          require("plugin-config.nvim-treesitter")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "BufEnter",
        config = function()
          require("plugin-config.lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "moll/vim-bbye",
        },
        event = "BufEnter",
        config = function()
          require("plugin-config.bufferline")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
          require("plugin-config.indent-blankline")
        end,
    },
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
          require("plugin-config.comment")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
        config = function()
          require("plugin-config.nvim-tree")
        end,
    },
    {
        "anuvyklack/windows.nvim",
        event = "VeryLazy",
        dependencies = "anuvyklack/middleclass",
        config = function()
          require("plugin-config.windows")
        end,
    },
    {
        "neoclide/coc.nvim",
        branch = "release",
        event = "VeryLazy",
        config = function()
          require("coc-config")
        end,
    },
    {
        "voldikss/vim-floaterm",
        event = "VeryLazy",
    },
    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },

    --------------------- colorschemes --------------------
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
          local status, catppuccin = pcall(require, "catppuccin")
          if not status then
            vim.notify("not found Catppuccin")
            return
          else
            catppuccin.setup({
                flavour = "macchiato",
            })
          end
          vim.cmd.colorscheme("catppuccin")
        end,
    },
}, lazy_config)
