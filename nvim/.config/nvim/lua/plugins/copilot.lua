local copilot = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  ft = { "go", "gomod", "lua", "python" },
  -- event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-j>",
          accept_word = false,
          accept_line = false,
          next = "<C-n>",
          prev = "<C-p>",
          dismiss = "<C-/>",
        },
      },
      -- panel = {
      --   enabled = false
      -- },
    })
  end,
}

return copilot
