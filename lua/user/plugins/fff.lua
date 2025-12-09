return {
    'dmtrKovalenko/fff.nvim',
    enabled = false,
    lazy = false,
    build = function()
        -- this will download prebuild binary or try to use existing rustup toolchain to build from source
        -- (if you are using lazy you can use gb for rebuilding a plugin if needed)
        require("fff.download").download_binary()
    end,
    -- or if you are using nixos
    -- build = "nix run .#release",
    opts = { -- (optional)
        keymaps = {
            close = '<Esc>',
            select = '<CR>',
            select_split = '<C-s>',
            select_vsplit = '<C-v>',
            select_tab = '<C-t>',
            move_up = { '<C-k>', '<C-p>' },
            move_down = { '<C-j>', '<C-n>' },
            preview_scroll_up = '<C-u>',
            preview_scroll_down = '<C-d>',
            toggle_debug = '<F2>',
        },
        layout = {
            height = 0.8,
            width = 0.8,
            prompt_position = 'top', -- or 'top'
            preview_position = 'right', -- or 'left', 'right', 'top', 'bottom'
            preview_size = 0.5,
        },
        preview = {
            enabled = false,
        },
        debug = {
            enabled = true,     -- we expect your collaboration at least during the beta
            show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
        },
    },
    keys = {
        { "<leader>ff", function() require('fff').find_files() end, desc = 'FFFind files', }
        -- { "<C-p>", function() require('fff').find_files() end, desc = 'FFFind files', }
    }
}
