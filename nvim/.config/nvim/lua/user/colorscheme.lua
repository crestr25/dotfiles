require('onedark').setup {
    style = 'darker',
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    diagnostics = {
        darker = true,
    }
}

require('onedark').load()
