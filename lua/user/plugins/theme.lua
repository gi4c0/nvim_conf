return {
    {
         'Mofiqul/vscode.nvim' ,
         config = function ()
             vim.o.background = 'dark'
         end
    },
    {
        'navarasu/onedark.nvim',
        enabled = true,
        init = function()
            require('onedark').setup {
                style = 'warmer',
                transparent = true,
                code_style = {
                    comments = 'italic',
                    keywords = 'bold',
                    -- functions = 'none',
                    -- strings = 'none',
                    -- variables = 'none'
                },
                lualine = {
                    transparent = true, -- lualine center bar transparency
                },
            }

            require('onedark').load()
        end
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                -- on_highlights = function(hl, c)
                --     local prompt = "#2d3149"
                --     hl.TelescopeNormal = {
                --         bg = c.bg_dark,
                --         fg = c.fg_dark,
                --     }
                --     hl.TelescopeBorder = {
                --         bg = c.bg_dark,
                --         fg = c.bg_dark,
                --     }
                --     hl.TelescopePromptNormal = {
                --         bg = prompt,
                --     }
                --     hl.TelescopePromptBorder = {
                --         bg = prompt,
                --         fg = prompt,
                --     }
                --     hl.TelescopePromptTitle = {
                --         bg = prompt,
                --         fg = prompt,
                --     }
                --     hl.TelescopePreviewTitle = {
                --         bg = c.bg_dark,
                --         fg = c.bg_dark,
                --     }
                --     hl.TelescopeResultsTitle = {
                --         bg = c.bg_dark,
                --         fg = c.bg_dark,
                --     }
                -- end,
            })

            vim.cmd[[colorscheme tokyonight]]
        end
    }
}
