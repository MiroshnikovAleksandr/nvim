vim.o.showcmdloc = "statusline"
vim.o.cmdheight = 0
vim.opt.showtabline = 0
vim.o.laststatus = 3

local last_message = ""

local function capture_last_message()
    local ok, res = pcall(vim.api.nvim_exec2, "messages", { output = true })
    if ok and res and res.output and res.output ~= "" then
        local lines = vim.split(res.output, "\n", { trimempty = true })
        last_message = lines[#lines]
    end
end

vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.schedule(capture_last_message)
    end,
})

require("lualine").setup({
    options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = false,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16,
            events = {
                "WinEnter",
                "BufEnter",
                "TabEnter",
                "BufWritePost",
                "SessionLoadPost",
                "FileChangedShellPost",
                "Filetype",
                "CursorMoved",
                "CursorMovedI",
                "ModeChanged",
            },
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
            {
                require("ipynb.kernel").statusline,
                cond = require("ipynb.kernel").statusline_visible,
                color = require("ipynb.kernel").statusline_color,
            },
        },
        lualine_y = {
            function()
                return vim.api.nvim_tabpage_get_number(0) .. "/" .. #vim.api.nvim_list_tabpages()
            end,
        },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})
