<{extends 'layout/html.tpl'}><{block name=title}><{/block}><{block name=favicon}>    <link rel="shortcut icon" href="<{file 'assets/favicon.ico'}>" /><{/block}><{block name="head"}>    <{custom_code "head_open"}>    <{strip}>        <script type="text/javascript">            var t = function (key) {                if (!this._codes) {                    this._codes = <{t cat="js" json}>;                }                if (typeof this._codes[key] === "undefined") {                    return key;                } else {                    return this._codes[key];                }            };            var URL = "<{$site.url_part|escape}>";        </script>    <{/strip}>    <link href="<{file 'assets/plugins/bootstrap4/css/bootstrap.min.css'}>" rel="stylesheet" type="text/css" />    <link href="<{file 'assets/css/style.css'}>" rel="stylesheet" type="text/css" />    <{if $template.scheme == 'orange'}>        <link href="<{file 'assets/css/scheme/orange.css'}>" rel="stylesheet" type="text/css" />    <{elseif $template.scheme == 'blue'}>        <link href="<{file 'assets/css/scheme/blue.css'}>" rel="stylesheet" type="text/css" />    <{else}>        <{* red(default) *}>        <link href="<{file 'assets/css/scheme/red.css'}>" rel="stylesheet" type="text/css" />    <{/if}>    <script type="text/javascript" src="<{file 'assets/plugins/jquery-3.2.1.min.js'}>"></script>    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>    <script type="text/javascript" src="<{file 'assets/plugins/bootstrap4/js/bootstrap.min.js'}>"></script>    <script type="text/javascript" src="<{file 'assets/js/script.js'}>"></script>    <script type="text/javascript" src="<{file 'assets/plugins/jquery.link-submit.js'}>"></script>    <{if $is_web_admin}>        <script type="text/javascript" src="<{file 'assets/js/web-admin.js'}>"></script>    <{/if}>    <{custom_code "head_close"}><{/block}><{block name="body"}>    <{custom_code "body_open"}>    <{get_contacts "layout_contacts"}>    <{get_basket "layout_basket"}>    <div class="container">        <div class="alert alert-dark" role="alert">            <{t "Файл шаблона:"}>            <strong>                <{block name="template-name"}>                    /layout.tpl                <{/block}>                <{if $__tf}>                    <a href="?__tf=">                        <b><{$__tf}></b>                        <{t "- Вернуться к шаблону сайта"}>                    </a>                <{/if}>            </strong>            <{if $smarty.get.template_debug === '1'}>                <a href="?" class="btn btn-sm btn-info float-right">                    <{t "Закрыть окно отладки"}>                </a>                <{debug}>            <{else}>                <a href="?template_debug=1" class="btn btn-sm btn-info float-right">                    <{t "Открыть окно отладки"}>                </a>            <{/if}>            <div class="template-scheme-marker float-right">                Sch            </div>        </div>        <{custom_code "site_header"}>        <div class="row">            <div class="col">                <{if $layout_contacts.contact.24h_work === '1'}>                    <div>                        <span class="badge badge-secondary">                            <{t "Работает круглосуточно"}>                        </span>                    </div>                <{else}>                    <{t "Расписание работы:"}>                    <{foreach $layout_contacts.contact.schedule as $daySchedule}>                        <div>                            <{if $daySchedule.day_from === $daySchedule.day_to}>                                <{$daySchedule.day_to}>:                            <{else}>                                <{$daySchedule.day_from}>-<{$daySchedule.day_to}>:                            <{/if}>                            <span>                                <{if $daySchedule.holiday === '1'}>                                    <{t "Выходной"}>                                <{else}>                                    <{$daySchedule.time_from_h}><sup>:<{$daySchedule.time_from_m}></sup>-<{$daySchedule.time_to_h}><sup>:<{$daySchedule.time_to_m}></sup>                                <{/if}>                            </span>                        </div>                    <{/foreach}>                <{/if}>            </div>            <div class="col">                <{t "Телефоны:"}>                <{foreach $layout_contacts.phones as $phone}>                    <a href="tel:<{$phone.number|strip_tags|trim|escape}>">                        <{$phone.number}>                    </a>                    <{if $phone.fax === 'Y'}>                        <span class="badge badge-secondary">                            <{t "Факс"}>                        </span>                    <{/if}>                    <{if $phone.mobile === 'Y'}>                        <span class="badge badge-secondary">                            <{t "Мобильный"}>                        </span>                    <{/if}>                <{/foreach}>            </div>            <div class="col">                <{if $layout_contacts.page}>                    <a href="<{$layout_contacts.page.href}>" title="<{$layout_contacts.page.title|escape}>">                        <{t "Контакты"}>                    </a>                <{/if}>            </div>            <div class="col">                <{if $customer.is_guest}>                    <a href="<{account_sign_in_url}>">                        <{t "Войти"}>                    </a>                <{else}>                    <a href="<{account_url}>">                        <{if $customer.image}>                            <img src="<{$customer.image}>" width="50" class="img-thumbnail" />                        <{/if}>                        <{$customer.display_name|htmlspecialchars}>                    </a>                <{/if}>            </div>            <div class="col">                <{if $layout_basket.items|count}>                    <a href="#basket-modal" data-toggle="modal" data-target="#basket-modal">                        <{t "В корзине {count} товаров на {total}" count=$layout_basket.count total=$layout_basket.subtotal.html}>                    </a>                <{/if}>            </div>        </div>        <nav class="navbar navbar-expand-lg navbar-light bg-light">            <a class="navbar-brand h1" href="<{$site.home_url}>">                <{if $site.logo.type === 'image'}>                    <img src="<{$site.logo.image}>" />                <{else}>                    <span style="<{if $site.logo.text_color}>color:<{$site.logo.text_color}>;<{/if}><{if $site.logo.text_size}>font-size:<{$site.logo.text_size}>px;<{/if}><{if $site.logo.text_font}>font-family:'<{$site.logo.text_font|escape}>';<{/if}>">                        <{$site.logo.text|htmlspecialchars}>                    </span>                <{/if}>            </a>            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#top-menu-content" aria-controls="top-menu-content" aria-expanded="false" aria-label="Toggle top menu">                <span class="navbar-toggler-icon"></span>            </button>            <div class="collapse navbar-collapse" id="top-menu-content">                <{get_menu "top" "top_menu"}>                <{if $top_menu.0|count}>                    <ul class="navbar-nav mr-auto">                        <{foreach $top_menu.0 as $page}>                            <li class="nav-item<{if $page.is_active}> active<{/if}>">                                <a class="nav-link" href="<{$page.href}>">                                    <{$page.page_name|htmlspecialchars}>                                </a>                            </li>                        <{/foreach}>                    </ul>                <{/if}>                <{if $site.languages|count > 1}>                    <div class="dropdown">                        <button class="btn btn-secondary dropdown-toggle" type="button" id="languages-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                            <{$site.active_language.name|htmlspecialchars}>                        </button>                        <div class="dropdown-menu" aria-labelledby="languages-dropdown">                            <{foreach $site.languages as $language}>                                <a class="dropdown-item<{if $language.language_id == $site.active_language.language_id}> active<{/if}>" href="<{$language.page_url}>">                                    <{$language.name|htmlspecialchars}>                                </a>                            <{/foreach}>                        </div>                    </div>                <{/if}>                <{get_currency "currencies" "active_currency"}>                <{if $currencies|count > 1}>                    <div class="dropdown">                        <button class="btn btn-secondary dropdown-toggle" type="button" id="languages-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                            <{$active_currency.name|htmlspecialchars}>                        </button>                        <div class="dropdown-menu" aria-labelledby="languages-dropdown">                            <{foreach $currencies as $currency}>                                <a class="dropdown-item<{if $currency.id == $active_currency.id}> active<{/if}>" href="<{$site.url_part|escape}>ajax/select_currency/" data-method="POST" data-post="id=<{$currency.id}>" data-refresh="1">                                    <{$currency.name|htmlspecialchars}>                                </a>                            <{/foreach}>                        </div>                    </div>                <{/if}>                <form class="form-inline my-2 my-lg-0">                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>                </form>            </div>        </nav>        <{get_menu "catalog" "catalog_menu"}>        <{if $catalog_menu|count}>            <nav class="navbar navbar-expand-lg navbar-light bg-light">                <div class="navbar-brand h1">                    <{t "Меню каталога"}>                </div>                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#catalog-menu-content" aria-controls="catalog-menu-content" aria-expanded="false" aria-label="Toggle catalog menu">                    <span class="navbar-toggler-icon"></span>                </button>                <div class="collapse navbar-collapse" id="catalog-menu-content">                    <ul class="navbar-nav mr-auto">                        <{foreach $catalog_menu as $rubric_type}>                            <li class="nav-item<{if $rubric_type.is_active}> active<{/if}>">                                <div class="btn-group">                                    <a class="btn btn-link nav-link" href="<{$rubric_type.relative_url}>" title="<{$rubric_type.name|escape}>">                                        <{$rubric_type.short_name|htmlspecialchars}>                                    </a>                                    <{if $rubric_type.children}>                                        <a class="btn btn-link dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">                                            <span class="sr-only">Toggle Dropdown</span>                                        </a>                                        <div class="dropdown-menu">                                            <{foreach $rubric_type.children as $rubric}>                                                <a class="dropdown-item<{if $rubric.is_active}> active<{/if}>" href="<{$rubric.relative_url}>" title="<{$rubric.name|escape}>">                                                    <{$rubric.short_name|htmlspecialchars}>                                                </a>                                                <{if $rubric.children}>                                                    <{foreach $rubric.children as $category}>                                                        <a class="dropdown-item<{if $category.is_active}> active<{/if}>" href="<{$category.relative_url}>" title="<{$category.name|escape}>">                                                            -                                                            <{$category.short_name|htmlspecialchars}>                                                        </a>                                                    <{/foreach}>                                                    <{if !$rubric@last}>                                                        <div class="dropdown-divider"></div>                                                    <{/if}>                                                <{/if}>                                            <{/foreach}>                                        </div>                                    <{/if}>                                </div>                            </li>                        <{/foreach}>                    </ul>                </div>            </nav>        <{/if}>        <{block name="module"}>        <{/block}>        <{custom_code "footer"}>        <footer class="footer">            <nav class="navbar navbar-expand-lg navbar-light bg-light">                <{get_menu "bottom" "bottom_menu"}>                <{if $bottom_menu.0|count}>                    <ul class="navbar-nav mr-auto">                        <{foreach $bottom_menu.0 as $page}>                            <li class="nav-item<{if $page.is_active}> active<{/if}>">                                <a class="nav-link" href="<{$page.href}>">                                    <{$page.page_name|htmlspecialchars}>                                </a>                            </li>                        <{/foreach}>                    </ul>                <{/if}>            </nav>            <nav class="navbar navbar-expand-lg navbar-light bg-light">                <div class="navbar-brand">                    <{$site.name|htmlspecialchars}>                    ©                    <{$site.date_founded}>                    -                    <{0|as_date:"Y"}>                </div>                <ul class="navbar-nav">                    <li class="nav-item">                        <a class="nav-link" href="http://totalcan.com.ua/" title="Создание сайтов, разработка интернет магазинов, раскрутка сайтов">                            Создание сайта totalcan.com.ua                        </a>                    </li>                    <li class="nav-item">                        <a class="nav-link" href="http://bravosell.com/ru/" title="Сайт работает на CMS Bravosell">                            CMS интернет магазина - bravosell                        </a>                    </li>                </ul>            </nav>            <{custom_code "counters"}>        </footer>    </div>    <{if $layout_basket.items|count}>        <div class="modal" role="dialog" id="basket-modal">            <div class="modal-dialog modal-lg" role="document">                <div class="modal-content">                    <div class="modal-header">                        <h5 class="modal-title">Корзина</h5>                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">                            <span aria-hidden="true">&times;</span>                        </button>                    </div>                    <div class="modal-body">                        <{foreach $layout_basket.items as $item}>                            <div class="row js-basket-item">                                <div class="col-lg-4">                                    <{if $item.article.cover}>                                        <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">                                            <img src="<{$item.article.cover.photo_file_small}>" style="width: 100%;" />                                        </a>                                    <{/if}>                                </div>                                <div class="col-lg-4">                                    <{basket_form return_url="#basket-modal" class="js-basket-item-form form-inline"}>                                    <div class="input-group">                                        <input type="text" name="article[<{$item.article.id}>]" class="form-control js-basket-item-count" style="width:50px;" value="<{$item.count}>" />                                        <label class="input-group-text">                                            X <{$item.article.price.html}>                                        </label>                                        <button type="submit" class="btn btn-outline-success">                                            ОК                                        </button>                                    </div>                                    <{/basket_form}>                                    <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">                                        <{$item.article.short_name|htmlspecialchars}>                                    </a>                                </div>                                <div class="col-lg-4">                                    <{$item.summary.html}>                                    <button type="button" class="close js-basket-item-delete">                                        <span aria-hidden="true">×</span>                                    </button>                                </div>                            </div>                        <{/foreach}>                        <div class="row">                            <div class="col-lg-4">                                <{t "Всего {count,plural, one{# товар} few{# товара} many{# товаров} other{# товаров}}" count=$layout_basket.count}>                            </div>                            <div class="col-lg-4">                            </div>                            <div class="col-lg-4">                                <{$layout_basket.subtotal.html}>                            </div>                        </div>                    </div>                    <div class="modal-footer">                        <button type="submit" class="btn btn-primary">                            <{t "Оформить заказ на {count,plural, one{# товар} few{# товара} many{# товаров} other{# товаров}} общей стоимостью {sum}" count=$layout_basket.count sum=$layout_basket.subtotal.html}>                        </button>                        <button type="button" class="btn btn-secondary" data-dismiss="modal">                            Продолжить покупки                        </button>                    </div>                </div>            </div>        </div>    <{/if}>    <{custom_code "body_close"}><{/block}>