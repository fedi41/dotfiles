return {
  "nvim-java/nvim-java",
  config = function()
    require("java").setup()
    vim.lsp.enable("jdtls")
    vim.lsp.inlay_hint.enable(false)
  end,
}
