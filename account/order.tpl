
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/order.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{t "Заказ #{id}" id=$order.id}>
        <{$order.status_translation}>

        <{if $order.is_cancel}>
            <button type="button" class="close js-order-cancel-button" data-confirm="Отменить заказ?">
                <span aria-hidden="true">&times;</span>
            </button>

            <script>
                require(['jquery'], function ($) {
                    $('.js-order-cancel-button').on('click', function () {
                        $('.js-order-cancel').submit();
                    });
                });
            </script>
            <{order_cancel_form $order class="hide js-order-cancel"}>
            <{/order_cancel_form}>
        <{/if}>
    </h1>

    <div class="row">
        <div class="col-lg-3">
            <nav class="nav flex-column">
                <{foreach $module.menu as $menuItem}>
                    <a class="nav-link<{if $menuItem.is_active}> active<{/if}>" href="<{$menuItem.url}>">
                        <{$menuItem.short_name}>
                    </a>
                <{/foreach}>
            </nav>
        </div>

        <div class="col-lg-9">
            <{foreach $order.items as $item}>
                <div class="row">
                    <div class="col">
                        <{if $item.article.cover}>
                            <a href="<{$item.article.relative_url}>" target="_blank">
                                <img src="<{$item.article.cover.photo_file_small}>" />
                            </a>
                        <{/if}>
                    </div>
                    <div class="col">
                        <a href="<{$item.article.relative_url}>" target="_blank">
                            <{$item.article.short_name|htmlspecialchars}>
                        </a>
                    </div>
                    <div class="col">
                        <{$item.count}>
                        X
                        <{price $item.price}>
                    </div>
                    <div class="col">
                        <{price $item.price * $item.count}>
                    </div>
                </div>
            <{/foreach}>

            <div class="row">
                <div class="col">
                    <{t 'Total'}>
                </div>
                <div class="col">
                </div>
                <div class="col">
                </div>
                <div class="col">
                    <{price $order.summary_goods}>
                </div>
            </div>

            <{if $order.summary_promo_discount > 0}>
                <div class="row">
                    <div class="col">
                        <{t 'Discount'}>
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                        <{price $order.summary_promo_discount}>
                    </div>
                </div>
            <{/if}>

            <{if $order.summary_taxes > 0}>
                <div class="row">
                    <div class="col">
                        <{t 'Tax'}>
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                        <{$order.summary_tax_rate * 100}>%
                    </div>
                    <div class="col">
                        <{price $order.summary_taxes}>
                    </div>
                </div>
            <{/if}>

            <div class="row">
                <div class="col">
                    <{t 'Delivery_a'}>
                </div>
                <div class="col">
                </div>
                <div class="col">
                </div>
                <div class="col">
                    <{price $order.summary_delivery}>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <{t 'Итого'}>
                </div>
                <div class="col">
                </div>
                <div class="col">
                </div>
                <div class="col">
                    <{price $order.summary_total}>
                </div>
            </div>
        </div>
    </div>

<{/block}>
