local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.smartindent     = true
vim.opt.expandtab       = true
vim.opt.tabstop         = 4
vim.opt.shiftwidth      = 4
vim.opt.softtabstop     = 4

vim.opt.ignorecase      = true
vim.opt.smartcase       = true

vim.opt.number          = true
vim.opt.numberwidth     = 2

vim.opt.cursorline      = true
vim.opt.cursorcolumn    = true

vim.opt.splitbelow      = true
vim.opt.splitright      = true

vim.opt.list            = true
vim.opt.listchars       = 'tab:>-,trail:-,extends:#,nbsp:*'

vim.opt.mouse           = 'a'
vim.opt.undofile        = true
vim.opt.termguicolors   = true
vim.opt.wrap            = false
vim.opt.scrolloff       = 5
vim.opt.timeoutlen      = 300
vim.opt.signcolumn      = 'yes'
vim.opt.clipboard       = 'unnamedplus'

vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', { desc = 'no highlight' })

require('lazy').setup({{
    'nvim-telescope/telescope.nvim',
    keys = {{
        '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Find File',
    }, {
        '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'Find Buffer',
    }, {
        '<leader>rg', '<cmd>Telescope live_grep<CR>', desc = 'Live Grep',
    }, {
        '<leader>fr', '<cmd>Telescope resume<CR>', desc = 'Resume Search',
    }},
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
}, {
    'folke/tokyonight.nvim',
    config = function()
        vim.cmd([[colorscheme tokyonight]])
    end,
}, {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
}, {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { 'i', 's', }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { 'i', 's', }),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            },
            sources = {
                { name = 'buffer' },
                { name = 'path' },
            },
        })
    end,
}})
