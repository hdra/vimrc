local lualine = require('lualine')
local navic = require("nvim-navic")

lualine.setup({
	tabline = {
		lualine_a = {
			{
				"buffers",
        show_filename_only = false,
				separator = { left = "", right = "" },
				right_padding = 0,
				symbols = { 
          modified = ' ●',      -- Text to show when the buffer is modified
          alternate_file = '#', -- Text to show to identify the alternate file
          directory =  '',     -- Text to show when the buffer is a directory
        },
			},
		},
    lualine_z = {
        { navic.get_location, cond = function() 
            return navic.is_available() and vim.bo.filetype ~= 'svelte' and vim.bo.filetype ~= 'elixir'
          end 
        },
    }
	},
})

