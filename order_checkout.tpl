
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /order_checkout.tpl
<{/block}>

<{block name=title}>
    <{t 'Select_a_payment_option'}>
<{/block}>

<{block name="module"}>
    <div class="row">
        <div class="col-lg-12">
            <h1>
                <{t 'Your_order_number'}> #<{$order.id}>.
            </h1>
            
        </div>
    </div>
<{/block}>
