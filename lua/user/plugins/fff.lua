return {
    'dmtrKovalenko/fff.nvim',
    enabled = true,
    build = 'cargo build --release',
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
    -- No need to lazy-load with lazy.nvim.
    -- This plugin initializes itself lazily.
    lazy = false,
    keys = {
        -- { "<leader>ff", function() require('fff').find_files() end, desc = 'FFFind files', }
    }
}
