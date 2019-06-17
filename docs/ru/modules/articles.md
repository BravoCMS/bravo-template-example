
Модуль с предоставленным списком статей. Каждая статья должна вести на подстраницу.
Шаблон по умолчанию: `/articles.tpl`

`<{$articles}>` выведет массив всех статтей 
если вставить в html получим `(Array)`

для работы с переменной нам нужно перебирать этот массив 
###используем метод `foreach`

`<{foreach $articles as $article}>`
    `$article.short_name|htmlspecialchars`
`<{/foreach}>`

в таком случае мы пройдём по всему массиву и вернём на страницу название всех статтей.

### `$pagination` - переменная пагинации по умолчанию 
если нужно использовать пагинацию вы должны:
поместить `misc/pagination.tpl` в место где хотите отображать пагинацию

`<div class="row">`
    `<{include 'misc/pagination.tpl'}>`
`</div>`

далее использовать эту конструкцию перед методом `foreach`:
`<{get_blog_articles 'articles' 'pagination' by=10 by_options=[10] select='date' page_query}> `
`<{foreach $articles as $article}>`
    `...`
`<{/foreach}>`


[Модули](index.md).
[На главную](../index.md).
