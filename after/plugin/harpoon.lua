local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)

vim.keymap.set("n", "<leader>fl", function()
    local file_paths = {}
    for _, item in ipairs(harpoon:list().items) do
        table.insert(file_paths, item.value)
    end
    Snacks.picker.pick({
        title = "Working List",
        items = file_paths,
        format = "file",
        layout = "select",
        matcher = { sort_empty = true },
    })
end, { desc = "Open harpoon window" })
