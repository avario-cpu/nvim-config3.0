local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- window change made simpler
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

-- leader q to quit
map("n", "<leader>qq", ":qa<CR>", { desc = "Quit all", silent = true })

-- override OG lazygit with our custom solution
map("n", "<leader>gg", [[<Cmd>lua StartLazygit()<CR>]], { noremap = true, silent = true })
map("n", "<leader>gl", [[<Cmd>lua OpenLazygitLogs()<CR>]], { noremap = true, silent = true })

-- undo on U
map("n", "U", "<C-r>")

-- save with C-S
map("n", "<C-s>", ":w<CR>", { silent = true })

-- Center after most code navigation commands
map("n", "G", "Gzz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-O>", "<C-O>zz", opts)
map("n", "<C-I>", "<C-I>zz", opts)
map("n", "{", "{zz", opts)
map("n", "}", "}zz", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "%", "%zz", opts)
map("n", "``", "``zz", opts)

-- Lazy
require("which-key").add({
  "<leader>L",
  "<cmd>Lazy<cr>",
  desc = "Lazy",
  icon = "󰒲",
})

-- Rebind macro key cause mistakes are made too often lol
map("n", "q", "", { noremap = true })
map("n", "Q", "q", { noremap = true })

-- Delete whole word with ctrl+backspace (interpreted as <C-h> in terminal)
map("i", "<C-h>", "<C-w>", { noremap = true })

-- Disable hl with esc
map("n", "<esc>", "<cmd>noh<cr>")

-- lsp stuff
map("n", "K", vim.lsp.buf.hover, {})
map("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "Telescope Goto Definition" })
map("n", "gr", require("telescope.builtin").lsp_references, { desc = "Telescope Goto References" })

-- Window management
require("which-key").add({
  "<leader>wm",
  "<cmd>wincmd _<cr><cmd>wincmd |<cr>",
  desc = "Maximize window size",
})

require("which-key").add({
  "<leader>w=",
  "<cmd>wincmd =<cr>",
  desc = "Reset window size",
})

require("which-key").add({
  "<leader>wo",
  "<cmd>only<cr><cmd>Neotree<cr><cmd>wincmd l<cr>",
  desc = "Close others (and opens Neotree)",
})

require("which-key").add({
  "<leader>wq",
  "<cmd>quit<cr>",
  desc = "Close window",
})
