
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/blog/list.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        Статьи
    </h1>

    <div class="row">
        <div class="col-lg-3">
            <nav class="nav flex-column">
                <{foreach $module.menu as $menuItem}>
                    <a class="nav-link<{if $menuItem.is_active}> active<{/if}>" href="<{$menuItem.url}>">
                        <{t $menuItem.short_name}>
                    </a>
                <{/foreach}>
            </nav>
        </div>

        <div class="col-lg-9">
            <a href="<{$create_url}>" class="btn btn-primary">
                Добавить
            </a>

            <{foreach $articles as $article}>
                <div class="row">
                    <div class="col">
                        <a href="<{$article.update_url}>">
                            <{$article.name|htmlspecialchars}>
                        </a>
                    </div>
                    <div class="col">
                        <{if $article.is_published}>
                            Опубликована

                            <a href="<{$article.relative_url}>" target="_blank">
                                Смотреть
                            </a>
                        <{else}>
                            Не опубликована,
                            <{$article.customer_status_name|htmlspecialchars}><{if $article.customer_status_message}>, <{$article.customer_status_message|htmlspecialchars}><{/if}>
                        <{/if}>
                    </div>
                </div>
            <{/foreach}>
        </div>
    </div>

<{/block}>
