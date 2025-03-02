return {
  {
    'rktjmp/lush.nvim',
    lazy = false,
  },
  {
    'metalelf0/jellybeans-nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme jellybeans-nvim'
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'lua',
          'vim',
          'vimdoc',
          'json',
          'javascript',
          'typescript',
          'rust',
          'elm',
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.keymap.set('n', 't', ':NvimTreeToggle<cr>', { noremap = true, silent = true })
      require('nvim-tree').setup({
        reload_on_bufenter = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<C-\>]],
        direction = 'float',
        float_opts = {
          border = 'curved',
          width = function() return math.floor(vim.o.columns * 0.6) end,
          height = function() return math.floor(vim.o.lines * 0.6) end,
          winblend = 3,
        },
      })
    end,
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('barbecue').setup({
        create_autocmd = false,
      })
      vim.api.nvim_create_autocmd({
        'WinScrolled',
        'BufWinEnter',
        'CursorHold',
        'InsertLeave',
      }, {
        group = vim.api.nvim_create_augroup('barbecue.updater', {}),
        callback = function()
          require('barbecue.ui').update()
        end,
      })
    end,
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>' },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = 'quadratic',
      })
    end,
  },
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup({ n_lines = 500 })
      require('mini.surround').setup()
      
      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      statusline.section_location = function()
        return '%2l:%-2v'
      end
      
      require('mini.icons').setup()
    end,
  },
} 