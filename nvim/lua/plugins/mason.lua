return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
        "pyright",
        "ruff",
        "ruff-lsp",
        "rust-analyzer",
        "rustfmt",
        "terraform-ls",
        "typescript-language-server",
      },
    },
  },
}
