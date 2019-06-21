
# Module with provided list of articles. Each article should lead to subpage. 
Default template:  `/articles.tpl`

## `<{$articles}>` displays an array of all articles

if we insert in html we get `(Array)`, to work with a variable, we need to iterate through this array

### First you need to get the elements, and then you can use them from the variable

`<{get_blog_articles 'articles' 'pagination' by="12" page_query}>` - getting elements

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


[Modules](index.md).

[Home](../index.md).
