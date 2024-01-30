if vim.version().major < 0 or (vim.version().major == 0 and vim.version().minor < 5) then
    error('Rest.nvim requires at least nvim-0.5. Please update or uninstall')
    return
end

if vim.g.loaded_rest_nvim then
    return
end
vim.g.loaded_rest_nvim = 1



