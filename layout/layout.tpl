
<{extends 'layout/html.tpl'}>

<{block name=title}>

<{/block}>

<{block name=favicon}>
    <{if $site.favicon}>
        <link rel="shortcut icon" href="<{$site.favicon}>" />
    <{else}>
        <link rel="shortcut icon" href="<{file 'assets/favicon.ico'}>" />
    <{/if}>
<{/block}>

<{block name="head"}>
    <{custom_code "head_open"}>

    <{strip}>
        <script type="text/javascript">
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

            t.text = function (key) {
                return t(key);
            };

            var URL = "<{$site.url_part|escape}>";
        </script>
    <{/strip}>

    <link href="<{file 'assets/node_modules/bootstrap/dist/css/bootstrap.min.css'}>" rel="stylesheet" type="text/css" />
    <link href="<{file 'assets/css/style.css'}>" rel="stylesheet" type="text/css" />

    <{if $template.scheme == 'orange'}>
        <link href="<{file 'assets/css/scheme/orange.css'}>" rel="stylesheet" type="text/css" />
    <{elseif $template.scheme == 'blue'}>
        <link href="<{file 'assets/css/scheme/blue.css'}>" rel="stylesheet" type="text/css" />
    <{else}>
        <{* red(default) *}>
        <link href="<{file 'assets/css/scheme/red.css'}>" rel="stylesheet" type="text/css" />
    <{/if}>

    <meta name="csrf-param" content="<{csrf_param}>" />
    <meta name="csrf-token" content="<{csrf_token}>" />

    <script>
        var cpAppLanguageCode = "<{$site.active_language.iso_name|escape}>";
        <{if $site.active_language.iso_name == 'en'}>
        var cpAppTinyMCELanguage = '';
        <{elseif $site.active_language.iso_name == 'uk'}>
        var cpAppTinyMCELanguage = "<{file "assets/node_modules/tinymce-i18n/langs/" dir absolute}>uk_UA.js";
        <{elseif $site.active_language.iso_name == 'fr'}>
        var cpAppTinyMCELanguage = "<{file "assets/node_modules/tinymce-i18n/langs/" dir absolute}>fr_FR.js";
        <{elseif $site.active_language.iso_name == 'ge'}>
        var cpAppTinyMCELanguage = "<{file "assets/node_modules/tinymce-i18n/langs/" dir absolute}>ka_GE.js";
        <{else}>
        var cpAppTinyMCELanguage = "<{file "assets/node_modules/tinymce-i18n/langs/" dir absolute}><{$site.active_language.iso_name|escape}>.js";
        <{/if}>
    </script>

    <script type="text/javascript" src="<{file 'assets/node_modules/requirejs/require.js'}>"></script>
    <script type="text/javascript">
        require.config({
            baseUrl: "<{file 'assets' dir}>",
            paths: {
                "app": "js/script",
                "jquery": "node_modules/jquery/dist/jquery.min",
                "jquery-ui": "node_modules/jquery-ui-dist/jquery-ui.min",
                "js-cookie": "node_modules/js-cookie/src/js.cookie",
                "bootstrap": "node_modules/bootstrap/dist/js/bootstrap.bundle.min",
                "ajaxButton": "node_modules/@bravocms/ajax-button/dist/js/ajax-button",
                "timer": "node_modules/@bravocms/timer/timer",
                "autosaving": "node_modules/@bravocms/autosaving/autosaving",
                "fileManager": "node_modules/@bravocms/file-manager/manager",
                "languageSelector": "node_modules/@bravocms/language-selector/jquery.language-selector",
                "gmaps": "http://maps.google.com/maps/api/js?v=3&sensor=false&key=<{apikey_gmaps}>"
            }
        });

        require(['app']);

        <{if $is_web_admin}>
        require(['js/web-admin']);
        <{/if}>
    </script>

    <meta name="js-recaptcha-key" id="js-recaptcha-key" content="<{$site.grecaptcha_key|escape}>" />
    <{*script type="text/javascript" id="js-recaptcha-script" data-key="6LfYxmQUAAAAADIWG18LmQx4gwQSnLUuFtJd67go" src="https://www.google.com/recaptcha/api.js?render=6LfYxmQUAAAAADIWG18LmQx4gwQSnLUuFtJd67go"></script*}>

    <{if $site.languages|count > 1}>
        <{foreach $site.languages as $language}>
            <{if $language.language_id != $site.active_language.language_id}>
                <link rel="alternate" hreflang="<{$language.iso_name}>" href="<{$language.alternate_url}>" />
            <{/if}>
        <{/foreach}>
    <{/if}>

    <{custom_code "head_close"}>
<{/block}>

<{block name="body"}>
    <{custom_code "body_open"}>

    <{get_contacts "layout_contacts"}>
    <{get_basket "layout_basket"}>

    <div class="container">
        <{if $user.is_developer}>
            <div class="alert alert-dark" role="alert">
                <{t "Файл шаблона:"}>
                <strong>
                    <{block name="template-name"}>
                        /layout.tpl
                    <{/block}>

                    <a href="<{$user.developer_templates}>">
                        <{t "Select developer directory"}>
                        <{if $template.developer_folder}>
                            (<{$template.developer_folder}>)
                        <{else}>
                            (Default template)
                        <{/if}>
                    </a>
                </strong>

                <{if $smarty.get.template_debug === '1'}>
                    <a href="?" class="btn btn-sm btn-info float-right">
                        <{t "Закрыть окно отладки"}>
                    </a>

                    <{debug}>
                <{else}>
                    <a href="?template_debug=1" class="btn btn-sm btn-info float-right">
                        <{t "Открыть окно отладки"}>
                    </a>
                <{/if}>

                <{if $template.template_customization.some_color}>
                    <div class="float-right" style="background-color: <{$template.template_customization.some_color}>;">
                        SC
                    </div>
                <{/if}>

                <div class="template-scheme-marker float-right">
                    Sch
                </div>
            </div>
        <{/if}>

        <{custom_code "site_header"}>

        <div class="row">
            <{if $template.template_customization.is_schedule == 1}>
                <div class="col">
                    <{if $layout_contacts.contact.24h_work === '1'}>
                        <div>
                            <span class="badge badge-secondary">
                                <{t "Работает круглосуточно"}>
                            </span>
                        </div>
                    <{else}>
                        <{t "Расписание работы:"}>

                        <{foreach $layout_contacts.contact.schedule as $daySchedule}>
                            <div>
                                <{if $daySchedule.day_from === $daySchedule.day_to}>
                                    <{$daySchedule.day_to}>:
                                <{else}>
                                    <{$daySchedule.day_from}>-<{$daySchedule.day_to}>:
                                <{/if}>

                                <span>
                                    <{if $daySchedule.holiday === '1'}>
                                        <{t "Выходной"}>
                                    <{else}>
                                        <{$daySchedule.time_from_h}><sup>:<{$daySchedule.time_from_m}></sup>-<{$daySchedule.time_to_h}><sup>:<{$daySchedule.time_to_m}></sup>
                                    <{/if}>
                                </span>
                            </div>
                        <{/foreach}>
                    <{/if}>
                </div>

                <div class="col">
                    <{t "Телефоны:"}>

                    <{foreach $layout_contacts.phones as $phone}>
                        <a href="tel:<{$phone.number|strip_tags|trim|escape}>">
                            <{$phone.number}>
                        </a>

                        <{if $phone.fax === 'Y'}>
                            <span class="badge badge-secondary">
                                <{t "Факс"}>
                            </span>
                        <{/if}>

                        <{if $phone.mobile === 'Y'}>
                            <span class="badge badge-secondary">
                                <{t "Мобильный"}>
                            </span>
                        <{/if}>
                    <{/foreach}>
                </div>

                <div class="col">
                    <{if $layout_contacts.page}>
                        <a href="<{$layout_contacts.page.href}>" title="<{$layout_contacts.page.title|escape}>">
                            <{t "Контакты"}>
                        </a>
                    <{/if}>
                </div>
            <{/if}>

            <div class="col">
                <{if $customer.is_guest}>
                    <a href="<{account_sign_in_url lastauth}>">
                        <{t "Войти"}>
                    </a>
                    <a href="<{account_sign_in_url authclient='facebook'}>">
                        <{t "Войти FB"}>
                    </a>
                    <a href="<{account_sign_in_url authclient='google'}>">
                        <{t "Войти G+"}>
                    </a>
                    <a href="<{account_sign_in_url authclient='twitter'}>">
                        <{t "Войти TW"}>
                    </a>
                <{else}>
                    <a href="<{account_url}>">
                        <{if $customer.image}>
                            <img src="<{$customer.image}>" width="50" class="img-thumbnail" />
                        <{/if}>

                        <{$customer.display_name|htmlspecialchars}>
                    </a>
                <{/if}>
            </div>

            <div class="col">
                <{if $layout_basket.items|count}>
                    <a href="#basket-modal" data-toggle="modal" data-target="#basket-modal">
                        <{t "В корзине {count} товаров на {total}" count=$layout_basket.count total=$layout_basket.subtotal.html}>
                    </a>
                <{/if}>
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand h1<{if $template.template_customization.logo_position == 'center'}> logo-center<{else}> logo-left<{/if}>" href="<{$site.home_url}>">
                <{if $site.logo.type === 'image'}>
                    <img src="<{$site.logo.image}>" />
                <{else}>
                    <span style="<{if $site.logo.text_color}>color:<{$site.logo.text_color}>;<{/if}><{if $site.logo.text_size}>font-size:<{$site.logo.text_size}>px;<{/if}><{if $site.logo.text_font}>font-family:'<{$site.logo.text_font|escape}>';<{/if}>">
                        <{$site.logo.text|htmlspecialchars}>
                    </span>
                <{/if}>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#top-menu-content" aria-controls="top-menu-content" aria-expanded="false" aria-label="Toggle top menu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="top-menu-content">
                <{get_menu "top" "top_menu"}>

                <{if $top_menu.0|count}>
                    <ul class="navbar-nav mr-auto">
                        <{foreach $top_menu.0 as $page}>
                            <li class="nav-item<{if $page.is_active}> active<{/if}>">
                                <a class="nav-link" href="<{$page.href}>">
                                    <{$page.page_name|htmlspecialchars}>
                                </a>
                            </li>
                        <{/foreach}>
                    </ul>
                <{/if}>

                <{if $site.languages|count > 1}>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="languages-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <{$site.active_language.name|htmlspecialchars}>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="languages-dropdown">
                            <{foreach $site.languages as $language}>
                                <a class="dropdown-item<{if $language.language_id == $site.active_language.language_id}> active<{/if}>" href="<{$language.page_url}>">
                                    <{$language.name|htmlspecialchars}>
                                </a>
                            <{/foreach}>
                        </div>
                    </div>
                <{/if}>

                <{get_currency "currencies" "active_currency"}>
                <{if $currencies|count > 1}>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="currencies-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <{$active_currency.name|htmlspecialchars}>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="currencies-dropdown">
                            <{foreach $currencies as $currency}>
                                <a class="dropdown-item<{if $currency.id == $active_currency.id}> active<{/if}>" href="<{$site.url_part|escape}>ajax/select_currency/" data-method="POST" data-post="id=<{$currency.id}>" data-refresh="1">
                                    <{$currency.name|htmlspecialchars}>
                                </a>
                            <{/foreach}>
                        </div>
                    </div>
                <{/if}>

                <{search_form class="form-inline my-2 my-lg-0 js-search-form"}>
                <script>
                    require(['jquery'], function ($) {
                        $('.js-search-form-input').on('keyup', function (e) {
                            if ($(this).val().trim().length > 2) {
                                $.ajax({
                                    url: $('.js-search-form').attr('action'),
                                    method: $('.js-search-form').attr('method'),
                                    data: {
                                        q: $(this).val()
                    <{* page: 1, // Можно подгруждать список, подставляя 2, 3, 4... *}>
                                    },
                                    dataType: 'jsonp',
                                    success: function (data) {
                    <{* Осталось вывести элементы *}>
                                        console.log(data.items);
                                        console.log(data.pagination);
                                    }
                                });
                            }
                        });
                    });
                </script>

                <input type="search" name="q" value="<{$smarty.get.q|escape}>" class="form-control mr-sm-2 js-search-form-input" placeholder="Поиск">
                <button type="submit" class="btn btn-outline-success my-2 my-sm-0">
                    <{t 'Search'}>
                </button>
                <{/search_form}>
            </div>
        </nav>

        <{get_menu "catalog" "catalog_menu"}>
        <{if $catalog_menu|count}>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="navbar-brand h1">
                    <{t "Catalog_menu"}>
                </div>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#catalog-menu-content" aria-controls="catalog-menu-content" aria-expanded="false" aria-label="Toggle catalog menu">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="catalog-menu-content">
                    <ul class="navbar-nav mr-auto">
                        <{foreach $catalog_menu as $rubric_type}>
                            <li class="nav-item<{if $rubric_type.is_active || $rubric_type.is_active_ancestor}> active<{/if}>">
                                <div class="btn-group<{if $rubric_type.is_active || $rubric_type.is_active_ancestor}> active<{/if}>">
                                    <a class="btn btn-link nav-link" href="<{$rubric_type.relative_url}>" title="<{$rubric_type.name|escape}>">
                                        <{$rubric_type.short_name|htmlspecialchars}>
                                    </a>

                                    <{if $rubric_type.children}>
                                        <a class="btn btn-link dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="sr-only">Toggle Dropdown</span>
                                        </a>

                                        <div class="dropdown-menu">
                                            <{foreach $rubric_type.children as $rubric}>
                                                <a class="dropdown-item<{if $rubric.is_active || $rubric.is_active_ancestor}> active<{/if}>" href="<{$rubric.relative_url}>" title="<{$rubric.name|escape}>">
                                                    <{$rubric.short_name|htmlspecialchars}>
                                                </a>

                                                <{if $rubric.children}>
                                                    <{foreach $rubric.children as $category}>
                                                        <a class="dropdown-item<{if $category.is_active || $category.is_active_ancestor}> active<{/if}>" href="<{$category.relative_url}>" title="<{$category.name|escape}>">
                                                            -
                                                            <{$category.short_name|htmlspecialchars}>
                                                        </a>
                                                    <{/foreach}>

                                                    <{if !$rubric@last}>
                                                        <div class="dropdown-divider"></div>
                                                    <{/if}>
                                                <{/if}>
                                            <{/foreach}>
                                        </div>
                                    <{/if}>
                                </div>
                            </li>
                        <{/foreach}>
                    </ul>
                </div>
            </nav>
        <{/if}>

        <{get_breadcrumbs "breadcrumbs" element=$module}>
        <{if $module && $breadcrumbs|count}>
            <nav>
                <ol class="breadcrumb">
                    <{foreach $breadcrumbs as $item}>
                        <li class="breadcrumb-item">
                            <a href="<{$item.relative_url}>">
                                <{$item.short_name|htmlspecialchars}>
                            </a>
                        </li>
                    <{/foreach}>
                    <li class="breadcrumb-item active" aria-current="page">
                        <{$module.short_name|htmlspecialchars}>
                    </li>
                </ol>
            </nav>
        <{/if}>

        <{block name="module"}>
        <{/block}>

        <{custom_code "footer"}>

        <footer class="footer">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <{get_menu "bottom" "bottom_menu"}>

                <{if $bottom_menu.0|count}>
                    <ul class="navbar-nav mr-auto">
                        <{foreach $bottom_menu.0 as $page}>
                            <li class="nav-item<{if $page.is_active}> active<{/if}>">
                                <a class="nav-link" href="<{$page.href}>">
                                    <{$page.page_name|htmlspecialchars}>
                                </a>
                            </li>
                        <{/foreach}>
                    </ul>
                <{/if}>
            </nav>

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="navbar-brand">
                    <{$site.name|htmlspecialchars}>
                    ©
                    <{if $site.date_founded}>
                        <{$site.date_founded}>
                        -
                    <{/if}>
                    <{0|as_date:"Y"}>
                </div>

                <ul class="navbar-nav">
                    <li class="nav-item">
                        <{powered_by 'store'}>
                    </li>
                    <li class="nav-item">
                        <{powered_by 'site'}>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#create-site-modal" data-toggle="modal" data-target="#create-site-modal">
                            <{t 'I_want_the_same_site'}>
                        </a>
                    </li>
                </ul>
            </nav>

            <{custom_code "counters"}>
        </footer>
    </div>

    <{if $layout_basket.items|count}>
        <div class="modal" role="dialog" id="basket-modal">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><{t 'Your_cart'}></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <{foreach $layout_basket.items as $item}>
                            <div class="row js-basket-item">
                                <div class="col-lg-4">
                                    <{if $item.article.cover}>
                                        <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">
                                            <img src="<{$item.article.cover.photo_file_small}>" style="width: 100%;" />
                                        </a>
                                    <{/if}>
                                </div>
                                <div class="col-lg-4">
                                    <{basket_form return_url="#basket-modal" class="js-basket-item-form form-inline"}>
                                    <div class="input-group">
                                        <input type="text" name="article[<{$item.article.id}>]" class="form-control js-basket-item-count" style="width:50px;" value="<{$item.count}>" />
                                        <label class="input-group-text">
                                            X <{$item.article.price.html}>
                                        </label>
                                        <button type="submit" class="btn btn-outline-success">
                                            ОК
                                        </button>
                                    </div>
                                    <{/basket_form}>

                                    <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">
                                        <{$item.article.short_name|htmlspecialchars}>
                                    </a>
                                </div>
                                <div class="col-lg-4">
                                    <{$item.summary.html}>

                                    <button type="button" class="close js-basket-item-delete">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                            </div>
                        <{/foreach}>

                        <div class="row">
                            <div class="col-lg-4">
                                <{t "Всего {count,plural, one{# товар} few{# товара} many{# товаров} other{# товаров}}" count=$layout_basket.count}>
                            </div>
                            <div class="col-lg-4">
                            </div>
                            <div class="col-lg-4">
                                <{$layout_basket.subtotal.html}>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <a href="<{order_url}>" class="btn btn-primary">
                            <{t "Оформить заказ на {count,plural, one{# товар} few{# товара} many{# товаров} other{# товаров}} общей стоимостью {sum}" count=$layout_basket.count sum=$layout_basket.subtotal.html}>
                        </a>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                            <{t 'Continue_shopping'}>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    <{/if}>

    <{get_user "user"}>
    <div class="modal" role="dialog" id="create-site-modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><{t 'I_want_the_same_site'}></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <{if $user.is_guest}>
                        <{t "Для начала"}>
                        <a href="<{user_sign_in_url return_url='#create-site-modal'}>">
                            <{t "авторизуйтесь"}>
                        </a>
                    <{else}>
                        <p>
                            <{if $user.image}>
                                <img src="<{$user.image|htmlspecialchars}>" width="50" class="img-thumbnail">
                            <{/if}>
                            <{$user.display_name|htmlspecialchars}>

                            <a href="<{user_update_url return_url='#create-site-modal'}>">
                                <{t "Edit"}>
                            </a>
                            <a href="<{user_sign_in_url return_url='#create-site-modal' auth}>">
                                <{t "Change"}>
                            </a>
                            <a href="<{user_sign_out_url return_url='#create-site-modal'}>">
                                <{t "Выйти"}>
                            </a>
                        </p>

                        <{get_user_websites 'websites' 'pagination'}>
                        <{if $websites}>
                            <p>
                                <{t "Your_sites"}>:<br />
                                <{foreach $websites as $website}>
                                    <{user_website_manage_form $website}>
                                    <a href="<{$website.absolute_url}>" target="_blank">
                                        <{if $website.name}>
                                            <{$website.name|htmlspecialchars}>
                                        <{else}>
                                            <{t "Untitled"}>
                                        <{/if}>
                                    </a>

                                    <button type="submit">
                                        <{t 'To_admin_panel'}>
                                    </button>
                                    <{/user_website_manage_form}>
                                <{/foreach}>
                            </p>
                        <{/if}>

                        <{create_site_form id='create-site-form'}>
                        <input type="text" name="name" class="form-control" placeholder="<{t "Как назовем Ваш новый сайт?"}>" />

                        <button type="submit" class="btn btn-primary" data-target="#create-site-form">
                            <{t "Создать сайт"}>
                        </button>
                        <{/create_site_form}>
                    <{/if}>
                </div>

                <div class="modal-footer">
                    <{if $user.is_guest}>
                        <a class="btn btn-primary" href="<{user_sign_in_url return_url='#create-site-modal'}>">
                            <{t "Авторизоваться"}>
                        </a>
                    <{/if}>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <{t "Закрыть"}>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <{custom_code "body_close"}>
<{/block}>
