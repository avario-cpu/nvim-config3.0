return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    -- Configure telescope
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-e>"] = require("telescope.actions").to_fuzzy_refine,
          },
          n = {
            ["<C-e>"] = require("telescope.actions").to_fuzzy_refine,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- Enable fuzzy matching
          override_generic_sorter = true, -- Override the generic sorter
          override_file_sorter = true, -- Override the file sorter
          case_mode = "smart_case", -- "smart_case" | "ignore_case" | "respect_case"
        },
      },
    })

    -- Default find_files binding
    vim.keymap.set(
      "n",
      "<Space>sf",
      "<cmd>Telescope find_files<cr>",
      { noremap = true, silent = true, desc = "Find files (default)" }
    )

    -- Custom find_files binding
    local custom_find_files = require("plugins.custom_pickers.find_files")
    vim.keymap.set("n", "<leader><leader>", function()
      builtin.find_files({
        entry_maker = custom_find_files.entry_maker(),
      })
    end, { noremap = true, silent = true, desc = "Find files (custom)" })

    -- Custom live_grep binding
    local custom_grep = require("plugins.custom_pickers.live_grep")
    vim.keymap.set("n", "<leader>/", function()
      builtin.live_grep({
        entry_maker = custom_grep.entry_maker(),
        layout_strategy = "vertical",
      })
    end, { noremap = true, silent = true, desc = "Live grep (custom)" })
  end,
}
