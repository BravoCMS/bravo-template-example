
# Creating website
use <{create_site_form}> tag


Example:

```html
<{get_user "user"}>
<{if !$user.is_guest}>
    <{create_site_form}>
        <input type="text" name="name" />
        <input type="text" name="promo" />
        <button type="submit">
            Создать
        </button>
    <{/create_site_form}>
<{/if}>
```


[Provider functionality](index.md).

[Home](../index.md).
