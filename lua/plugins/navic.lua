return {
  "SmiteshP/nvim-navic",
  event = "LspAttach",
  dependencies = { "neovim/nvim-lspconfig" }, -- Use dependencies instead of requires
  opts = {
    highlight = true,
  },
}
