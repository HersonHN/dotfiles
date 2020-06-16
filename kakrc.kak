
add-highlighter global/ number-lines
add-highlighter global/ wrap
add-highlighter global/ show-whitespaces

colorscheme palenight

### Tabulate with spaces

map global insert <tab> '<a-;><gt>'
map global insert <s-tab> '<a-;><lt>'
#map global user p ': fzf-mode <ret>'


### Autocomplete on TAB

hook global InsertCompletionShow .* %{
    try %{
        # this command temporarily removes cursors preceded by whitespace;
        # if there are no cursors left, it raises an error, does not
        # continue to execute the mapping commands, and the error is eaten
        # by the `try` command so no warning appears.
        execute-keys -draft 'h<a-K>\h<ret>'
        map window insert <tab> <c-n>
        map window insert <s-tab> <c-p>
    }
}

hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}



### Load plug.kak

source "%val{config}/plugins/plug.kak/rc/plug.kak"

plug "andreyorst/fzf.kak" config %{
    map -docstring 'fzf mode' global user p ': fzf-mode<ret>'
} defer "fzf" %{
    set-option global fzf_preview_width '65%'
    set-option global fzf_project_use_tilda true
    evaluate-commands %sh{
        if [ -n "$(command -v fd)" ]; then
            echo "set-option global fzf_file_command %{fd . --type f --follow --hidden --exclude .git --exclude .svn}"
        else
            echo "set-option global fzf_file_command %{find . \( -path '*/.svn*' -o -path '*/.git*' \) -prune -o -type f -follow -print}"
        fi
        [ -n "$(command -v bat)" ] && echo "set-option global fzf_highlight_command bat"
        [ -n "${kak_opt_grepcmd}" ] && echo "set-option global fzf_sk_grep_command %{${kak_opt_grepcmd}}"
    }
}
