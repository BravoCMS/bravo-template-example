
# Template translation

use <{t "{text}"[ {any_params}="{value}"][ cat="js"][ json][ escape]}> tag

{text} - string, optional, html attributes assigned to the form
params - optional, the url to return customer to
cat - string, optional, text category
json - flag, use with cat attribute, returns category translations as json value
escape - flag, in case using in "quotes"

Example:

```html
<a href="<{comparison_url}>" title="<{t "some link title" escape}>">
    <{t "some link"}>
</a>
```

Example with params:

```html
<{t "Оформить заказ на {count,plural, one{# товар} few{# товара} many{# товаров} other{# товаров}} общей стоимостью {sum}" count=$articles_count sum=$order_sum}>
```

Js plugins translation:

```js
var t = function (key) {
    if (!this._codes) {
        this._codes = <{t cat="js" json}>;
    }

    if (typeof this._codes[key] === "undefined") {
        return key;
    } else {
        return this._codes[key];
    }
};

// then use texts as
console.log(t('some text'));
```


## Translation settings

settings path:
`translations[/category]/{language}.js`

[/category] - it can be `js` for using translations 

json file format:
```js
{
    "Text": "Translation",
    "Text": "Translation",
    "Text": "Translation",
    "Text": "Translation",
    "Text": "Translation",
    "Text": "Translation",
    "Контакты": "Contacts",
    "Сменить аккаунт": "Change account",
    "Редактировать регистрационные данные": "Update account info",
    "Выйти": "Sign Out",
    "Файл шаблона:": "Template file:",
    "Закрыть окно отладки": "Close debug window",
    "Открыть окно отладки": "Open debug window",
    "Работает круглосуточно": "Working around clock",
    "Расписание работы:": "Schedule:",
    "Выходной": "Holiday",
    "Телефоны:": "Phones:",
    "Факс": "Fax",
    "Мобильный": "Mobile"
}
```


[Home](../index.md)
