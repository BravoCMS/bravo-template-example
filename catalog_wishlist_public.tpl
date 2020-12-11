
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /catalog_wishlist_public.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{t 'Whish_List'}>
        <{$wishlist.name|htmlspecialchars}>
    </h1>

    <div class="row">
        <div class="col-lg-12">
            <div class="row">
                <{foreach $wishlist.items as $article}>
                    <div class="col-lg-3">
                        <{if $article.cover}>
                            <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                            </a>
                        <{/if}>

                        <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                            <{$article.short_name|htmlspecialchars}>
                        </a>

                        <{if $article.in_basket}>
                            <a href="#basket-modal" class="btn btn-warning" data-toggle="modal" data-target="#basket-modal">
                                <{t 'In_the_basket'}>
                            </a>
                        <{else}>
                            <{basket_form article=$article return_url="#basket-modal"}>
                            <button type="submit" class="btn btn-success">
                                <{if $article.price.is_price}>
                                    <{t 'Buy_for'}>
                                    <{$article.price.html}>
                                <{else}>
                                    <{t 'Buy'}>
                                <{/if}>
                            </button>
                            <{/basket_form}>
                        <{/if}>

                        <{if $article.in_comparison}>
                            <a href="<{comparison_url}>" class="btn btn-primary">
                                <{t 'Compare_one'}>
                            </a>
                        <{else}>
                            <{comparison_form article=$article}>
                            <button type="submit" class="btn btn-secondary">
                                <{t 'Compare'}>
                            </button>
                            <{/comparison_form}>
                        <{/if}>
                    </div>
                <{/foreach}>
            </div>
        </div>
    </div>

<{/block}>
