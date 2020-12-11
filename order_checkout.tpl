
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
                Номер вашего заказа #<{$order.order_number_for_domain}>.
            </h1>

            <{foreach $payment_methods as $payment_method}>
                <p>
                    <a href="<{$payment_method.url}>" class="btn btn-success">
                        <{$payment_method.name|htmlspecialchars}>
                    </a>
                </p>
            <{/foreach}>
        </div>
    </div>
<{/block}>
