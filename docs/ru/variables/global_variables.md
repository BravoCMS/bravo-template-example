
# Глобальные переменные инициализируются во всех (страницах, тегах) шаблонов

Вы всегда можете посмотреть все свойства переменой используя `<{$prop|debug_print_var}>`

## `$site` - глобальные настройки сайта

`$site.name` - `string` название компании, которую представляет сайт

`$site.date_founded` - `integer` год основания компании

`$site.home_url` - `string` url к домашней странице

`$site.url_part` - `string` языковая часть для URL



### `$site.logo` - информация о настройках логотипа

`$site.logo.type` - `string` или "image" или "text" значение, представляет тип логотипа

`$site.logo.text` - `string` текстовое значение логотипа для отображения на странице

`$site.logo.text_font` - `string` имя шрифта значение логотипа для отображения на странице

`$site.logo.text_size` - `integer` размер шрифта в `px` 

`$site.logo.text_color` - `string` выбранный цвет CSS для отображения например `#e645e6`

`$site.logo.image` - `string` URL изображения для отображения в качестве логотипа



### `$site.languages` - языки доступны на сайте
### `$site.active_language` - в настоящее время активный язык

`$site.languages['id'].language_id`

`$site.active_language.language_id` - идентификатор языка в системе

`$site.languages['id'].name`

`$site.active_language.name` - название языка для отображения пользователю

`$site.languages['id'].page_url`

`$site.active_language.page_url` - URL текущей страницы на языке


### `$site.currencies` - языки доступны на сайте
### `$site.active_currency` - в настоящее время активный язык


## `$customer` - текущие глобальные  данные о пользователях

`$customer.is_guest` - `bool`, истина, если пользователь вошел

`$customer.display_name` - `string`, имя пользователя

`$customer.image` - `string`, расположение аватара пользователя


## `$is_web_admin` - `bool` перешел ли пользователь из админ-панели и должен увидеть инструменты управления


[На главную](../index.md).
