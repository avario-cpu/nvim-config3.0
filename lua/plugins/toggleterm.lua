return {
  "akinsho/toggleterm.nvim",
  enabled = true,
  version = "*",
  config = function()
    local original_height = 10 -- Store the original height

    local Terminal = require("toggleterm.terminal").Terminal
    local next_terminal_id = 1

    local function set_terminal_keymaps(term)
      local opts = { buffer = term.bufnr }
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

      -- Resize mappings
      vim.keymap.set("t", "<C-Up>", [[<Cmd>resize +2<CR>]], opts)
      vim.keymap.set("t", "<C-Down>", [[<Cmd>resize -2<CR>]], opts)
      vim.keymap.set("t", "<C-Left>", [[<Cmd>vertical resize -2<CR>]], opts)
      vim.keymap.set("t", "<C-Right>", [[<Cmd>vertical resize +2<CR>]], opts)

      -- Hide terminal mapping
      vim.api.nvim_set_keymap("t", "<C-t>", [[<Cmd>ToggleTermToggleAll<CR>]], { noremap = true, silent = true })
    end

    -- Function to create a new terminal
    local function create_terminal()
      local new_terminal = Terminal:new({
        id = next_terminal_id,
        direction = "horizontal",
        on_open = function(term)
          vim.cmd("startinsert!")
          set_terminal_keymaps(term)
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })
      next_terminal_id = next_terminal_id + 1
      return new_terminal
    end

    -- Function to open a new terminal
    function Open_new_terminal()
      local new_term = create_terminal()
      new_term:open()
    end

    -- Set up keybindings for multi-terminal management
    local wk = require("which-key")
    wk.add({
      "<leader>tn",
      "<Cmd>lua Open_new_terminal()<CR>",
      desc = "Open new toggleterm",
      icon = { icon = "", color = "blue" },
    })

    wk.add({
      "<leader>tt",
      "<Cmd>ToggleTermToggleAll<CR>",
      desc = "Toggle terminals",
      icon = { icon = "", color = "blue" },
    })

    local shell
    if OnWindows then
      shell = "pwsh.exe"
    end

    require("toggleterm").setup({
      shell = shell or vim.o.shell,
      size = function(term)
        if term.direction == "horizontal" then
          return original_height -- Use the original_height variable
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    })
  end,
}
