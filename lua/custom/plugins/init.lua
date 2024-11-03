-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- barber to add tabs
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      clickable = false,
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    keys = {
      { '<Tab>', '<Cmd>BufferNext<CR>', desc = 'Go to the next buffer', silent = true, noremap = true },
      { '<S-Tab>', '<Cmd>BufferPrevious<CR>', desc = 'Go to the prev buffer', silent = true, noremap = true },
      { '<leader>x', '<Cmd>BufferClose<CR>', desc = 'Close the current buffer', silent = true, noremap = true },
    },
  },
}
