return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
  keys = {
    {
      "<leader>sF",
      "<cmd>Telescope find_files<cr>",
      desc = "Find files (default)",
    },
    {
      "<leader>sG",
      "<cmd>Telescope live_grep<cr>",
      desc = "Live grep (default)",
    },
    {
      "<leader>sB",
      "<cmd>Telescope buffers<cr>",
      desc = "Buffers (default)",
    },
    {
      "<leader>sR",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Recent files (default)",
    },
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files({
          entry_maker = require("lua.plugins.custom_pickers.custom_find_files").entry_maker(),
        })
      end,
      desc = "Find files (custom)",
    },
    {
      "<leader>sr",
      function()
        require("telescope.builtin").oldfiles({
          entry_maker = require("lua.plugins.custom_pickers.custom_find_files").entry_maker(),
        })
      end,
      desc = "Recent files (custom)",
    },
    {
      "<leader>sb",
      function()
        require("telescope.builtin").buffers({
          entry_maker = require("lua.plugins.custom_pickers.custom_buffers").entry_maker(),
        })
      end,
      desc = "Buffers (custom)",
    },
    {
      "<leader>/",
      function()
        require("telescope.builtin").live_grep({
          entry_maker = require("plugins.custom_pickers.custom_live_grep").entry_maker(),
          layout_strategy = "vertical",
        })
      end,
      desc = "Live grep (custom)",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    -- Configure telescope
    telescope.setup({
      pickers = {
        live_grep = {
          mappings = {
            i = {
              ["<C-e>"] = actions.to_fuzzy_refine,
            },
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")

    -- Set up which-key group with icon for all telescope commands
    require("which-key").add({
      { "<leader>s", group = "Search" },
    })
  end,
}
