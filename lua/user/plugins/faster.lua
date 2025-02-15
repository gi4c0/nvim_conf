return {
    'pteroctopus/faster.nvim',
    config = {
      behavior = {
        bigfile = {
          extra_patterns = {
            { pattern = "*.json", filesize = 0.5 }
          }
        }
      }
    }
}
