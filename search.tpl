
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /search.tpl
<{/block}>

<{block name=title}>
    Поиск
<{/block}>

<{block name="module"}>
    <div class="row">
        <{get_search_items 'items' 'pagination' by=10 by_options=[10, 20, 50]}>

        <{foreach $items as $item}>
            <div class="col-lg-4">
                <{if $item.cover}>
                    <a href="<{$item.relative_url}>" title="<{$item.name|escape}>">
                        <img src="<{$item.cover.photo_file_small}>" style="width: 100%;" />
                    </a>
                <{/if}>
            </div>

            <div class="col-lg-8">
                <a href="<{$item.relative_url}>" title="<{$item.name|escape}>">
                    <{$item.short_name|htmlspecialchars}>
                </a>

                <{if $item.type == 'catalog_article'}>
                    <{basket_form article=$item return_url="#basket-modal"}>
                    <button type="submit" class="btn btn-success">
                        <{if $item.price.is_price}>
                            <{t 'Buy_for'}>
                            <{$item.price.html}>
                        <{else}>
                            <{t 'Buy'}>
                        <{/if}>
                    </button>
                    <{/basket_form}>
                <{/if}>
            </div>
        <{foreachelse}>
            <div class="col-lg-12">
                <{t 'Nothing_found'}>
            </div>
        <{/foreach}>

        <script>
            jQuery(function ($) {
                $(document.body).on('click', '.js-search-pagination a', function (e) {
                    e.preventDefault();
                    var $field = $('<input type="hidden" name="page" />').val($(this).data('page'));

                    $('.js-search-form').append($field);
                    $('.js-search-form').submit();
                });
            });
        </script>

        <div class="col-lg-12 js-search-pagination">
            <{include 'misc/pagination.tpl'}>
        </div>
    </div>
<{/block}>
