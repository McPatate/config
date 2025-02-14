return {
  {
    "llm.nvim",
    dev = true,
    enabled = false,
    opts = {
      backend = "huggingface",
      model = "google/codegemma-7b",
      fim = {
        enabled = true,
        prefix = "<|fim_prefix|>",
        middle = "<|fim_middle|>",
        suffix = "<|fim_suffix|>",
      },
      accept_keymap = "<M-i>",
      dismiss_keymap = "<M-I>",
      lsp = {
        bin_path = "/Users/mcpotato/Documents/work/llm-ls/target/release/llm-ls",
        -- host = "localhost",
        -- port = "4242",
      },
      tokenizer = {
        repository = "google/codegemma-7b",
      },
      tokens_to_clear = { "<eos>" },
    }
  }
}
