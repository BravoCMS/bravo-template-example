
# Admin sections

## Format implemented in `settings.json`

```json
{
    "customization": {
        "logo_position": {
            "type": "radio",
            "name": "Position of site logo",
            "options": {
                "left": {
                    "name": "Align by left side",
                    "image": "/assets/image/scheme/orange.jpg"
                },
                "center": {
                    "name": "Align by center",
                    "image": "/assets/image/scheme/orange.jpg"
                }
            },
            "default": "left",
            "image": "/assets/image/scheme/orange.jpg"
        },
        "is_schedule": {
            "type": "checkbox",
            "name": "Show the organization schedule in the header layout",
            "default": 1,
            "image": "/assets/image/scheme/orange.jpg"
        },
        "some_color": {
            "type": "color",
            "name": "Some color for template",
            "default": "#ffffff",
            "image": "/assets/image/customization/some_color.jpg"
        },
        "some_text": {
            "type": "text",
            "name": "Some text to customize template",
            "default": "",
            "image": "/assets/image/customization/some_text.jpg"
        },
        ...
        "%key_value%": {
            "type": "radio",
            "name": "Some text to customize template",
            "default": "",
            "image": "/assets/image/customization/some_text.jpg",
            "options": {
                "%option_value%": {
                    "name": "Align by left side",
                    "image": "/assets/image/scheme/orange.jpg"
                },
                ...
            },
        }
    }
}
```


## Description

`%key_value%` - template customization variable

`%key_value%.type` - required, string(text, color, checkbox, radio), type of customization field

`%key_value%.name` - required, string, name of customization field

`%key_value%.default` - optional, string, default value for customization

`%key_value%.image` - optional, string, image/screenshot for the customization to show

`%key_value%.options` - optional, radio options for type=radio customization

`%option_value%` - value for the radio option

`%option_value%.name` - required, string, name for the customization option

`%option_value%.image` - optional, string, image/screenshot for the customization option to show


## Template usage

When template is called it contains `$template.template_customization`, which has keys you specified above in `%key_value%`

For example:
```html
<{if $template.template_customization.some_color}>
    <div class="float-right" style="background-color: <{$template.template_customization.some_color}>;">
        SC
    </div>
<{/if}>
```


[Settings](settings.md)
[Home](../index.md)
