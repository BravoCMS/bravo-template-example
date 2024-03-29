
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /catalog.tpl
<{/block}>

<{block name=title}>
    <{$module.title|htmlspecialchars}>
<{/block}>

<{block name="module"}>
    <div class="row">
        <{get_catalog_articles "articles" "pagination" "filter" by_options=[24, 48, 120] page_query}>
        <{get_catalog_wishlists "wishlists"}>

        <script>
            require(['jquery'], function ($) {
                $(document.body).on('change', '.js-catalog-filter', function () {
                    $(this).submit();
                });
            });
        </script>

        <div class="col-lg-3">
            <form method="GET" class="js-catalog-filter">
                <input type="hidden" name="page" value="1" class="js-page-value" />

                <{if $filter.brands}>
                    <h4>
                        <{t 'Brands'}>
                    </h4>

                    <nav class="nav flex-column nav-pills">
                        <{foreach $filter.brands as $brand}>
                            <a class="nav-link<{if $brand.is_active}> active<{/if}>" href="<{$brand.query_url}>" title="<{$brand.name|escape}>">
                                <{$brand.short_name|htmlspecialchars}>
                            </a>

                            <{if $brand.is_active}>
                                <input type="hidden" name="brands[]" value="<{$brand.url|escape}>" />
                            <{/if}>
                        <{/foreach}>
                    </nav>
                <{/if}>

                <{if $filter.price.low_value < $filter.price.high_value}>
                    <h4>
                        <{t 'Price'}>
                    </h4>

                    <div class="form-group">
                        <label for="price-from">
                            <{t 'From'}>
                            <{$filter.price.low_value|htmlspecialchars}>
                        </label>

                        <input type="text" name="price_from" class="form-control" id="price-from" value="<{$filter.price.price_from|escape}>" />
                    </div>

                    <div class="form-group">
                        <label for="price-to">
                            <{t 'To'}>
                            <{$filter.price.high_value|htmlspecialchars}>
                        </label>

                        <input type="text" name="price_to" class="form-control" id="price-to" value="<{$filter.price.price_to|escape}>" />
                    </div>
                <{/if}>

                <{if $filter.availability}>
                    <h4>
                        <{t 'Availability'}>
                    </h4>

                    <nav class="nav flex-column nav-pills">
                        <{foreach $filter.availability as $availability}>
                            <a class="nav-link<{if $availability.is_active}> active<{/if}>" href="<{$availability.query_url}>">
                                <{$availability.name|htmlspecialchars}>
                            </a>

                            <{if $availability.is_active}>
                                <input type="hidden" name="<{$availability.code|escape}>" value="1" />
                            <{/if}>
                        <{/foreach}>
                    </nav>
                <{/if}>


                <{if $filter.params}>
                    <{foreach $filter.params as $param}>
                        <h4>
                            <{$param.name|htmlspecialchars}>
                        </h4>

                        <nav class="nav flex-column nav-pills">
                            <{foreach $param.options as $option}>
                                <a class="nav-link<{if $option.is_active}> active<{/if}>" href="<{$option.query_url}>">
                                    <{$option.name|htmlspecialchars}><{$option.unit_short_name|htmlspecialchars}>
                                </a>

                                <{if $option.is_active}>
                                    <input type="hidden" name="params[]" value="<{$option.id}>" />
                                <{/if}>
                            <{/foreach}>
                        </nav>
                    <{/foreach}>
                <{/if}>

                <div class="form-group">
                    <select name="by" class="form-control" id="catalog-by">
                        <option value="24"<{if $smarty.get.by == 24}> selected="selected"<{/if}>>
                            24
                        </option>
                        <option value="48"<{if $smarty.get.by == 48}> selected="selected"<{/if}>>
                            48
                        </option>
                        <option value="120"<{if $smarty.get.by == 120}> selected="selected"<{/if}>>
                            120
                        </option>
                    </select>
                </div>

                <{if count($filter.ordering) > 1}>
                    <div class="form-group">
                        <label for="catalog-order">
                            <{t 'Sort'}>
                        </label>

                        <select name="order" class="form-control" id="catalog-order">
                            <{foreach $filter.ordering as $orderingValue}>
                                <option value="<{$orderingValue}>"<{if $smarty.get.order == $orderingValue}> selected="selected"<{/if}>>
                                    <{if $orderingValue == 'price'}>
                                        <{t 'Cheap_to_expensive'}>
                                    <{elseif $orderingValue == 'price_desc'}>
                                        <{t 'From_expensive_to_cheap'}> 
                                    <{elseif $orderingValue == 'date_asc'}>
                                        <{t 'From_old_to_new'}>
                                    <{elseif $orderingValue == 'date'}>
                                        <{t 'From_new_to_old'}> 
                                    <{elseif $orderingValue == 'rating'}>
                                        <{t 'By_rating'}>
                                    <{/if}>
                                </option>
                            <{/foreach}>
                        </select>
                    </div>
                <{/if}>
            </form>
        </div>

        <div class="col-lg-9">
            <{foreach $module.settings as $blockName => $blockSettings}>
                <{if $blockName == "list" && $blockSettings.enabled}>
                    <div class="row">
                        <{foreach $articles as $article}>
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
                                            <{if $article.unit_id}>
                                                <{t "Buy for {price}/{unit}" price=$article.price.html unit=$article.unit_short_name}>
                                            <{else}>
                                                <{t "Buy for {price}" price=$article.price.html}>
                                            <{/if}>
                                        <{else}>
                                            <{t "Buy"}>
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

                                <{if $customer.is_guest}>
                                    <a href="<{account_sign_in_url}>">
                                        <{t 'Sign in to add to favorites'}>
                                    </a>
                                <{else}>
                                    <{catalog_wishlist_form $article add}>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".js-wishlist-modal-<{$article.id}>">
                                        <{t 'Add to wishlist'}>
                                    </button>

                                    <div class="modal js-wishlist-modal-<{$article.id}>" tabindex="-1" role="dialog">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title"><{t 'Add_to_Wishlist'}></h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <{foreach $wishlists as $wishlist}>
                                                        <label>
                                                            <input type="radio" name="catalog_wishlist_id" value="<{$wishlist.id|escape}>" />
                                                            <{$wishlist.name|htmlspecialchars}>
                                                        </label><br />
                                                    <{/foreach}>
                                                    <label>
                                                        <input type="radio" name="catalog_wishlist_id" value="0" />
                                                        <input type="text" name="catalog_wishlist_name" />
                                                    </label><br />
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">
                                                        <{t 'Add'}>
                                                    </button>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <{/catalog_wishlist_form}>
                                <{/if}>
                            </div>
                        <{/foreach}>
                    </div>
                <{elseif $blockName == "subcat" && $blockSettings.enabled}>
                    <{get_catalog_submenu "children" parent=$module}>
                    <{if $children}>
                        <h1>
                            <{t 'Subsections'}>
                        </h1>
                        <div class="row">
                            <{foreach $children as $child}>
                                <div class="col-lg-3">
                                    <{if $child.photo_file_small}>
                                        <a href="<{$child.relative_url}>" title="<{$child.name|escape}>">
                                            <img src="<{$child.photo_file_small}>" style="width: 100%;" />
                                        </a>
                                    <{/if}>

                                    <a href="<{$child.relative_url}>" title="<{$child.name|escape}>">
                                        <{$child.short_name|htmlspecialchars}>
                                    </a>
                                </div>
                            <{/foreach}>
                        </div>
                    <{/if}>
                <{elseif $blockName == "extra" && $blockSettings.enabled}>
                    <div class="row">
                        <{$module.extra}>
                    </div>
                <{elseif $blockName == "related" && $blockSettings.enabled}>
                    <{get_catalog_articles "r1_articles" related_1=$module by=4 order='rand'}>
                    <{if $r1_articles}>
                        <h1>
                            <{t 'Super_offer'}>!
                        </h1>
                        <div class="row">
                            <{foreach $r1_articles as $article}>
                                <div class="col-lg-3">
                                    <{if $article.cover}>
                                        <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                            <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                                        </a>
                                    <{/if}>

                                    <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                        <{$article.short_name|htmlspecialchars}>
                                    </a>
                                </div>
                            <{/foreach}>
                        </div>
                    <{/if}>
                <{elseif $blockName == "range" && $blockSettings.enabled}>
                    <{if $filter.active}>
                        <div class="row">
                            <div class="col-lg-12">
                                <{foreach $filter.active as $badge}>
                                    <a href="<{$badge.query_url}>" class="badge badge-primary">
                                        <{$badge.name|htmlspecialchars}>
                                    </a>
                                <{/foreach}>
                            </div>
                        </div>
                    <{/if}>
                <{elseif $blockName == "content" && $blockSettings.enabled}>
                    <div class="row">
                        <{if $blockSettings.content.photo && $module.cover.photo_file}>
                            <img src="<{$module.cover.photo_file}>" />
                        <{/if}>

                        <{if $blockSettings.content.title}>
                            <h1>
                                <{$module.name|htmlspecialchars}>
                            </h1>
                        <{/if}>

                        <{if $blockSettings.content.text}>
                            <{$module.text}>
                        <{/if}>
                    </div>
                <{/if}>
            <{/foreach}>

            <script>
                require(['jquery'], function ($) {
                    $(document.body).on('click', '.js-catalog-pagination a', function (e) {
                        e.preventDefault();
                        $('.js-page-value').val($(this).data('page')).trigger('change');
                    });
                });
            </script>

            <div class="row js-catalog-pagination">
                <{include 'misc/pagination.tpl'}>
            </div>
        </div>
    </div>
<{/block}>
