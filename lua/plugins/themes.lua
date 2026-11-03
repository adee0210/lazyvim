return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        bold_keywords = false,
        italic_comments = true,

        transparent = {
          bg = false,
          float = false,
        },

        reduced_blue = true,
        bright_border = true,

        cursorline = {
          theme = "dark",
          bold = false,
          bold_number = true,
          blend = 0.85,
        },

        telescope = {
          style = "flat",
        },
      })

      vim.cmd.colorscheme("nordic")
    end,
  },
}
