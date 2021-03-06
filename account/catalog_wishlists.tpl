
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/catalog_wishlists.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{t 'Wishlists'}>
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
            <div class="row">
                <{foreach $wishlists as $wishlist}>
                    <div class="col-lg-12">
                        <a href="<{$wishlist.relative_url}>">
                            <{if $wishlist.id}>
                                <{$wishlist.name|htmlspecialchars}>
                            <{else}>
                                <{t 'Not_on_the_list'}>
                            <{/if}>
                            (<{$wishlist.items_count|htmlspecialchars}>)
                        </a>
                    </div>
                <{/foreach}>
            </div>
        </div>
    </div>

<{/block}>
