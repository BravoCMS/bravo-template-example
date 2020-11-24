
# Template schemes

## Format implemented in `settings.json`

```json
{
    "image": {
        "default": {
            "width": 2160,
            "height": 2160,
            "processing": "max"
        },
        "thumbnail": {
            "width": 730,
            "height": 480,
            "processing": "exact",
            "watermark": false,
            "blur": {
                "radius": 1,
                "sigma": 1
            },
            "quality": 85
        },
        "key": {
            "width": 640,
            "height": 480,
            "processing": "exact",
            "blur": 2,
            "quality": 75
        },
        "%key_value%": {
            "width": 2160,
            "height": 1440,
            "processing": "exact",
            "blur": 2,
            "quality": 75
        }
    }
}
```


## Description

`%key_value%` - The image processing key name, this key will be used in template itself, 'default' and 'thumbnail' key names are recommended to use in template

`%key_value%.width` - required, Image width

`%key_value%.height` - required, Image height

`%key_value%.processing` - optional, defaults to 'max', 'max' - resizing to max values(width/height) saving proportions, 'exact' - resizing and cropping to exact values(width/height)

`%key_value%.blur.radius` - optional, Gaussian blur argument, see https://legacy.imagemagick.org/Usage/blur/

`%key_value%.blur.sigma` - optional, Gaussian blur argument, see https://legacy.imagemagick.org/Usage/blur/

`%key_value%.blur` - optional, defaults to 0, can be set a scalar value for simple cases(The value=radius=sigma)

`%key_value%.quality` - optional, defaults to 90, compression quality, can be significantly extended with blur option


## Template usage

Once you have an `$object` with `$object.type` == 'photo' you can use this constructions to get the images:

For example:
```html
<img src="<{image $photo}>" /><!-- equals 'default' -->
<img src="<{image $photo 'default'}>" />
<img src="<{image $photo 'thumbnail'}>" />
<img src="<{image $photo 'key'}>" />
<img src="<{image $photo 'your-key-value'}>" />
```


[Settings](settings.md)
[Home](../index.md)
