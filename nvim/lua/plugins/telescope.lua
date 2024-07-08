return {
  -- init.lua:
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      pickers = {
        find_files = {
          theme = 'dropdown',
        },
        colorscheme = {
          enable_preview = true,
        },
      },
    },
  },
}
