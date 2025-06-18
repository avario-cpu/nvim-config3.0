-- Module to setup Snacks toggles keymaps
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- Create some toggle mappings
    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.diagnostics():map("<leader>xd")
    Snacks.toggle
      .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
      :map("<leader>uc")
    Snacks.toggle.treesitter():map("<leader>uT")
    Snacks.toggle.inlay_hints():map("<leader>uh")

    -- My custom toggles

    local vtt = require("modules.snacks.toggle.custom-toggles.virtual-text").virtual_text_toggle
    vtt:map("<leader>xl")
    local wdtgl = require("modules.snacks.toggle.custom-toggles.word-diff-hl").word_diff_toggle
    wdtgl:map("<leader>gw")
  end,
})
