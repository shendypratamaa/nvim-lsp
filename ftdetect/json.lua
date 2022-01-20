vim.cmd([[
    augroup !jsonc
        autocmd BufNewFile,BufRead tsconfig*.json setlocal filetype=jsonc
    augroup END
]])
