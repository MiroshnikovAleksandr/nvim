plugin_srcs = {
    "ajbucci/ipynb.nvim",
    "hiphish/rainbow-delimiters.nvim",
    { "altermo/ultimate-autopair.nvim", branch = "v0.6" },
    "tpope/vim-surround",
    "folke/snacks.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    { "ThePrimeagen/harpoon", branch = "harpoon2" },
    "folke/tokyonight.nvim",
    "rose-pine/neovim",
    "nvim-lualine/lualine.nvim",
    "brenoprata10/nvim-highlight-colors",
    "tpope/vim-fugitive",
    "mbbill/undotree",
    "ojroques/vim-oscyank",
    "captbaritone/better-indent-support-for-php-with-html",
    { "nvim-treesitter/nvim-treesitter", branch = "main" },
    { "nvim-treesitter/nvim-treesitter-context", branch = "main" },
}

if string.find(os.getenv("TERM"), "kitty") then
    table.insert(plugin_srcs, "mikesmithgh/kitty-scrollback.nvim"
)
end

return plugin_srcs
