local ignored_filetypes = {
    ["neo-tree"] = true,
    ["NvimTree"] = true,
    ["aerial"] = true,
    ["trouble"] = true,
}

local function is_ignored(win)
    if not vim.api.nvim_win_is_valid(win) then return true end
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.bo[buf].filetype
    return ignored_filetypes[ft] == true
end

local function get_code_windows()
    local wins = vim.api.nvim_tabpage_list_wins(0)
    local filtered = {}
    for _, win in ipairs(wins) do
        if not is_ignored(win) then
            table.insert(filtered, win)
        end
    end
    return filtered
end

local function focus_window(direction)
    local wins = get_code_windows()
    local cur = vim.api.nvim_get_current_win()
    if is_ignored(cur) or #wins <= 1 then return end

    local index
    for i, win in ipairs(wins) do
        if win == cur then
            index = i
            break
        end
    end

    local new_index = index + direction
    if new_index < 1 then new_index = #wins end
    if new_index > #wins then new_index = 1 end

    vim.api.nvim_set_current_win(wins[new_index])
end

local function swap_window(direction)
    local wins = get_code_windows()
    local cur = vim.api.nvim_get_current_win()
    if is_ignored(cur) or #wins <= 1 then return end

    local index
    for i, win in ipairs(wins) do
        if win == cur then
            index = i
            break
        end
    end

    local new_index = index + direction
    if new_index < 1 then new_index = #wins end
    if new_index > #wins then new_index = 1 end

    local target = wins[new_index]
    local buf_cur = vim.api.nvim_win_get_buf(cur)
    local buf_target = vim.api.nvim_win_get_buf(target)

    vim.api.nvim_win_set_buf(cur, buf_target)
    vim.api.nvim_win_set_buf(target, buf_cur)
    vim.api.nvim_set_current_win(target)
end

-- Keybindings

-- Create window to the right: Ctrl + j or Ctrl + k
vim.keymap.set('n', '<C-j>', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':vsplit<CR>', { noremap = true, silent = true })

-- Swap Windows: Leader + jj / Leader + kk
-- vim.keymap.set('n', '<leader>jj', function() swap_window(-1) end, { desc = "Swap Left" })
-- vim.keymap.set('n', '<leader>kk', function() swap_window(1) end, { desc = "Swap Right" })
