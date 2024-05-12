-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- general
lvim.log.level = "info"
lvim.format_on_save.enabled = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- other general
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

-- keymappings [view all the defaults by pressing <leader>Lk]
-- keymappings [view all the keymappings by pressing <leader>sk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-z>"] = ":set wrap!<cr>"


-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["t"] = {
    name = "Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    f = { "<cmd>TroubleToggle lsp_definitions<cr>", "definitions" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["m"] = {
    name = "MarkDown",
    p = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" },
    s = { "<cmd>MarkdownPreviewStop<cr>", "Markdown Preview Stop" },
    t = { "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview Toggle" },
}

-- TODO: User Config for predefined plugins
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.nvimtree.setup.update_focused_file.enable = true
-- lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = true
-- lvim.builtin.nvimtree.setup.respect_buf_cwd = true

lvim.builtin.telescope.theme = "ivy"
-- Show previewer when searching git files with default <leader>f
lvim.builtin.which_key.mappings["f"] = {
    require("lvim.core.telescope.custom-finders").find_project_files,
    "Find File"
}
-- Show previewer when searching buffers with <leader>bf
lvim.builtin.which_key.mappings.b.f = {
    "<cmd>Telescope buffers<cr>",
    "Find"
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true



-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    { command = "flake8", filetypes = { "python" }, extra_args = { '--max-line-length', '88', "--extend-ignore", "E203" } },
}

-- Additional Plugins
lvim.plugins = {
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "arcticicestudio/nord-vim",
    },
    { "nvim-lua/plenary.nvim" },
    { "mfussenegger/nvim-dap" },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = { "fugitive" }
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        -- see: ~/.config/lvim/plugin/neotest.lua
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "mfussenegger/nvim-dap-python" },
    { "nvim-neotest/neotest-python" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc", "*.md" },
    -- enable wrap mode for json files only
    command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require("nvim-treesitter.highlight").attach(0, "bash")
    end,
})


-- rustaceanvim see: https://github.com/mrcjkb/rustaceanvim
-- see: ~/.config/lvim/after/ftplugin/rust.lua
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {
        -- executor = 'toggleterm'
        --
        -- codelens see: https://github.com/LunarVim/starter.lvim/blob/rust-ide/config.lua
        on_initialized = function()
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                pattern = { "*.rs" },
                callback = function()
                    local _, _ = pcall(vim.lsp.codelens.refresh)
                end,
            })
        end,
    },
    -- LSP configuration
    server = {
        on_attach = function(client, bufnr)
            -- you can also put keymaps in here
        end,
        default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
                -- enable clippy on save
                cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    runBuildScripts = true,
                },
                checkOnSave = {
                    allFeatures = true,
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                },
                procMacro = {
                    enable = true,
                    ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" },
                    },
                },
            },
        },
    },
    -- DAP configuration
    dap = {
        adapter = {
            type = "executable",
            -- ln -s $(brew --prefix)/opt/llvm/bin/lldb-dap $(brew --prefix)/bin/
            command = "lldb-dap",
            name = "rt_lldb",
        },
    },
}


-- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
    return server ~= "pylsp"
end, lvim.lsp.automatic_configuration.skipped_servers)
