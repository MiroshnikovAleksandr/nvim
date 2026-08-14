local ipynb = require("ipynb")

ipynb:setup({
    kernel = {
        auto_connect = true,  -- Auto-connect to kernel on notebook open
        show_status = true,    -- Show kernel status in statusline
        python_path = nil,     -- Custom Python path (otherwise auto-discovered)
    },
})

vim.keymap.set("n", "<C-CR>", "<cmd>silent! NotebookExecuteCell<CR>", { silent = true })
vim.keymap.set("n", "<leader>ks", "<cmd>silent! NotebookKernelStart<CR>", { silent = true })
