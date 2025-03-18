require("config.lazy")
vim.cmd([[colorscheme tokyonight]])
require("config.keymaps")
require("config.autocmds")
require("config.options")
require("scripts.clipboard")
require("scripts.toggle_quickfix")
require("scripts.yank_buffer_path")
require("scripts.grep_in_neotree_dir")
require("scripts.telescope_path_insert")
require("scripts.lazygit_terminal")
require("scripts.swap_true_false_keywords")
