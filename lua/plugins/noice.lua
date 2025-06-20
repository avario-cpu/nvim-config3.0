return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    presets = {
      lsp_doc_border = true,
    },
    routes = {
      {
        filter = {
          event = "notify",
          find = "Config Change Detected. Reloading",
        },
        view = "mini",
        opts = { timeout = 1000 },
      },
      {
        filter = {
          event = "msg_show",
          find = "written$",
        },
        view = "mini",
        opts = { timeout = 1000 },
      },
    },
    lsp = {
      signature = {
        enabled = true,
      },
      hover = {
        enabled = true,
      },
      progress = {
        enabled = true,
      },
    },
  },
  config = function(_, opts)
    -- Global keymaps that should work regardless of when the plugin loads
    vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
      if not require("noice.lsp").scroll(4) then
        return "<c-f>"
      end
    end, { silent = true, expr = true, desc = "Scroll forward in LSP docs" })

    vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
      if not require("noice.lsp").scroll(-4) then
        return "<c-b>"
      end
    end, { silent = true, expr = true, desc = "Scroll backward in LSP docs" })
    require("noice").setup(opts)
  end,
  keys = {
    {
      "<leader>na",
      function()
        vim.cmd("NoiceAll")
        require("scripts.ui.maximize-window").half_size_window()
        vim.schedule(function()
          Make_window_floating()
          vim.cmd("normal! G")
          vim.cmd("normal! M")
        end)
      end,
      desc = "All notifications (half size window)",
    },
    {
      "<leader>nd",
      "<cmd>NoiceDismiss<CR>",
      desc = "Dismiss notifications",
    },
  },
}
