vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

local function toggle_terminal()
  local terminal_buf = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'terminal' then
      terminal_buf = buf
      break
    end
  end
  
  if terminal_buf and vim.api.nvim_win_is_valid(vim.fn.bufwinid(terminal_buf)) then
    vim.cmd('bdelete! ' .. terminal_buf)
  else
    vim.cmd('botright split | resize 10 | terminal')
    vim.cmd('startinsert')
  end
end

vim.keymap.set('n', '<leader>ft', toggle_terminal, { desc = 'Toggle terminal (bottom, 10 lines)' })
