-- remove automatic comment insertion
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- Center cursor after search using Enter
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    vim.keymap.set("c", "<CR>", function()
      if vim.fn.getcmdtype() == "/" or vim.fn.getcmdtype() == "?" then
        return "<CR>zz"
      end
      return "<CR>"
    end, { expr = true, buffer = true })
  end,
})

-- Better, floating, cmdline window
vim.api.nvim_create_autocmd("CmdwinEnter", {
  pattern = "*",
  callback = function()
    -- Allow quitting cmdline window with q
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", { noremap = true })
    -- Configure window to be floating
    local win_id = vim.api.nvim_get_current_win()
    local width = 90
    vim.api.nvim_win_set_config(win_id, {
      relative = "editor",
      width = width,
      height = 15,
      col = math.floor((vim.o.columns - width) / 2 - 1),
      row = math.floor(vim.o.lines * 0.55),
      border = "rounded",
      title = " Cmdline ",
      title_pos = "center",
    })
  end,
})

-- Disable cursorline in diff mode
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    if vim.wo.diff then
      -- This code runs when entering a window in diff mode
      local wins = vim.api.nvim_tabpage_list_wins(0)
      for _, win in ipairs(wins) do
        vim.cmd("set nowrap")
        vim.wo[win].cursorline = false
        vim.wo[win].culopt = "number"
      end
    end
  end,
})

-- Automatically switch to the help window when opening help files to the right and allow quitting with q
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.txt", "*.md" },
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd L")
      vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", { noremap = true })
    end
  end,
})

-- Set textwidth to 88 for Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.textwidth = 88 -- Set textwidth to 88 for Python files (matching Black's default)
  end,
})

-- Ensure it is enabled and activates highlighting of spelling errors.
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- vim.opt.spell = true
    vim.opt.spelllang = "en"

    vim.api.nvim_set_hl(0, "SpellBad", {
      underline = true,
      fg = "#ff5555", -- light red
    })

    vim.api.nvim_set_hl(0, "SpellCap", {
      underline = true,
      fg = "#8be9fd", -- light blue
    })

    vim.api.nvim_set_hl(0, "SpellRare", {
      underline = true,
      fg = "#f1fa8c", -- light yellow
    })

    vim.api.nvim_set_hl(0, "SpellLocal", {
      underline = true,
      fg = "#bd93f9", -- light purple
    })
  end,
})

-- Send out a name for the wezterm tab through OSC sequence
vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
  callback = function()
    local filename = vim.fn.expand("%:t")
    if filename == "" then
      filename = "[No Name]"
    end
    local title = string.format(" nvim - %s ", filename)
    vim.opt.title = true
    vim.opt.titlestring = title
    vim.cmd("redraw")
  end,
})
