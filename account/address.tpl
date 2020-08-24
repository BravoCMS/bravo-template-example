
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/address.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        Изменение адреса
        <{$address.text|htmlspecialchars}>
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

        <div class="col-lg-9">
            <{address_form $address}>

            <p>
                Страна
                <br />
                <input type="text" class="form-control" name="country" value="<{$address.country|escape}>" />
            </p>

            <p>
                Город
                <br />
                <input type="text" class="form-control" name="city" value="<{$address.city|escape}>" />
            </p>

            <p>
                Улица
                <br />
                <input type="text" class="form-control" name="street" value="<{$address.street|escape}>" />
            </p>

            <p>
                Дом
                <br />
                <input type="text" class="form-control" name="number" value="<{$address.number|escape}>" />
            </p>

            <p>
                Квартира
                <br />
                <input type="text" class="form-control" name="apartment" value="<{$address.apartment|escape}>" />
            </p>

            <p>
                Почтовый индекс
                <br />
                <input type="text" class="form-control" name="zip" value="<{$address.zip|escape}>" />
            </p>

            <p>
                Комментарий
                <br />
                <textarea class="form-control" name="address"><{$address.address|htmlspecialchars}></textarea>
            </p>

            <button type="submit" class="btn btn-primary">
                Сохранить
            </button>

            <{/address_form}>
        </div>
    </div>

<{/block}>
