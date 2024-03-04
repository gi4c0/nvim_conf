-- lazy.nvim
return {
	"robitx/gp.nvim",
  enabled = false,
	config = function()
		require("gp").setup({
      openai_api_key = {"cat", "/Users/alekseypanchenko/.chat_gpt_api_key"},
      -- chat_topic_gen_model = "gpt-4-0613",
      agents = {
        -- Disable ChatGPT 3.5
        {
          name = "ChatGPT3-5",
          chat = false,  -- just name would suffice
          command = false,   -- just name would suffice
        },
        {
          name = "ChatGPT4",
          chat = true,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "You are a general AI assistant.\n\n"
          .. "The user provided the additional info about how they would like you to respond:\n\n"
          .. "- If you're unsure don't guess and say you don't know instead.\n"
          .. "- Ask question if you need clarification to provide better answer.\n"
          .. "- Think deeply and carefully from first principles step by step.\n"
          .. "- Use Socratic method to improve your thinking and coding skills.\n"
          .. "- Don't elide any code from your output if the answer requires coding.\n"
        },
      },
    })
  end,

  keys = {
    {"<leader>jc", ':GpChatNew vsplit<CR>', silent = true},
    {"<leader>jp", ':GpChatPaste vsplit<CR>', silent = true, mode = "v"},
    {"<leader>jj", ':GpChatToggle vsplit<CR>', silent = true},
    {"<leader>jf", ':GpChatFinder<CR>', silent = true},
  }
}
