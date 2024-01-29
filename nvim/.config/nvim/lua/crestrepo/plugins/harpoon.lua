return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set which-key keymaps
    local wk = require("which-key")

    wk.register({
      h = {
        name = "Harpoon",
        m = { "<cmd>lua require('crestrepo.utils.funcs').mark_file()<CR>", "Mark file" },
        a = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle Menu" },
      },
    }, { prefix = "<leader>" })
  end,
}
