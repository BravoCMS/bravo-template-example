
# Using ftp structure to develop templates

In case you are authorized front-end developer, you will be provided with ftp access to your test environment.

Create separate folders for different templates, then you will be able to view them.

Template should be provided with `settings.json`


## Folder selection

`$user.developer_templates` - variable provide address to access list of options, can be used as regular link to page or ajax json/jsonp request

ensure the user is developer, not a guest or customer:

```html
<{if $user.is_developer}>
    ... yuor html/js code etc <{$bar.developer_templates}> ...
<{/if}>
```

## AJAX implementation

In case you are requesting url with ajax, server will provide data:

```json
{
    "options": {
        "dafault": {
            "id": "",
            "base": "developer folder",
            "folder": "your custom folder",
            "post_url": "relative url",
            "is_active": "bool, if this option active now"
        },
        "key": "option",
        "key": "option",
        "key": "option",
        "key": "option"
    },
    "post": {
        "key": "data",
        "key": "data",
        "key": "data"
    }
}
```


`options.default` - default site template, set in panel

`options.key` - list of folders you created on ftp/s you have access to

`options.key.base` - base directory you have ftp access to, in case you have multiple ftps

`options.key.folder` - directory name you created

`options.key.post_url` - relative url you should POST request to, in case to change template to

`options.key.is_active` - bool, is this option active now

`options.post` - data you should provide to POST request


[Home](../index.md)
