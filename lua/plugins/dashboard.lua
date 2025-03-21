return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  enabled = true,
  config = function()
    local custom_header = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "                                                                              ",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "                                                                              ",
      "       ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗    ",
      "       ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║    ",
      "       ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║    ",
      "       ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║    ",
      "       ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║    ",
      "       ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝    ",
      "                                                                              ",
      "                                                                              ",
      "",
      "",
      "",
      "",
    }

    local builtin = require("telescope.builtin")
    local custom_find_files = require("lua.plugins.custom_pickers.custom_find_files")
    local custom_grep = require("plugins.custom_pickers.custom_live_grep")

    require("dashboard").setup({
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = custom_header,
        center = {
          {
            action = function()
              builtin.find_files({
                entry_maker = custom_find_files.entry_maker(),
              })
            end,
            desc = " Find File",
            icon = "",
            key = "f",
          },
          {
            action = function()
              builtin.live_grep({
                entry_maker = custom_grep.entry_maker(),
                layout_strategy = "vertical",
              })
            end,
            desc = " Find Word",
            icon = "",
            key = "/",
          },
          {
            action = function()
              builtin.oldfiles({
                entry_maker = custom_find_files.entry_maker(),
              })
            end,
            desc = " Recent Files",
            icon = "",
            key = "r",
          },
          {
            action = 'lua require("persistence").load() vim.cmd("Neotree")',
            desc = " Restore Session",
            icon = "",
            key = "s",
          },
          {
            action = function()
              vim.cmd("Lazy") -- opens the lazy.nvim plugin manager
            end,
            desc = " Open Lazy",
            icon = "󰒲",
            key = "l",
          },
          {
            action = function()
              vim.cmd("lua StartLazygit()") -- opens the lazygit plugin
            end,
            desc = " Open LazyGit",
            icon = "󰊢",
            key = "g",
          },
          {
            action = function()
              vim.cmd("quit")
            end,
            desc = " Quit Neovim",
            icon = "󰗼",
            key = "q",
          },
          {
            action = require("scripts.delete_temp_shadas").Delete_shada_temp_files,
            desc = " Delete Shada Temp Files",
            icon = "󱕖",
            key = "d",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "",
            "",
            "",
            "",
            "",
            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
          }
        end,
      },
    })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
