local M = {}

M.config = function()
  local status_ok, hop = pcall(require, "hop")
  if not status_ok then
    return
  end
  hop.setup()
  vim.api.nvim_set_keymap("", "M", ":HopWord<cr>", { silent = true })
  vim.api.nvim_set_keymap("", "<C-m>", ":HopChar2<cr>", { silent = true })
end

return M
