
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/info.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        Здравствуйте,
        <{$customer.display_name|htmlspecialchars}>!
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

        <{if $customer.image}>
            <div class="col-lg-3">
                <img src="<{$customer.image}>" class="img-thumbnail" />
            </div>
        <{/if}>

        <div class="col-lg-6">
            <p>
                Войти под другим именем
                <br />
                <a href="<{account_sign_in_url}>" class="btn btn-success btn-sm">
                    <{t "Сменить аккаунт"}>
                </a>
            </p>

            <p>
                Сменить имя, пароль, аватар, телефон можно в сервисе браворег
                <br />
                <a href="<{account_update_url}>" class="btn btn-success btn-sm">
                    <{t "Редактировать регистрационные данные"}>
                </a>
            </p>

            <p>
                Выйти из аккаунта
                <br />
                <a href="<{account_sign_out_url return_url='/'}>" class="btn btn-warning btn-sm">
                    <{t "Выйти"}>
                </a>
            </p>

            <{account_info_form}>

            <p>
                Чтото о себе
                <br />
                <textarea class="form-control" name="data[me]"><{$module.info.data.me|htmlspecialchars}></textarea>
            </p>
            <p>
                Чтото о нем
                <br />
                <textarea class="form-control" name="data[he]"><{$module.info.data.he|htmlspecialchars}></textarea>
            </p>
            <p>
                Чтото о ней
                <br />
                <textarea class="form-control" name="data[she]"><{$module.info.data.she|htmlspecialchars}></textarea>
            </p>
            <p>
                Чтото о них
                <br />
                <textarea class="form-control" name="data[they]"><{$module.info.data.they|htmlspecialchars}></textarea>
            </p>

            <input type="hidden" name="data[links]" value="" />
            <p>
                Ссылки
            </p>
            <{if $module.info.data.links|is_array}>
                <{foreach $module.info.data.links as $key => $link}>
                    <div class="row js-links-row">
                        <div class="col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Что</span>
                                <input type="text" class="form-control" name="data[links][<{$key}>][title]" value="<{$link.title|escape}>" />
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="input-group">
                                <span class="input-group-addon">Куда</span>
                                <input type="text" class="form-control" name="data[links][<{$key}>][href]" value="<{$link.href|escape}>" />
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <button type="button" class="btn btn-warning float-right js-delete-link"> 
                                Удалить
                            </button>
                        </div>
                    </div>
                <{/foreach}>
            <{/if}>

            <script>
                require(['jquery'], function ($) {
                    var key = <{$key|intval}>;

                    $(document).on('click', '.js-delete-link', function (e) {
                        $(this).closest('.js-links-row').remove();
                    });
                    $(document).on('click', '.js-create-link', function (e) {
                        var $row = $('.js-links-row-new').clone().removeClass('js-links-row-new').addClass('js-links-row').attr('style', '');
                        key++;

                        $row.find('.js-links-title').attr('name', 'data[links][' + key + '][title]');
                        $row.find('.js-links-href').attr('name', 'data[links][' + key + '][href]');
                        $row.insertBefore(this);
                    });
                });
            </script>

            <div class="row js-links-row-new" style="display:none;">
                <div class="col-lg-4">
                    <div class="input-group">
                        <span class="input-group-addon">Что</span>
                        <input type="text" class="form-control js-links-title" />
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="input-group">
                        <span class="input-group-addon">Куда</span>
                        <input type="text" class="form-control js-links-href" />
                    </div>
                </div>
                <div class="col-lg-3">
                    <button type="button" class="btn btn-warning float-right js-delete-link"> 
                        Удалить
                    </button>
                </div>
            </div>

            <button type="button" class="btn float-right js-create-link"> 
                Добавить ссылку
            </button>

            <button type="submit" class="btn btn-primary">
                Сохранить
            </button>
            <{/account_info_form}>
        </div>
    </div>

<{/block}>
