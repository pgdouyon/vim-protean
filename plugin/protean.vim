"==============================================================================
"File:        protean.vim
"Description: Replace current word and automatically move to the next match
"Maintainer:  Pierre-Guy Douyon <pgdouyon@alum.mit.edu>
"Version:     1.0.0
"Last Change: 2015-01-12
"License:     MIT <../LICENSE>
"==============================================================================

if exists("g:loaded_protean")
    finish
endif
let g:loaded_protean = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

function! s:protean(mode)
    let @/ = s:get_protean_selection(a:mode)
    call feedkeys("cgn", "nt")
    augroup protean
        autocmd!
        autocmd InsertLeave * call <SID>protean_finish()
    augroup END
endfunction


function! s:protean_finish()
    autocmd! protean
    silent! call repeat#set("\<Plug>Protean-Repeat")
    call feedkeys("n", "m")
endfunction


function! s:protean_repeat()
    execute "normal! cgn\<C-A>\<Esc>"
    if search(@/, 'nw')
        silent! call repeat#set("\<Plug>Protean-Repeat")
        call feedkeys("n", "m")
    else
        echohl WarningMsg
        echo "[Protean]: No more matches"
        echohl None
    endif
endfunction


function! s:get_protean_selection(mode)
    if a:mode ==# "v"
        let save_unnamed = @@
        normal! gvy
        let selection = '\V' . escape(@@, '\')
        let @@ = save_unnamed
    else
        let selection = '\V\<' . escape(expand('<cword>'), '\') . '\>'
    endif
    return selection
endfunction

nnoremap <Plug>Protean-Repeat  :call <SID>protean_repeat()<CR>
nnoremap <Plug>Protean-Replace :call <SID>protean("n")<CR>
xnoremap <Plug>Protean-Replace :call <SID>protean("v")<CR>

if !hasmapto("<Plug>Protean-Replace", "nv")
    nmap gr <Plug>Protean-Replace
    xmap gr <Plug>Protean-Replace
endif

let &cpoptions = s:save_cpo
unlet s:save_cpo
