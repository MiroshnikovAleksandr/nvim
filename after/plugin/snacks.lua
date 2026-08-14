require("snacks").setup({
    picker = {
        enabled = true,
        sources = {
            explorer = {
                hidden = true,
                ignored = true,
                layout = { preview = "main" },
                jump = { close = true },
                actions = {
                    explorer_enter = function(picker, item, action)
                        if picker.input.filter.meta.searching then
                            return "confirm"
                        end
                        if item and item.dir then
                            picker:set_cwd(item.file)
                            picker:find()
                        else
                            require("snacks.picker.actions").jump(picker, item, action)
                        end
                    end,
                },
                win = {
                    list = {
                        keys = {
                            ["<CR>"] = "explorer_enter",
                        },
                    },
                },
            },
        },
    },
    explorer = {
        enabled = true,
        replace_netrw = true,
        trash = true,
    },
    image = {
        enabled = true,
        formats = {
            "png",
            "jpg",
            "jpeg",
            "gif",
            "bmp",
            "webp",
            "tiff",
            "heic",
            "avif",
            "pdf",
            "icns",
        },
        doc = { enabled = true },
        convert = { notify = true },
    },
})

require("patch_util").apply_patch("patches/snacks.patch", "snacks.nvim")

local map = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { desc = desc })
end

-- find
map("<leader>ff", function() Snacks.picker.files() end, "Find files")
map("<leader>fg", function() Snacks.picker.grep() end, "Ripgrep")
map("<leader>fo", function() Snacks.picker.recent() end, "Recent files")
map("<leader>fb", function() Snacks.picker.buffers() end, "Buffers")
map("<leader>fi", function()
    Snacks.picker.files({ cwd = "~/.config/nvim/" })
end, "Find files in nvim config")

-- grep
map("<leader>fs", function() Snacks.picker.grep_word() end, "Grep word under cursor")
map("<leader>fc", function()
    Snacks.picker.grep({ word = vim.fn.expand("%:t:r") })
end, "Grep current file base name")

-- lists
map("<leader>fq", function() Snacks.picker.qflist() end, "Quickfix list")
map("<leader>fh", function() Snacks.picker.help() end, "Help tags")
map("<leader>fm", function() Snacks.picker.man() end, "Man pages")

-- diagnostics
map("<leader>fe", function() Snacks.picker.diagnostics() end, "Diagnostics")

-- explorer
map("<leader>fr", function() Snacks.explorer.reveal() end, "Reveal file in explorer")

-- image
map("<leader>i", function() Snacks.image.hover() end, "Preview image at cursor")
