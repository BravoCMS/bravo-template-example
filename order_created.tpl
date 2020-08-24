
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /order_created.tpl
<{/block}>

<{block name=title}>
    Ваш заказ #<{$order.id}> успешно оформлен
<{/block}>

<{block name="module"}>
    <div class="row">
        <div class="col-lg-12">
            <h1>
                Номер вашего заказа #<{$order.id}>.
            </h1>
            <p>
                Мы свяжемся с вами как можно скорее.
            </p>

            <pre><{$order|var_dump}></pre>
        </div>
    </div>
<{/block}>
