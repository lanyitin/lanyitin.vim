function! HasFont(name) 
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
