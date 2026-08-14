require("nvim-highlight-colors").setup({})
require("ultimate-autopair").setup()
require("rainbow-delimiters.setup").setup({})
if string.find(os.getenv("TERM"), "kitty") then
    require("kitty-scrollback").setup({ myconfig = { kitty_get_text = { ansi = false, }, } })
end
