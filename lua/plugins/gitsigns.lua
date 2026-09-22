-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git [c]hange', buf = bufnr })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git [c]hange', buf = bufnr })

    -- Actions
    -- visual mode
    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk', buf = bufnr })
    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [r]eset hunk', buf = bufnr })
    -- normal mode
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk', buf = bufnr })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk', buf = bufnr })
    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer', buf = bufnr })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer', buf = bufnr })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk', buf = bufnr })
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'git preview hunk [i]nline', buf = bufnr })
    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'git [b]lame line', buf = bufnr })
    map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index', buf = bufnr })
    map('n', '<leader>hD', function() gitsigns.diffthis '~' end, { desc = 'git [D]iff against last commit', buf = bufnr })
    map('n', '<leader>hQ', function() gitsigns.setqflist 'all' end, { desc = 'git hunk [Q]uickfix list (all files in repo)', buf = bufnr })
    map('n', '<leader>hq', gitsigns.setqflist, { desc = 'git hunk [q]uickfix list (all changes in this file)', buf = bufnr })
    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line', buf = bufnr })
    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[T]oggle git intra-line [w]ord diff', buf = bufnr })

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'text object [i]nside [h]unk', buf = bufnr })
  end,
}
