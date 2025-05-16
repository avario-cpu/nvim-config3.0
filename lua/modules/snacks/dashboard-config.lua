local terms_width = 60
local top_padding = 8
M = {
  enabled = vim.fn.has("win32") == 0 and true, -- Loads slowly on WN_NT but not on WSL
  width = 42,
  preset = {
    keys = {
      {
        icon = "🧠",
        key = "s",
        desc = "Smart Find",
        action = function()
          vim.cmd("lua Snacks.picker.smart()")
        end,
      },
      {
        icon = "📁",
        key = "f",
        desc = "Find File",
        action = function()
          vim.cmd("lua Snacks.picker.files()")
        end,
      },
      {
        icon = "🔤",
        key = "/",
        desc = "Find Word",
        action = function()
          vim.cmd("lua Snacks.picker.grep()")
        end,
      },
      {
        icon = "⌚",
        key = "r",
        desc = "Recent Files",
        action = function()
          vim.cmd("lua Snacks.picker.recent()")
        end,
      },
      {
        icon = "💾",
        key = "S",
        desc = "Restore Session",
        section = "session",
      },
      {
        icon = "💤",
        key = "l",
        desc = "Open Lazy",
        action = function()
          vim.cmd("Lazy")
        end,
      },
      {
        icon = { "󰊢 ", hl = "DevIconGitLogo" },
        key = "g",
        desc = "Open LazyGit",
        action = function()
          vim.cmd("lua StartLazygit()")
        end,
      },
      {
        icon = { "󱕖 ", hl = "DevIcon3gp" },
        -- icon = "🗑",
        key = "d",
        desc = "Delete Shada Temp Files",
        enabled = vim.fn.has("win32") == 0,
        action = function()
          require("scripts.delete-temp-shadas").Delete_shada_temp_files()
        end,
      },
      {
        icon = { "✖️", hl = "DevIconAstro" },
        key = "q",
        desc = "Quit Neovim",
        action = function()
          vim.cmd("quit")
        end,
      },
    },
  },
  formats = {
    header = { "%s", align = "left", hl = "@annotation" }, -- Add the hl property here
  },
  sections = {
    -- { pane = 1, padding = 0 },
    {
      pane = 1,
      header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠈⢆⠀⠠⠀⠄⡐⢀⠂⠔⠠⠒⡐⠢⠑⡌⠦⠱⢌⠦⠹⣿⣿⣿⢿⣟⢋⡏⠢⠑⠌⡐⢢⠐⡀⠀⢆⠰⡀⢂⠄⣼⢯⡟⣭⢏⣗⡣⢿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠐⠀⠀⠀⠀⠄⠂⠀⠀⢀⠈⢆⠀⠁⠂⠐⠀⠊⠌⠡⠑⡈⢡⠉⡔⡡⢍⠢⡜⣀⢿⣿⣿⢿⣽⣼⠃⢆⣉⠒⡌⠄⠢⢀⠁⠎⡐⠌⡀⡼⣷⣟⡷⢱⢫⠶⣩⠎⢻⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡄⠂⡐⠈⠄⡡⠈⠔⠡⡘⠄⢣⠘⡰⣉⠖⡱⢌⡌⡽⣿⣿⣾⡿⢈⠆⡤⢃⠜⡨⢐⡀⠌⢂⠁⢀⣜⣾⡿⣾⡽⡯⣫⠞⠁⠀⠈⠻⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⢀⠀⠠⠐⠀⠀⡀⠀⠁⠀⡐⠀⡁⠂⠄⡑⡈⠔⠠⡉⠆⡡⢑⠢⡙⠔⠣⡐⠹⡽⣿⣻⣇⢶⣒⣂⠬⢔⢁⣄⠐⠨⡀⢬⢾⣾⣿⡟⠟⠉⠊⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡇⠀⠀⠀⠀⠀⠀
⠂⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⢀⠂⢀⠐⡀⠆⡑⠌⢈⣥⢖⠇⣹⡿⡻⣝⢍⣭⠻⢛⣴⣿⣿⡶⠷⣖⡇⣿⡟⠕⠈⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢀⠀⠠⠀⢄⠢⠐⡐⠂⣠⡾⣫⡾⠁⣢⢗⢡⠞⢡⡿⢑⠐⣾⣿⡼⣿⣿⣤⣧⢯⡩⣷⣶⡀⠈⡀⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀Have you heard⠀⠁ ⠀⠀⠀⠀⠈⠀⢂⠁⣠⣾⣯⣾⡟⣡⣼⣎⠣⠡⢬⡏⠀⠢⢀⣿⣿⣿⣿⣿⣿⣿⢠⠱⢹⣿⣻⡀⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
of our lord and savior.. ⢀⣾⣹⢟⣫⣪⢪⣿⣿⡟⠠⢂⣟⣶⣶⣶⢸⣿⣿⣿⣿⣿⣿⣿⣧⠌⣸⣿⣿⡇⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀ daddy primeagen ?    ⠀⣪⠟⢕⢕⣽⡇⣿⣿⡟⡀⠖⡞⣾⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⢹⠀⠉⡿⡿⡟⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢐⡼⢃⣴⣿⣿⣿⣸⣿⣿⢁⡜⢹⢙⣿⢿⡿⡇⣿⣿⣿⣿⣿⣿⣿⡏⢸⢠⠀⢷⡏⣧⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠜⢁⣼⣿⡇⣿⣧⣿⣿⠇⢀⡄⡞⡾⠿⡾⠗⠁⢿⣿⣸⣿⣿⣿⡿⢁⣼⡼⣆⢸⡇⣿⢸⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⣻⢿⣿⠃⣿⣿⣿⣿⢠⣻⡇⡇⣤⣤⣤⣤⣤⢸⣇⡿⣿⣿⡿⠃⡾⡿⣷⣧⢸⡇⣿⡿⣿⣢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⣠⣾⠿⣛⣵⣸⡗⣽⣀⣿⣿⣿⣇⣿⠿⡇⢿⢛⡯⢯⢙⣿⠼⣼⢃⣿⡿⠡⣵⢰⠇⠿⡻⢸⡇⣿⢧⣿⣯⡓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⣼⠏⣱⠟⣋⠥⡉⢿⢸⡇⢹⣿⣿⠨⠉⠁⠀⠀⠀⠁⠢⣽⡿⣳⠏⣾⢟⣮⡽⠏⢯⣾⣷⣖⢸⢹⣿⣼⡿⣻⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢅⡚⡱⠸⠤⢓⡩⠌⡇⣿⠀⣿⡏⣦⡠⣌⢦⡀⡄⣿⣀⣽⡳⡋⢾⣷⡱⠁⠈⣉⠈⠈⠽⡿⢸⣿⣳⣿⢣⢓⢮⣳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠈⢅⠚⠬⠣⠝⠰⠘⢹⡄⢸⢏⡟⣷⣩⠿⣗⣾⣿⣿⣿⣾⣿⣶⣿⡇⡄⢉⡀⣿⡄⠀⠀⠿⣳⠟⣝⢏⢿⣆⢛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⠐⠢⠝⢮⡑⣀⠐⣅⣌⢻⢤⣿⣿⣶⣿⣿⣿⣿⣿⣏⡾⠷⣿⣿⣷⣚⡾⢟⡥⠂⣸⡷⣡⡶⠋⢂⠎⡻⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢴⣺⠁⡷⢦⡈⠐⠣⢙⠠⠆⠈⠛⠙⣷⣼⢿⣿⣿⣿⣿⣿⣿⣿⣹⣯⣿⣿⣿⣇⣸⣾⠃⡰⣫⡾⠛⠀⠘⡌⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢎⡐⢪⠅⡘⠤⡓⣌⠱⡈⠧⢁⡊⡄⠀⠘⣿⣥⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⠊⠐⠑⠉⠀⠁⣈⣄⡬⣂⣶⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⡔⢡⠜⢡⠒⠜⢰⠂⡀⢰⠸⡈⠄⡓⠀⢈⢻⣿⣿⣿⣿⣶⣴⡼⡋⣸⣿⣿⣿⣗⠏⠀⠀⠀⠡⢀⡜⠦⡘⢄⣾⣿⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⡁⠘⢁⠩⢊⠄⢋⠀⠄⠒⡡⢊⡜⠁⠈⣷⣜⠻⣿⣿⣿⣷⣷⣿⣿⣿⡿⠋⢁⣀⠘⠦⡀⢠⡚⢌⠶⠱⡛⠭⣈⡼⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⡿⡇⠒⡄⡀⠁⢊⠀⠆⠀⠑⠈⠁⠀⠀⠀⣽⣿⣷⣌⠉⠿⣿⡿⠟⡋⠁⠀⠐⡄⢦⡡⡑⢠⠃⡰⢉⠒⠌⠐⢈⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠫⢌⢃⢄⠫⢐⢢⠄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠙⢳⣿⣿⠗⠂⠀⠀⠀⠀⠀⡚⢤⢈⠲⡑⠆⠀⢀⡁⡤⠆⠠⡠⠴⠿⠷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢌⠢⢌⠳⣈⠣⢊⠠⠀⣈⠂⡁⠄⠀⠀⠀⠀⠂⢶⠠⠬⠀⠀⠀⠀⠀⠀⠀⠘⠠⠋⠰⠈⣠⠒⣱⣴⡿⢟⣧⠀⠀⠀⠐⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣑⠨⠑⠌⢒⠉⠄⠂⢠⠐⠡⠀⠀⠀⠀⠀⠀⢸⢸⡇⠀⠀⠀⠀⠀⠀⡀⢠⠂⡄⠀⡤⣡⣞⡿⣫⣾⣿⡏⠀⠀⠄⠀⠠⠐⠈⢀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⡋⢄⡀⢁⠄⠀⠂⠀⠀⠌⠀⠀⠀⠀⢀⠀⠀⡏⡌⢃⠀⠀⠀⠀⠀⡔⡘⠤⡘⠀⢸⢰⡿⢩⣺⠿⠛⠉⠐⢪⣷⠀⠀⠀⠠⠁⡀⠀⠄⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⠣⢃⡒⡄⡚⢄⠒⠀⠀⠠⠀⡀⠀⠀⠀⠀⠀⢀⡌⢦⡮⣣⡆⠀⠀⠀⠀⠘⠱⣢⢠⡁⢈⠈⠐⣫⢀⣄⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠄⠀⠠⠀⠂⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⠖⡰⣁⠊⡌⠢⠀⢄⠡⠂⡔⠀⠀⠀⠀⣠⣼⣿⣿⣟⣿⣿⣦⡀⠀⠀⠀⠉⢀⠙⠲⠀⢠⡾⣵⣿⣿⣣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⠡⠂⡡⠐⠈⠘⡠⠂⠒⠀⠀⠀⣠⣾⣿⣿⣿⣿⣯⣿⣿⣿⣷⣤⡀⢀⣤⣬⣔⠄⣰⣿⡾⣿⣿⢣⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⠀⠂⠁⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢂⠆⠢⠁⡀⠂⠀⣁⡄⠀⠀⢀⣤⣾⢿⣿⣿⣿⣿⣿⣿⣿⢿⣻⣽⣶⡞⣞⡟⣿⣿⣗⣏⣞⣽⣿⠇⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⡀⠱⠁⠀⣀⣶⣾⠋⢀⡴⣟⣛⣛⣉⣻⢿⣿⣿⡿⣻⣵⡏⣵⣿⣿⣿⣮⣺⢿⣻⣯⣿⡞⣏⣵⢷⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀
⣛⡿⣦⡀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡁⠂⣜⣵⡿⣃⣤⣾⣿⣿⣿⣿⣟⣿⣷⣝⡗⣿⢯⣾⣝⣿⣿⣿⣿⣿⣿⣿⣶⡅⢾⣬⡙⠿⣾⠁⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢻⣹⢾⣹⡖⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠉⢺⠙⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣹⠃⣿⡿⣸⣿⣿⣉⢻⣿⣿⡿⣿⣏⠛⡸⡙⠳⡟⣾⣷⠀⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠈⠙⣎⡟⡹⠎⣄⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⡏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢇⣾⣿⣱⣿⣿⣿⣿⣦⡹⢋⣴⣿⣿⣦⣇⠸⣷⣷⡜⢹⠇⠀⠀⠀⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣻⣽⣻⣵⣆⢿⢼⣄⠀⠀⠀⠀⠀⠀⢀⢞⣽⣿⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡾⢻⣻⣿⣿⣿⣿⣿⣿⣵⣿⢿⣿⣿⣿⣿⣷⣯⡫⠇⠜⠀⠀⠀⠁⡀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣷⡽⡾⠽⢊⣟⢣⠂⠻⡄⠀⠀⠀⠄⣰⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣾⣷⢴⣿⣿⣿⣿⣿⣯⣾⣿⣿⣷⡙⣿⣿⣿⣿⣿⣷⡌⢸⡷⣄⠀⠐⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠤⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠈⠀⠀⠀⠱⡀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡻⣿⣿⣽⣿⡿⣿⣿⣿⣿⣿⣳⣿⣿⢿⣿⣿⢿⣟⣿⣿⣿⣿⣿⣷⢸⣿⣻⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀⠰⢠⠓⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡐⢰⢟⣟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣿⡃⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣻⣿⣿⣮⢪⣿⣿⣿⣿⣿⠈⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠧⢩⠐⠀⠀⠀⠀⠀⣼
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⣿⠿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣳⠅⣞⢿⢸⣿⣿⣿⢿⣿⣿⣿⣿⣏⠽⢎⣿⣿⢉⡞⣿⢳⣿⢣⠐⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⢸⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣟⣾⣿⣽⣿⣾⣿⣿⣿⣿⣯⡿⣿⣿⡿⣟⣯⣾⣿⠀⢋⣷⢘⣽⣿⣿⣾⣿⣿⣿⡟⣯⠰⣌⠥⢺⣼⣯⣷⣪⣷⡿⠀⣸⡇⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠙
⠐⠀⠀⠄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⢻⣻⣽⣿⣿⣿⢻⣿⣿⢯⣷⣿⣿⣿⣟⡇⢠⡌⣿⢸⣿⣟⡇⣿⣿⣿⣿⣷⣮⣷⣸⣾⣿⢋⣵⣼⡿⣽⠃⠀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣟⠳⢝⡾⣹⠿⣟⡏⣿⣿⣿⣯⢿⣿⣷⠿⠝⣰⢿⢣⠜⠉⣿⣿⡇⣿⣿⣾⣾⣿⣟⣴⣾⣿⢃⣾⣿⡟⣜⠂⠀⣲⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢠⡾⡁⢠⠄⠀⠀⠀⠈
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⡽⢟⣶⣾⣿⡿⣽⣿⣿⣿⣿⡜⣿⠯⠁⠐⣯⢟⢠⣛⣧⠘⢻⣧⢿⣿⣿⣿⣿⣿⣿⡿⢡⣾⣿⡿⠘⠀⠠⢀⠃⡇⠀⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠰⣿⡖⠀⣎⠞⡱⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⠝⡻⢷⣕⡿⣿⣯⣽⠯⠅⠉⠀⡴⠻⣠⡻⡴⡍⣪⣾⣦⡌⠊⠟⢵⣿⣿⡿⣫⣴⠿⠟⠋⠀⠀⠀⠀⠂⠀⣯⠀⠀⠀⠀⠀⠀⠉⠒⠒⠀⠄⠀⠙⠗⠀⠈⠘⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠈⠀⠀⠀⠀⠀⡩⢺⣟⡿⢆⡰⢯⣟⡾⣟⣴⣏⡲⣄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢩⢓⠯⢏⣮⡗⢮⠹⣫⣞⡿⣾⣹⠴⣱⠀⠀⠀⠀⠀⠀⠄⠀⣤⡀⠀⠀⠀⠣⠀⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⠀⠀⠀⠀⢀⠡⠲⣍⡱⡿⢨⢺⣬⣚⡽⢇⣮⠷⣧⠷⠀⠀⠀⠀⠉⠀⠎⡟⠔⣠⣶⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣶⣶⣶⡤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢠⠀⠀⠈⡤⠑⣏⡶⢠⢁⠿⣼⡳⣱⡶⣭⣋⡝⡵⡅⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢀⢧⠀⠀⢘⢭⠕⢎⠣⣽⣏⠴⣁⠾⣽⣿⡟⢣⡾⡬⡃⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⡀⠄⠀⠸⣯⡄⠀⢸⠎⢚⢦⡹⢿⣿⠀⣼⣻⢯⡘⢵⣿⣟⣳⡇⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⣀⣀⣀⠀⠂⠀⡀⢂⠐⠀⠠⠀⠀⠐⠠⢀⠂⡀⠄⠂⢠⢸⣳⢇⠀⠈⡏⠖⢮⣷⣤⠫⢴⣯⣟⢫⣾⣮⣻⢾⣿⠂⠀⠀⠀⣰⣿⢹⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣷⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢰⣾⣿⣿⢃⠀⠂⡀⠄⠠⠀⠈⠀⢀⢀⠢⠥⠶⠲⠔⣈⠠⢃⢆⢫⣟⠀⠀⢹⢫⣌⠞⣵⣽⣦⠹⣣⣿⣿⣿⣟⡇⣑⠇⠀⠀⢰⡿⣿⠸⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⡿⠽⠂⠄⠀⠰⣤⣤⣤⣥⣄⡥⣈⣂⡑⡈⠆⠱⠈⠆⣨⠓⣎⢧⢞⣧⠀⠘⢧⠏⢬⠹⡿⣿⢣⣮⡙⢿⣿⢟⣼⢿⠀⠀⢀⣿⣟⣯⣿⣿⣿⣟⣯⣵⣾⣿⣽⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣯⣽⣳⢶⣦⣄⡬⢙⡻⢿⣿⣷⣵⡿⣽⢞⡶⢦⣄⡀⢫⣌⢻⢦⡵⡃⠀⠈⢸⢫⣗⡝⢣⣟⣿⢿⣳⢋⡺⣻⣿⠀⢀⢻⡯⡕⣿⣾⠯⢋⣡⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠑⠒
⣿⣿⣿⣿⣿⣟⣛⣿⣿⣷⣼⡀⢹⢿⣿⣿⣝⢯⣟⣿⣺⠽⣖⣄⠋⢾⡱⣛⡄⠀⢋⠳⡞⢍⢷⡍⠿⣻⢣⡿⣟⣮⠅⠀⡼⣯⠋⡼⣓⣥⡾⣣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠁⠸⣿⣿⡌⣿⢼⣹⠻⣡⢌⠣⡀⠁⢃⠸⡀⠈⠇⠙⠘⣏⡜⡤⠁⠿⣹⠟⡘⠀⢠⡼⠃⣠⢼⢋⣹⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠘⣿⣷⣿⢺⣼⣱⢣⣎⣧⡑⣴⡀⢠⢡⠀⠀⢃⡌⠀⣏⢠⣧⡆⡀⢺⠃⢀⠋⠀⣆⣼⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⡄⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣭⣽⣿⣿⣿⣯⣽⣿⣻⣿⣿⣿⣇⠀⢙⢏⡿⣯⢾⣽⣳⡞⣾⡹⢶⡹⢦⡱⢣⠀⠘⣿⡦⡲⡿⢎⣾⣿⡗⠀⠈⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⢇⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣻⡀⠀⢻⡽⣯⣟⣾⣳⣟⣷⣻⢧⣻⣕⣎⡄⢧⠀⣘⢽⡟⣤⡻⣿⣿⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢶⡸⣄⠀⠀⠀⠀⠀
⣿⣿⣟⣿⣿⣿⣻⠿⣿⣿⡿⣫⡟⣾⡳⣧⠀⠘⣻⢷⣻⣞⣷⣻⢾⡽⣯⢷⣛⣮⢽⡢⡅⠘⡆⡼⢿⣿⣗⢄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣸⡁⣿⣦⠢⡐⡰⢺
⣿⣿⣿⣿⣿⣿⣿⣿⡿⣣⡶⡭⡌⢷⡽⣳⠄⠀⢯⣟⣳⣟⡾⣭⣟⢾⣹⣎⣳⣌⢦⡣⡜⡀⠙⠱⡱⢪⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢧⣿⡁⠡⣈⠀⠀⠀⠈
⡻⣝⠛⣛⣻⢭⠟⢆⡞⣧⢟⡵⡃⢯⣝⣧⡇⠀⢸⡞⣷⣫⣽⣳⣞⢯⡷⣞⡵⣞⢧⡳⡹⡐⠤⠀⣵⠿⠛⠋⠉⠩⠭⠭⢉⠝⣛⡻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡾⣷⡁⠂⠄⠀⢀⡴⣐
⠳⠌⠢⠐⠆⣋⢲⢣⡝⣬⢋⠺⠡⣻⡜⣶⠃⠀⢰⣟⣷⣻⣞⡷⣯⢟⡾⣵⢻⡜⣧⢳⠱⡡⢊⠞⣡⣴⣾⣯⣿⣿⣿⣿⣿⣶⣾⣕⡣⢌⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣳⣟⡧⠂⠀⠀⢴⣭⡞⠽
⢤⠤⡤⢤⣌⡔⢋⠲⠙⢦⢫⡍⡔⣧⢻⡜⠃⠀⣾⡽⣞⡷⣯⣟⡾⢯⣟⡞⣷⡹⢖⡣⢣⢑⣴⣫⣾⣿⣫⣿⣿⣿⣿⡿⣵⣿⣿⣿⣿⣷⣦⡁⠊⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⢷⣻⢾⡑⠀⠀⠀⡀⠉⠙⡲
⢏⠾⣙⠷⣺⡜⣯⢲⡈⡁⠇⢰⡸⡕⣏⠎⠀⡨⣗⣯⢟⣽⣳⢾⡽⣛⣮⡝⡶⣙⠎⡴⢡⡾⣽⣿⣿⣿⣿⣿⣿⣿⡟⣼⣿⣿⣿⣿⡟⣾⣿⣿⣆⠁⠙⢿⣿⣿⣿⣿⣿⣿⣿⣷⢯⡟⢹⢣⠀⢀⣤⡔⠀⠁⠀⠀
⢆⢫⡙⢮⡱⣚⠥⣏⠳⣆⠈⠢⢱⠹⠌⠀⡰⡝⠾⣜⢯⡞⣵⣛⠾⣝⠶⣙⠲⡁⢎⣰⣟⣾⣿⣿⣿⣿⣿⣿⣿⡿⣼⣿⣿⣿⣿⣟⢼⣿⣿⣿⣿⣷⡀⠐⣻⣿⣿⣿⣿⣿⢿⣽⣻⠀⡩⠃⠀⠙⢿⣿⠀⠀⠀⠀
⢎⡱⡜⢤⡡⣙⠚⡬⢳⢌⡱⠀⠁⠀⢠⠜⡲⣍⠻⣬⢳⡹⢲⡍⣛⡌⠣⠁⠃⢀⣰⡿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡿⣼⣷⣝⢿⣿⣿⣿⣧⠀⠐⣽⣿⣿⢿⣯⢿⣞⡷⠀⠁⠀⠀⠀⠘⠃⠀⠀⠀⠀
⠈⠖⢩⠦⡱⢌⡱⠰⡁⠎⢠⠁⠀⠈⠀⠙⠰⠡⠋⠔⠣⠑⠣⠘⠀⠀⠀⠀⢀⢰⡿⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⡿⣿⣿⣷⡻⣿⣿⣿⡇⠀⢻⣽⢯⣿⣾⣟⡾⠃⣴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀
]],
    },
    { pane = 2, padding = top_padding },
    {
      pane = 2,
      header = [[
   ███╗   ██╗██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██║   ██║██║████╗ ████║
   ██╔██╗ ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                                ..Baby 😎
]],
      padding = 1,
      width = 25,
    },
    { pane = 2, section = "keys", gap = 1, padding = 2, width = 15 },
    -- { pane = 2, padding = 2 },
    {
      pane = 2,
      icon = "📂",
      width = 25,
      title = "Recent Files",
      section = "recent_files",
      cwd = true,
      indent = 2,
      padding = 1,
    },
    { pane = 2, section = "startup" },
    { pane = 4, padding = top_padding },
    {
      pane = 4,
      section = "terminal",
      cmd = "colorscript -e square",
      height = 5,
      width = terms_width,
      padding = 1,
    },
    {
      pane = 4,
      icon = " ",
      desc = "Browse Repo on GitHub",
      padding = 1,
      key = "B",
      enabled = function()
        vim.cmd(":setlocal scrolloff=0")
        return Snacks.git.get_root() ~= nil
      end,
      action = function()
        Snacks.gitbrowse()
      end,
    },
    {
      pane = 4,
      icon = "󰊢",
      desc = "Not in a Git Repo",
      enabled = function()
        return Snacks.git.get_root() == nil
      end,
    },
    function()
      local in_git = Snacks.git.get_root() ~= nil

      -- Function to get command output, count lines, and add ellipsis if needed
      local function process_cmd(cmd, max_height, check_empty)
        local handle = io.popen(cmd)
        if not handle then
          return cmd, math.max(1, max_height)
        end
        local result = handle:read("*a")
        handle:close()

        -- Check if result is empty (just whitespace) when check_empty is true
        if check_empty and (result == "" or result:match("^%s*$")) then
          return "echo ' None 💃'", 1
        end

        local lines = {}
        for line in string.gmatch(result, "[^\r\n]+") do
          table.insert(lines, line)
        end
        local line_count = #lines
        local display_height = math.max(1, math.min(line_count, max_height))

        if line_count > max_height then
          local modified_cmd
          if cmd:find("|") then
            modified_cmd = cmd .. " | head -n " .. (max_height - 1) .. ' && echo "..."'
          else
            modified_cmd = cmd .. " | head -n " .. (max_height - 1) .. ' && echo "..."'
          end
          return modified_cmd, display_height
        else
          return cmd, display_height
        end
      end

      local function get_platform_specific_untracked_cmd()
        local is_windows = package.config:sub(1, 1) == "\\"

        if is_windows then
          -- Windows approach using PowerShell
          return "git status --porcelain | findstr \"^??\" | powershell -Command \"$input | ForEach-Object { $_ -replace '^??', '$([char]0x1b)[35m??$([char]0x1b)[0m' }\""
        else
          -- Unix approach using tput
          return 'git status --porcelain | grep "^??" | sed "s/^??/$(tput setaf 5)??$(tput sgr0)/"'
        end
      end

      local untracked_cmd, untracked_height = process_cmd(get_platform_specific_untracked_cmd(), 10, true)
      local diff_cmd, diff_height = process_cmd("git --no-pager diff --stat -B -M -C", 20, true)

      -- local untracked_cmd, untracked_height = process_cmd('git status --porcelain | grep "^??"', 10)

      local cmds = {
        {
          icon = " ",
          title = "Git Changed Files",
          cmd = diff_cmd,
          height = diff_height,
          hl_pattern = {},
        },
        {
          icon = " ",
          title = "Git Untracked Files",
          cmd = untracked_cmd,
          height = untracked_height,
        },
      }

      return vim.tbl_map(function(cmd)
        return vim.tbl_extend("force", {
          pane = 4,
          section = "terminal",
          enabled = in_git,
          padding = 1,
          width = terms_width,
          ttl = 5 * 60,
          indent = 3,
        }, cmd)
      end, cmds)
    end,
  },
}

return M
