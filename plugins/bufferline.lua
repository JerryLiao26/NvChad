local bufferline = require("bufferline")

bufferline.setup {
    options = {    
        separator_style = "slant",
        show_close_icon = false,
        offsets = {
            {
                filetype = "NvimTree",
                padding = 1,
            }
        },
    }
}

