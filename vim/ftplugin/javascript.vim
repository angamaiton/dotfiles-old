nmap r2i :<C-U>s/\(const\) \(\w*\)\s*=\srequire(\('.*'\))/import \2 from \3<CR>

set shiftwidth=2
set tabstop=2

let g:jsx_ext_required = 0

let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
