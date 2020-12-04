
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /order_checkout.tpl
<{/block}>

<{block name=title}>
    Выберите вариант оплаты заказа
<{/block}>

<{block name="module"}>
    <div class="row">
        <div class="col-lg-12">
            <h1>
                Номер вашего заказа #<{$order.id}>.
            </h1>
            
        </div>
    </div>
<{/block}>
