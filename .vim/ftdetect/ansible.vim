autocmd BufNewFile,BufRead ansible.cfg set filetype=dosini
autocmd BufNewFile,BufRead playbooks/*.yml,playbooks/*.yaml set filetype=yaml.jinja2
autocmd BufNewFile,BufRead inventory/hosts set filetype=ansible_hosts
