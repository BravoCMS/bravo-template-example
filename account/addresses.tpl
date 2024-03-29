
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/addresses.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        Адреса доставки
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
            <{foreach $addresses as $address}>
                <div class="row js-address-<{$address.id}>">
                    <div class="col">
                        <a href="<{$address.relative_url}>">
                            <{$address.text|htmlspecialchars}>
                        </a>
                    </div>
                    <div class="col">
                        <{form action=$address.delete_url method="POST"}>
                        <button type="submit"  data-confirm="Удалить?" data-remove=".js-address-<{$address.id}>">
                            Удалить
                        </button>
                        <{/form}>
                    </div>
                </div>
            <{/foreach}>
        </div>
    </div>

<{/block}>
