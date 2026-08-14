-- OPTIONS
local set = vim.opt

--line nums
set.relativenumber = true
set.number = true

-- indentation and tabs
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true

-- search settings
set.ignorecase = true
set.smartcase = true

-- remove vertical column
set.colorcolumn = ""

-- appearance
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

-- cursor line
set.cursorline = true

-- clipboard
set.clipboard:append("unnamedplus")

-- backspace
set.backspace = "indent,eol,start"

-- split windows
set.splitbelow = true
set.splitright = true

-- dw/diw/ciw works on full-word
set.iskeyword:append("-")

-- keep cursor at least 8 rows from top/bot
set.scrolloff = 8

-- undo dir settings
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- incremental search
set.incsearch = true

-- faster cursor hold
set.updatetime = 50

-- auto-read on external change
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    group = vim.api.nvim_create_augroup("autoread", { clear = true }),
    callback = function()
        if vim.o.autoread then vim.cmd("checktime") end
    end,
})
