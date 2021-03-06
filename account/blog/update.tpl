
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/blog/update.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name=head append}>
    <script type="text/javascript">
        require(['fileManager', 'languageSelector']);
    </script>
<{/block}>

<{block name="module"}>
    <h1>
        <{t 'Add_article'}>
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
                            <{t 'Name_a'}>
                        </label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="article_translation[<{$language.language_id}>][name]" id="name_<{$language.language_id}>" value="<{$article_translation[$language.language_id].name|escape}>" />
                            <{include 'misc/language_selector.tpl'}>
                        </div>
                    </div>
                <{/foreach}>
            </div>

            <div class="form-group">
                <label for="photo_id">
                    <{t 'Photo'}>
                </label>
                <div class="input-group">
                    <input id="test" type="hidden" name="article[photo_id]" value="<{$article.photo_id|escape}>" data-toggle="fileManager" data-url="<{$article.file_manager_url|escape}>" data-control=".js-blog-cover" />
                    <div class="form-control file-manager-control js-blog-cover">
                    </div>
                </div>
            </div>

            <div class="form-group js-l-scope">
                <{foreach $languages as $language}>
                    <div class="js-l-selectee<{if $language.language_id != $active_language_id}> hide<{/if}>" code="<{$language.code}>">
                        <label for="intro_<{$language.language_id}>">
                            <{t 'Short_description'}>
                        </label>
                        <div class="input-group">
                            <textarea class="form-control" name="article_translation[<{$language.language_id}>][intro]" id="intro_<{$language.language_id}>"><{$article_translation[$language.language_id].intro|htmlspecialchars}></textarea>
                            <{include 'misc/language_selector.tpl'}>
                        </div>
                    </div>
                <{/foreach}>
            </div>

            <div class="form-group js-l-scope">
                <{foreach $languages as $language}>
                    <div class="js-l-selectee<{if $language.language_id != $active_language_id}> hide<{/if}>" code="<{$language.code}>">
                        <label for="text_<{$language.language_id}>">
                            <{t 'Article'}>
                        </label>
                        <div class="input-group">
                            <textarea class="form-control" name="article_translation[<{$language.language_id}>][text]" id="text_<{$language.language_id}>"><{$article_translation[$language.language_id].text|htmlspecialchars}></textarea>
                            <{include 'misc/language_selector.tpl'}>
                        </div>
                    </div>
                <{/foreach}>
            </div>

            <button type="submit" class="btn btn-primary">
                <{t 'Save'}>
            </button>

            <a href="<{$back_url}>" class="btn btn-secondary">
                <{t 'Back'}>
            </a>
            <{/form}>
        </div>
    </div>
<{/block}>
