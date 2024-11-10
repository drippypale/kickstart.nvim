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
  {
    -- This will help in navigation between tmux panes and neovim buffers
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Go to the left pane' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Go to the bottome pane' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Go to the top pane' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Go to the right pane' },
    },
  },

  {
    -- Git plugin
    'tpope/vim-fugitive',
  },

  {
    -- auto tag for html and stuff
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
    },
    opts = {},
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = '[A]dd new item to the harpoon' })
      vim.keymap.set('n', '<leader>e', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon m[e]nu' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-[>', function()
        harpoon:list():prev { ui_nav_wrap = true }
      end, { desc = 'Next harpoon item' })
      vim.keymap.set('n', '<C-]>', function()
        harpoon:list():next { ui_nav_wrap = true }
      end, { desc = 'Prev harpoon item' })
    end,
  },
}
