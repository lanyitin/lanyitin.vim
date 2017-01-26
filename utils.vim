function! HasFont(name) 
    if has("win32")
        return 0
    endif
    if !executable("fc-list")
        return 0
    endif

    let fonts = system("fc-list --format '%{family}\n' | grep " . a:name)
    let l = strlen(fonts)
    if l == 0 
        return 0
    else 
        return 1
    endif
endfunction


function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

function! FindDuplicates()
    /^\(.*\)\n\ze\%(.*\n\)*\1$
endfunction
command! -register FindDuplicates call FindDuplicates()
