
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /catalog_comparison.tpl
<{/block}>

<{block name=title}>
    <{$module.title|htmlspecialchars}>
<{/block}>

<{block name="module"}>
    <div class="row">
        <div class="col">
        </div>

        <{foreach $articles as $article}>
            <div class="col">
                <{comparison_form article=$article remove}>
                <button type="submit" class="btn btn-warning">
                    <{t 'Remove'}>
                </button>
                <{/comparison_form}>

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
            </div>
        <{/foreach}>
    </div>

    <{foreach $parameters as $groupId => $group}>
        <h2>
            <{$group.name|htmlspecialchars}>
        </h2>

        <{foreach $group.children as $parameterId => $parameter}>
            <div class="row">
                <div class="col">
                    <{$parameter.name|htmlspecialchars}>
                </div>

                <{foreach $articles as $article}>
                    <div class="col">
                        <{foreach $article.parameters.tab[$groupId].children[$parameterId].values as $value}>
                            <{$value.value|htmlspecialchars}>
                            <br />
                        <{/foreach}>
                    </div>
                <{/foreach}>
            </div>
        <{/foreach}>
    <{/foreach}>
<{/block}>
