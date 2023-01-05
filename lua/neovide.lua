function NeovideConfig()
    vim.g.neovide_refresh_idle = 144
    vim.g.neovide_refresh_rate_idle = 30
    vim.g.neovide_fullscreen = false
    vim.g.neovide_cursor_vfx_mode = "ripple"
    vim.g.neovide_transparency = 0.95
    vim.g.neovide_hide_mouse_when_typing = true
    vim.cmd([[
  set guifont=FiraCode\ Nerd\ Font:h9
  ]])
end

if vim.g.neovide then
    NeovideConfig()
end
