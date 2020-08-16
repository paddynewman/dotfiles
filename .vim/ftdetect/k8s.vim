" Set the filetype to yaml when reading Kubernetes manifests from stdin.

function! DetectYaml()
    if search('^apiVersion: ', 'n')
        setfiletype yaml
    endif
endfunction

augroup filetypedetect
    autocmd StdinReadPost * call DetectYaml()
augroup END
