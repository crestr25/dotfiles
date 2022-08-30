-- Find more schemas here: https://www.schemastore.org/json/
local schemas = {
  {
    description = "The Jenkinsfile",
    fileMatch = { "Jenkinsfile", "jenkinsfile" },
    url = "https://jenkins-x.io/schemas/jx-schema.json",
  },
}

local opts = {
  settings = {
    json = {
      schemas = schemas,
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

return opts
