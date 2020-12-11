
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /order_created.tpl
<{/block}>

<{block name=title}>
    <{t 'Your_order'}> #<{$order.id}> <{t 'successfully_issued'}>
<{/block}>

<{block name="module"}>
    <div class="row">
        <div class="col-lg-12">
            <h1>
                <{t 'Your_order_number'}> #<{$order.id}>.
            </h1>
            <p>
                <{t 'We_will_contact'}>
            </p>
            <div>
                <span><{t 'Go_to'}></span>
                <a class="link_to_my_orders" href="/<{$site.active_language.code}>/account/orders/"><{t 'my_orders'}></a>.
            </div>
            
            <pre><{$order|var_dump}></pre>
        </div>
    </div>
<{/block}>
