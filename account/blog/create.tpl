
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/blog/create.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name=head append}>
    <script type="text/javascript">
        require(['languageSelector']);
    </script>
<{/block}>

<{block name="module"}>
    <h1>
        Добавить статью
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
            <{form action="" method="POST" class="js-l-scope"}>
            <div class="form-group">
                <div class="col-sm-12">
                    <div class="btn-group">
                        <div style="display: table-cell;"></div>
                        <{include 'misc/language_selector.tpl'}>
                    </div>
                </div>
            </div>

            <div class="form-group js-l-scope">
                <{foreach $languages as $language}>
                    <div class="js-l-selectee<{if $language.language_id != $active_language_id}> hide<{/if}>" code="<{$language.code}>">
                        <label for="name_<{$language.language_id}>">
                            Название
                        </label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="article_translation[<{$language.language_id}>][name]" id="name_<{$language.language_id}>" value="" />
                            <{include 'misc/language_selector.tpl'}>
                        </div>
                    </div>
                <{/foreach}>
            </div>

            <button type="submit" class="btn btn-primary">
                Добавить
            </button>

            <a href="<{$back_url}>" class="btn btn-secondary">
                Назад
            </a>
            <{/form}>
        </div>
    </div>
<{/block}>
