local opts = { noremap = true, silent = true }
local wk = require("which-key")
local map = vim.keymap.set

-- lateral movement with H and L except in neo-tree
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.bo.buftype ~= "neo-tree" then
      map("n", "H", "15zh", { desc = "Move cursor 10 spaces to the left" })
      map("n", "L", "15zl", { desc = "Move cursor 10 spaces to the right" })
    end
  end,
})

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Exit terminal mode
map("t", "<C-q>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- window change made simpler (might be disabled w/ smart-splits)
-- map("n", "<C-h>", "<C-w>h", { desc = "Move to left window", silent = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window", silent = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window", silent = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Move to right window", silent = true })

-- leader q to quit
vim.keymap.set({ "n", "v" }, "<leader>qq", ":<C-u>qa<CR>", { desc = "Quit all", silent = true })

-- undo on U
map("n", "U", "<C-r>")

-- save with C-S
map("n", "<C-s>", "<cmd>w<cr><esc>", { silent = true })

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
-- map("n", "``", "``zz", opts)

-- Lazy
wk.add({
  "<leader>L",
  "<cmd>Lazy<cr>",
  desc = "Lazy",
  icon = "󰒲",
})

-- Rebind macro key cause mistakes are made too often lol
map("n", "q", "", { noremap = true, desc = "Quit most things" })
map("n", "Q", "q", { noremap = true, desc = "Record macro" })

-- Delete whole word with ctrl+backspace (interpreted as <C-h> in terminal)
map("i", "<C-h>", "<C-w>", { noremap = true })

-- Close (non-focused) floating windows and disable search hl with ESC
map("n", "<esc>", function()
  local current_win = vim.api.nvim_get_current_win()
  local current_config = vim.api.nvim_win_get_config(current_win)
  if current_config.relative ~= "" then
    vim.cmd("noh")
    return
  end
  require("scripts.ui.close-floating-windows")
end, { silent = true, desc = "Close floating windows/disable search highlight" })

-- Set focus on solo windows + main filetree explorer
map("n", "<leader>wo", function()
  local win = vim.api.nvim_get_current_win()
  local filetype = vim.bo[vim.api.nvim_win_get_buf(win)].filetype
  local excluded_filetypes = {
    "snacks_picker_list",
    "snacks_picker_input",
    "neo-tree",
  }
  if vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then -- avoid exiting nvim with this like an idiot
    vim.notify("Cannot focus on explorer window", vim.log.levels.WARN)
    return
  end
  vim.cmd("only")
  require("scripts.ui.open-file-explorer").open_main_explorer()
end, { desc = "Close others (and opens File Explorer)" })

-- force C-n and C-p to navigate cmd/search history (fixes cmp issues)
map("c", "<C-n>", "<C-Down>", { desc = "Navigate cmd history" })
map("c", "<C-p>", "<C-Up>", { desc = "Navigate cmd history" })

map("n", vim.g.maplocalleader .. "i", function()
  vim.notify("test")
end, { desc = "test" })

-- Search within visual selection
vim.keymap.set("x", "<leader>/", "<Esc>/\\%V")

wk.add({
  "<leader>bp",
  function()
    local path = vim.api.nvim_buf_get_name(0)
    local row = unpack(vim.api.nvim_win_get_cursor(0))
    local command = ("pycharm --line " .. row .. " " .. path .. "")
    print(command)
    os.execute(command)
  end,
  desc = "Open line in PyCharm",
  icon = { icon = "", color = "yellow" },
})

-- Quickfix navigation
map("n", "[q", function()
  local ok, err = pcall(vim.cmd.cprev)
  if not ok then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Previous Quickfix Item" })

map("n", "]q", function()
  local ok, err = pcall(vim.cmd.cnext)
  if not ok then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Next Quickfix Item" })

-- Focus main editing window
vim.keymap.set("n", "<leader>wi", function()
  require("scripts.ui.focus-largest-window")
end, { desc = "Focus largest window" })

-- Easier system yank
map({ "n", "v" }, "<C-y>", function()
  vim.fn.feedkeys('"+y')
end, { desc = "Yank to system clipboard", noremap = true })

-- Help scroll diff smoothly
map("n", "<C-c>", "<C-y>", opts)
map("n", "<C-m>", "<C-e>", opts)
