local lualine = require('lualine')
lualine.setup({
	tabline = {
		lualine_a = {
			{
				"buffers",
				separator = { left = "", right = "" },
				right_padding = 2,
				symbols = { 
          modified = ' ●',      -- Text to show when the buffer is modified
          alternate_file = '#', -- Text to show to identify the alternate file
          directory =  '',     -- Text to show when the buffer is a directory
        },
			},
		},
	},
})

