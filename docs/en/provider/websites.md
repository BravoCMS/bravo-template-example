
# User websites
use <{get_user_websites 'websites' 'pagination'}> tag, to get the user websites list


# Website signing into panel
use <{user_website_manage_form $website}> tag, to create form


Example:

```html
<div id="anchor">
    <{get_user "user"}>
    <{if !$user.is_guest}>
        <{get_user_websites 'websites' 'pagination'}>
        <{foreach $websites as $website}>
            <{user_website_manage_form $website}>
            <a href="<{$website.absolute_url}>" target="_blank">
                <{if $website.name}>
                    <{$website.name|htmlspecialchars}>
                <{else}>
                    No name
                <{/if}>
            </a>

            <button type="submit">
                Panel
            </button>
            <{/user_website_manage_form}>
        <{/foreach}>
    <{/if}>
</div>
```


[Provider functionality](index.md).

[Home](../index.md).
