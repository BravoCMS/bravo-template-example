
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /order_checkout.tpl
<{/block}>

<{block name=title}>
    <{t 'Select_a_payment_option'}>
<{/block}>

<{block name="module"}>
    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label>
                    <b>
                        Номер заказа
                    </b>
                </label>
                <input type="text" class="form-control" readonly="readonly" value="<{$order.id|escape}>" />
            </div>

            <div class="form-group">
                <label>
                    Статус заказа
                </label>
                <input type="text" class="form-control" readonly="readonly" value="<{$order.status_translation|escape}>" />
            </div>

            <div class="form-group">
                <label>
                    Статус оплаты заказа
                </label>
                <input type="text" class="form-control" readonly="readonly" value="<{$order.payment_status_translation|escape}>" />
            </div>

            <div class="form-group">
                <label>
                    Имя
                </label>
                <input type="text" class="form-control" readonly="readonly" value="<{$order.customer_name|escape}>" />
            </div>

            <div class="form-group">
                <label for="order-last-name">
                    Фамилия
                </label>
                <input type="text" class="form-control" readonly="readonly" value="<{$order.customer_last_name|escape}>" />
            </div>

            <div class="form-group">
                <label for="order-email">
                    Почта
                </label>
                <input type="text" class="form-control" readonly="readonly" value="<{$order.customer_display_email|escape}>" />
            </div>

            <div class="form-group">
                <label>
                    Телефон
                </label>
                <input type="text" class="form-control" readonly="readonly" value="<{$order.phone|escape}>" />
            </div>

            <{if $order.delivery_type_name}>
                <div class="form-group">
                    <label>
                        Способ доставки
                    </label>
                    <input type="text" class="form-control" readonly="readonly" value="<{$order.delivery_type_name|escape}>" />
                </div>
            <{/if}>

            <{if $order.payment_type_name}>
                <div class="form-group">
                    <label>
                        Способ оплаты
                    </label>
                    <input type="text" class="form-control" readonly="readonly" value="<{$order.payment_type_name|escape}>" />
                </div>
            <{/if}>

            <{if $order.zip}>
                <div class="form-group">
                    <label>
                        Индекс
                    </label>
                    <input type="text" class="form-control" readonly="readonly" value="<{$order.zip|escape}>" />
                </div>
            <{/if}>

            <{if $order.country}>
                <div class="form-group">
                    <label>
                        Страна
                    </label>
                    <input type="text" class="form-control" readonly="readonly" value="<{$order.country|escape}>" />
                </div>
            <{/if}>

            <{if $order.region}>
                <div class="form-group">
                    <label>
                        Регион
                    </label>
                    <input type="text" class="form-control" readonly="readonly" value="<{$order.region|escape}>" />
                </div>
            <{/if}>

            <{if $order.city}>
                <div class="form-group">
                    <label>
                        Город
                    </label>
                    <input type="text" class="form-control" readonly="readonly" value="<{$order.city|escape}>" />
                </div>
            <{/if}>

            <div class="form-group">
                <label>
                    Улица, номер дома, квартира, дополнительно...
                </label>

                <div class="input-group">
                    <input type="text" class="form-control" style="width: 50%;" readonly="readonly" value="<{$order.street|escape}>" />
                    <input type="text" class="form-control" style="width: 25%;" readonly="readonly" value="<{$order.number|escape}>" />
                    <input type="text" class="form-control" style="width: 25%;" readonly="readonly" value="<{$order.apartment|escape}>" />
                </div>
                <textarea class="form-control" rows="2" readonly="readonly"><{$order.address|htmlspecialchars}></textarea>
            </div>

            <div class="form-group">
                <label>
                    Комментарий к заказу
                </label>
                <textarea class="form-control" rows="5" readonly="readonly"><{$order.comment|htmlspecialchars}></textarea>
            </div>
        </div>
        <div class="col-lg-8">
            <{foreach $order.items as $item}>
                <div class="row">
                    <div class="col-lg-4">
                        <{if $item.article.cover}>
                            <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">
                                <img src="<{$item.article.cover.photo_file_small}>" style="width: 100%;" />
                            </a>
                        <{/if}>
                    </div>
                    <div class="col-lg-4">
                        <div class="input-group">
                            <input type="text" class="form-control" style="width:50px;" readonly="readonly" value="<{$item.count|escape}>" />
                            <label class="input-group-text">
                                X <{$item.article.price.html}>
                            </label>
                        </div>

                        <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">
                            <{$item.article.short_name|htmlspecialchars}>
                        </a>
                    </div>
                    <div class="col-lg-4">
                        <{$item.summary.html}>
                    </div>
                </div>
            <{/foreach}>

            <div class="row">
                <div class="col-lg-4">
                    <{t "Заказ на {count,plural, one{# товар} few{# товара} many{# товаров} other{# товаров}} на сумму" count=$order.count}>
                </div>
                <div class="col-lg-4">
                </div>
                <div class="col-lg-4">
                    <{$order.summary_goods.html}>
                </div>
            </div>

            <{if $order.summary_taxes.price > 0}>
                <div class="row">
                    <div class="col-lg-4">
                        Налог
                        <{$order.summary_tax_rate * 100}>%
                    </div>
                    <div class="col-lg-4">
                    </div>
                    <div class="col-lg-4">
                        <{$order.summary_taxes.html}>
                    </div>
                </div>
            <{/if}>

            <{if $order.summary_delivery && $order.summary_delivery.price > 0}>
                <div class="row">
                    <div class="col-lg-4">
                        <{$order.delivery_type_name|htmlspecialchars}>
                    </div>
                    <div class="col-lg-4">
                    </div>
                    <div class="col-lg-4">
                        <{$order.summary_delivery.html}>
                    </div>
                </div>
            <{/if}>

            <div class="row">
                <div class="col-lg-4">
                    <{t "Итого"}>
                </div>
                <div class="col-lg-4">
                </div>
                <div class="col-lg-4">
                    <{$order.summary_total.html}>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <h1>
                        Выберите вариант оплаты заказа
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
        </div>
    </div>
<{/block}>
