return {}
--[[   "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- always pull latest

  opts = {
    default = { "avante", "lsp", "path", "luasnip", "buffer" },
    auto_suggestions_provider = "openai", -- set default auto-suggestions provider
    hints = { enabled = false },
    file_selector = {
      provider = "fzf",
      provider_opts = {},
    },
    provider = 'gemini',
    providers = {
      -- Add Gemini provider (FREE!)
      gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-1.5-flash-latest",      -- or "gemini-1.5-pro-latest"
        timeout = 30000,
        api_key_name = "AVANTE_GEMINI_API_KEY", -- set this in your environment
        extra_request_body = {
          generationConfig = {
            temperature = 0.7,
            maxOutputTokens = 8192,
          },
        },
      },
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_completion_tokens = 8192,
          reasoning_effort = "medium",
        },
      },
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        timeout = 30000,
        extra_request_body = {
          options = {
            temperature = 0.75,
            num_ctx = 20480,
            keep_alive = "5m",
          },
        },
      },
      groq = {
        __inherited_from = "openai",
        api_key_name = "GROQ_API_KEY",
        endpoint = "https://api.groq.com/openai/v1/",
        model = "llama-3.3-70b-versatile",
        disable_tools = true,
        extra_request_body = {
          temperature = 1,
          max_tokens = 32768,
        },
      },
    },
  },

  build = "make", -- build from source
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua", -- optional, can still be used
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
} ]]
