
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /catalog_brand.tpl
<{/block}>

<{block name=title}>
    <{$module.title|htmlspecialchars}>
<{/block}>

<{block name="module"}>
    <div class="row">
        <{get_catalog_articles "articles" "pagination" "filter" by_options=[24, 48, 120] page_query}>

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

                <{if $filter.catalog}>
                    <h4>
                        <{t "Catalog"}>
                    </h4>

                    <nav class="nav flex-column nav-pills">
                        <{foreach $filter.catalog as $rubricType}>
                            <a class="nav-link<{if $rubricType.is_active}> active<{/if}>" href="<{$rubricType.relative_url}>">
                                <{$rubricType.name|htmlspecialchars}>
                            </a>

                            <{foreach $rubricType.children as $rubric}>
                                <a class="nav-link<{if $rubric.is_active}> active<{/if}>" href="<{$rubric.relative_url}>">
                                    -
                                    <{$rubric.name|htmlspecialchars}>
                                </a>

                                <{foreach $rubric.children as $category}>
                                    <a class="nav-link<{if $category.is_active}> active<{/if}>" href="<{$category.relative_url}>">
                                        -
                                        <{$category.name|htmlspecialchars}>
                                    </a>
                                <{/foreach}>
                            <{/foreach}>
                        <{/foreach}>
                    </nav>
                <{/if}>

                <{if $filter.brands}>
                    <h4>
                        <{t "Brands"}>
                    </h4>

                    <nav class="nav flex-column nav-pills">
                        <{foreach $filter.brands as $brand}>
                            <a class="nav-link<{if $brand.is_active}> active<{/if}>" href="<{$brand.query_url}>">
                                <{$brand.name|htmlspecialchars}>
                            </a>

                            <{if $brand.is_active}>
                                <input type="hidden" name="brands[]" value="<{$brand.url|escape}>" />
                            <{/if}>
                        <{/foreach}>
                    </nav>
                <{/if}>

                <{if $filter.price.low_value < $filter.price.high_value}>
                    <h4>
                        <{t "Price"}>
                    </h4>

                    <div class="form-group">
                        <label for="price-from">
                            <{t "From"}>
                            <{$filter.price.low_value|htmlspecialchars}>
                        </label>

                        <input type="text" name="price_from" class="form-control" id="price-from" value="<{$filter.price.price_from|escape}>" />
                    </div>

                    <div class="form-group">
                        <label for="price-to">
                            <{t "To"}>
                            <{$filter.price.high_value|htmlspecialchars}>
                        </label>

                        <input type="text" name="price_to" class="form-control" id="price-to" value="<{$filter.price.price_to|escape}>" />
                    </div>
                <{/if}>

                <{if $filter.availability}>
                    <h4>
                        <{t "Availability"}>
                    </h4>

                    <nav class="nav flex-column nav-pills">
                        <{foreach $filter.availability as $availability}>
                            <a class="nav-link<{if $availability.is_active}> active<{/if}>" href="<{$availability.query_url}>">
                                <{t text=$availability.name|htmlspecialchars}>
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
            <h1>
                <{$module.name|htmlspecialchars}>
            </h1>

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
                    </div>
                <{/foreach}>
            </div>

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
