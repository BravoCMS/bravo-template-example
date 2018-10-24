
# Search Form

use <{search_form[ id=?][ class=?]}> tag

available fields:
q - required, query string
type - optional, string, `catalog_article` or `blog_article`
page - optional, integer, page starting from 1

Example:

<{search_form}>
    <input type="text" name="q" />
    <input type="hidden" name="type" value="blog_article" />
<{/search_form}>


## Ajax usage

You can submit form via ajax, server will respond with `jsonp` data


[Post tags](index.md)
[Home](../index.md)
