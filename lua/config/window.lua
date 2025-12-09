-- Treat these filetypes as non-movable sidebar windows

local opts = { noremap = true, silent = true }

local ignored_filetypes = {
    ["neo-tree"] = true,
    ["NvimTree"] = true,
    ["aerial"] = true,
    ["trouble"] = true,
}

local function is_ignored(win)
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

local function swap_window(direction)
    local wins = get_code_windows()
    local cur = vim.api.nvim_get_current_win()

    -- if current win is ignored, do nothing
    if is_ignored(cur) then return end

    -- if only one window exists -> create a vertical split
    if #wins == 1 then
        vim.cmd("vsplit")         -- create an empty place to move into
        wins = get_code_windows() -- refresh list
    end

    -- find current index
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

    -- swap buffers
    local buf_cur = vim.api.nvim_win_get_buf(cur)
    local buf_target = vim.api.nvim_win_get_buf(target)

    vim.api.nvim_win_set_buf(cur, buf_target)
    vim.api.nvim_win_set_buf(target, buf_cur)

    -- focus moved window
    vim.api.nvim_set_current_win(target)
end

-- sidebars we never enter

local function is_ignored(win)
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

-- move focus without swapping buffers
local function focus_window(direction)
    local wins = get_code_windows()
    local cur = vim.api.nvim_get_current_win()

    -- if current window is ignored, do nothing
    if is_ignored(cur) then return end

    -- if there is only 1 code window → nothing to move to
    if #wins <= 1 then
        return
    end

    -- find index of current window
    local index
    for i, win in ipairs(wins) do
        if win == cur then
            index = i
            break
        end
    end

    -- compute next index cyclically
    local new_index = index + direction
    if new_index < 1 then new_index = #wins end
    if new_index > #wins then new_index = 1 end

    vim.api.nvim_set_current_win(wins[new_index])
end

-- Keymaps
-- vim.keymap.set("n", "<D-k>", ":bnext<CR>", opts)
vim.keymap.set("n", "<D-j>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<D-k>", function() focus_window(1) end, opts)
vim.keymap.set("n", "<D-j>", function() focus_window(-1) end, opts)
vim.keymap.set("n", "<D-S-k>", function() swap_window(1) end, opts)  -- move right
vim.keymap.set("n", "<D-S-j>", function() swap_window(-1) end, opts) -- move left

