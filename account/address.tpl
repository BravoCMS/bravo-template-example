
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/address.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{t 'Change_of_address'}>
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
                <{t 'Country'}>
                <br />
                <input type="text" class="form-control" name="country" value="<{$address.country|escape}>" />
            </p>

            <p>
                <{t 'Town'}>
                <br />
                <input type="text" class="form-control" name="city" value="<{$address.city|escape}>" />
            </p>

            <p>
                <{t 'Street'}>
                <br />
                <input type="text" class="form-control" name="street" value="<{$address.street|escape}>" />
            </p>

            <p>
                <{t 'House'}>
                <br />
                <input type="text" class="form-control" name="number" value="<{$address.number|escape}>" />
            </p>

            <p>
                <{t 'Flat'}>
                <br />
                <input type="text" class="form-control" name="apartment" value="<{$address.apartment|escape}>" />
            </p>

            <p>
                <{t 'Postcode'}>
                <br />
                <input type="text" class="form-control" name="zip" value="<{$address.zip|escape}>" />
            </p>

            <p>
                <{t 'Comment'}>
                <br />
                <textarea class="form-control" name="address"><{$address.address|htmlspecialchars}></textarea>
            </p>

            <button type="submit" class="btn btn-primary">
                <{t 'Save'}>
            </button>

            <{/address_form}>
        </div>
    </div>

<{/block}>
