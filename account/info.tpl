
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/info.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{t 'Hello'}>,
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
            <div>
                <a href="<{account_sign_in_url}>" title="<{t 'ВLog_in_with_a_different_name'}>">
                    <{t "Сменить аккаунт"}>
                </a>
                <a href="<{account_update_url}>" title="<{t 'You_can_change_your_name'}>">
                    <{t "Редактировать регистрационные данные"}>
                </a>
                <a href="<{account_sign_out_url return_url='/'}>" title="<{t 'Sign_out_of_account'}>">
                    <{t "Выйти"}>
                </a>        
            </div>

            <{account_info_form}>

            <p>
                <{t "Something"}> <{t "About_Me"}>
                <br />
                <textarea class="form-control" name="data[me]"><{$module.info.data.me|htmlspecialchars}></textarea>
            </p>
            <p>
                <{t "Something"}> <{t "about_him"}>
                <br />
                <textarea class="form-control" name="data[he]"><{$module.info.data.he|htmlspecialchars}></textarea>
            </p>
            <p>
                <{t "Something"}> <{t "about_her"}>
                <br />
                <textarea class="form-control" name="data[she]"><{$module.info.data.she|htmlspecialchars}></textarea>
            </p>
            <p>
                <{t "Something"}> <{t "about_them"}>
                <br />
                <textarea class="form-control" name="data[they]"><{$module.info.data.they|htmlspecialchars}></textarea>
            </p>

            <input type="hidden" name="data[links]" value="" />
            <p>
                <{t "Links"}>
            </p>
            <{if $module.info.data.links|is_array}>
                <{foreach $module.info.data.links as $key => $link}>
                    <div class="row js-links-row">
                        <div class="col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon"><{t "What"}></span>
                                <input type="text" class="form-control" name="data[links][<{$key}>][title]" value="<{$link.title|escape}>" />
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="input-group">
                                <span class="input-group-addon"><{t "Where"}></span>
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
                        <span class="input-group-addon"><{t "What"}></span>
                        <input type="text" class="form-control js-links-title" />
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="input-group">
                        <span class="input-group-addon"><{t "Where"}></span>
                        <input type="text" class="form-control js-links-href" />
                    </div>
                </div>
                <div class="col-lg-3">
                    <button type="button" class="btn btn-warning float-right js-delete-link"> 
                        <{t "Delete"}>
                    </button>
                </div>
            </div>

            <button type="button" class="btn float-right js-create-link"> 
                <{t "Add_link"}>
            </button>

            <button type="submit" class="btn btn-primary">
                <{t "Save"}>
            </button>
            <{/account_info_form}>
        </div>
    </div>

<{/block}>
