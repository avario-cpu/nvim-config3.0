return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "jonahgoldwastaken/copilot-status.nvim", "zbirenbaum/copilot.lua" },
    config = function()
      -- Get default config first
      local lualine = require("lualine")
      local config = lualine.get_config()

      -- Add our components to lualine_x section while preserving existing ones
      table.insert(config.sections.lualine_x, 2, {
        "harpoon2",
        icon = "󱡅", -- Harpoon icon (requires a Nerd Font)
        indicators = { "1", "2", "3", "4", "5" },
        active_indicators = { "[1]", "[2]", "[3]", "[4]", "[5]" },
        color_active = { fg = "#ff6186", gui = "bold" },
        component_separators = { left = "", right = "" },
        no_harpoon = "Harpoon not loaded",
      })

      require("copilot_status").setup({})
      table.insert(config.sections.lualine_x, 3, {
        function()
          return require("copilot_status").status_string()
        end,
        cnd = function()
          return require("copilot_status").enabled()
        end,
      })

      -- Set global status
      config.options.globalstatus = true

      -- Apply the modified config
      lualine.setup(config)
    end,
  },
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
  },
}
