return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "ruff-lsp",
        "rust-analyzer",
        "rustfmt",
        "typescript-language-server",
      },
    },
  },
}
