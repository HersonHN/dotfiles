
add-highlighter global/ number-lines
add-highlighter global/ wrap

colorscheme palenight

hook global InsertCompletionShow .* %{
  map window insert <tab> <c-n>
  map window insert <s-tab> <c-p>
}
