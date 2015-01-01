if exists('g:loaded_syntastic_vim_vint_checker')
    finish
endif
let g:loaded_syntastic_vim_vint_checker = 1

if !exists('g:syntastic_vim_vint_sort')
    let g:syntastic_vim_vint_sort = 1
endif

let s:save_cpo = &cpoptions
set cpoptions&vim

function! g:SyntaxCheckers_vim_vint_IsAvailable() dict
    return executable(self.getExec())
endfunction

function! g:SyntaxCheckers_vim_vint_GetLocList() dict
    let makeprg = self.makeprgBuild({})
    let errorformat = '%W%f:%l:%c: %m%Z'

    return g:SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'vim',
            \ 'name': 'vint',
            \ 'exec': 'vint' })

let &cpoptions = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
