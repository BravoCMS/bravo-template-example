
Module with provided list of articles. Each article should lead to subpage. 

Default template:  `/articles.tpl`

`<{$articles}>` displays an array of all articles

if we insert in html we get `(Array)`

to work with a variable, we need to iterate through this array

### use the `foreach` method 

`<{foreach $articles as $article}>`

   `<{$article.short_name|htmlspecialchars}>`

`<{/foreach}>`

in this case we will go through the whole array and return the name of all the articles to the page.

### `$pagination` - default pagination variable

if you need to use pagination, you should:

put `misc/pagination.tpl` to the place where you want to display pagination

`<div class="row">`

   `<{include 'misc/pagination.tpl'}>`

`</div>`

next, use this design before the method `foreach`:

`<{get_blog_articles 'articles' 'pagination' by=10 by_options=[10] select='date' page_query}> `

`<{foreach $articles as $article}>`
 
   `...`

`<{/foreach}>`


[Modules](index.md).
[Home](../index.md).
