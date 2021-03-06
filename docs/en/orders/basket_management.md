
# Basket management

## Adding articles to basket

```html
<{basket_form[ id=?][ class=?][ return_url=?][ article=?][ count=?]}>

<{/basket_form}>
```

attributes:

`id`, `class` - html element attributes will be added to <form>

`return_url` - optional, defaults to current page, returns user to page after
action, can contain "#fragment" value in order to get the value by javascript
on the page

`article` - optional, object of type `catalog_article`, or use explicit html
field/'s e.g.

```html
<input type="text" name="article[`article_id`]" value="`count`" />
```

`count` - optional, defaults to 1, use 0 to remove article from basket, or use
explicit html field/'s e.g.

```html
<input type="text" name="article[`article_id`]" value="`count`" />
```


## How to display basket content

Use tag `<{get_basket "basket"}>`, variable with specified name in first attribute
will contain:

`$basket.items` - `array` of positions

`$basket.items.{article_id}.article` - catalog_article object

`$basket.items.{article_id}.count` - number of items in position

`$basket.count` - total summary of count in all positions

`$basket.subtotal.price` - `float`, subtotal price summary in system currency

`$basket.subtotal.value` - `float`, subtotal price summary in current currency

`$basket.subtotal.html` - `string`, subtotal html formatted price summary in
current currency

`$basket.address` - `array` of address if user authorized

`$basket.address.{address_id}.country`

`$basket.address.{address_id}.city`

`$basket.address.{address_id}.zip`

`$basket.address.{address_id}.street`

`$basket.address.{address_id}.number`

`$basket.address.{address_id}.apartment`

`$basket.address.{address_id}.address` - contains comment to address, or the
entire address in one field

`$basket.address.{address_id}.text` - all fields combined in one string, with
comma as separator

`$basket.phones` - `array` of phones if user authorized

`$basket.phones.{key}.number`

`$basket.payment` - `array` of payment options

`$basket.payment.{key}.name`

`$basket.delivery` - `array` of delivery options

`$basket.delivery.{delivery_id}.name`

`$basket.delivery.{delivery_id}.cost.price` - price in system value

`$basket.delivery.{delivery_id}.cost.value` - price in current currency

`$basket.delivery.{delivery_id}.cost.html` - html formatted price in current
currency

`$basket.delivery.{delivery_id}.is_show` - if it should be visible in ordering
list

`$basket.delivery.{delivery_id}.total.price` - `float`, total price summary in
system currency

`$basket.delivery.{delivery_id}.total.value` - `float`, total price summary in
current currency

`$basket.delivery.{delivery_id}.total.html` - `string`, total html formatted
price summary in current currency


[Home](../index.md)
