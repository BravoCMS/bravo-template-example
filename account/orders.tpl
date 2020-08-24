
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/orders.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        Заказы
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
            <{foreach $orders as $order}>
                <div class="row">
                    <div class="col">
                        <a href="<{$order.relative_url}>">
                            <{t "Заказ {id} на сумму" id=$order.id}>
                            <{price $order.summary_goods}>
                        </a>
                    </div>
                    <div class="col">
                        <{$order.status_translation}>
                    </div>
                </div>
            <{/foreach}>

            <div class="row">
                <{include 'misc/pagination.tpl'}>
            </div>
        </div>
    </div>

<{/block}>
