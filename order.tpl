
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /order.tpl
<{/block}>

<{block name=title}>
    Оформление заказа
<{/block}>

<{block name="module"}>
    <{if $customer.is_guest}>
        <script>
            jQuery(function ($) {
                if (!$.cookie('order-form-sign-in-hidden')) {
                    $('#order-form-sign-in').modal('show').on('hidden.bs.modal', function () {
                        $.cookie('order-form-sign-in-hidden', 1);
                    });

                    var isAlert = true;
                    $('#order-form-sign-in').modal('show').on('hide.bs.modal', function (e) {
                        if (isAlert) {
                            $('.js-order-form-sign-in-alert').removeClass('hide');

                            e.preventDefault();
                            isAlert = false;
                        }
                    });
                }
            });
        </script>
        <div class="modal" role="dialog" id="order-form-sign-in">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            Войдите для быстрого оформления заказа
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-warning hide js-order-form-sign-in-alert">
                            <h4 class="alert-heading">Уверены что не хотите зарегистрироваться?</h4>
                            <p>Нажмите еще раз, чтобы продолжить.</p>
                        </div>
                        Регистрация с помощью социальных сетей займет у Вас 10 секунд. А мы сможем информировать Вас о статусе Вашего заказа.
                    </div>
                    <div class="modal-footer">
                        <a href="<{account_sign_in_url}>" class="btn btn-success">
                            <{t "Войти"}>
                        </a>
                        <a class="btn btn-outline-secondary" data-dismiss="modal">
                            Оформить заказ без регистрации
                        </a>
                    </div>
                </div>
            </div>
        </div>
    <{/if}>

    <div class="row">
        <div class="col-lg-4">
            <{order_form}>
            <{if $customer.is_guest}>
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active">
                            Без регистрации
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<{account_sign_in_url}>">
                            Быстрый вход
                        </a>
                    </li>
                </ul>

                <div class="form-group">
                    <label for="order-name">
                        Имя
                    </label>
                    <input type="text" name="customer[name]" class="form-control" id="order-name" />
                </div>

                <div class="form-group">
                    <label for="order-last-name">
                        Фамилия
                    </label>
                    <input type="text" name="customer[last_name]" class="form-control" id="order-last-name" />
                </div>

                <div class="form-group">
                    <label for="order-email">
                        Почта
                    </label>
                    <input type="email" name="customer[email]" class="form-control" id="order-email" />
                </div>

            <{/if}>

            <div class="form-group">
                <label>
                    Телефон
                </label>

                <{if $layout_basket.phones|count}>
                    <script>
                        jQuery(function ($) {
                            $('.js-order-phone-select').on('change', function () {
                                if ($(this).val() == '0') {
                                    $('.js-order-phone-text').removeClass('hide');
                                } else {
                                    $('.js-order-phone-text').addClass('hide');
                                }
                            });
                        });
                    </script>

                    <select name="phone_id" class="form-control js-order-phone-select">
                        <option value="0">
                            Указать другой номер
                        </option>
                        <{foreach $layout_basket.phones as $phone}>
                            <option value="<{$phone.id}>"<{if $phone@first}> selected="selected"<{/if}>>
                                <{$phone.number|htmlspecialchars}>
                            </option>
                        <{/foreach}>
                    </select>

                    <input type="text" name="phone" class="form-control hide js-order-phone-text" />
                <{else}>
                    <input type="text" name="phone" class="form-control" />
                <{/if}>
            </div>

            <{if $layout_basket.delivery|count > 1}>
                <script>
                    jQuery(function ($) {
                        $('.js-order-delivery-select').on('change', function () {
                            $('.js-order-delivery').addClass('hide');
                            $('.js-order-delivery-' + $(this).val()).removeClass('hide');
                        });
                    });
                </script>

                <div class="form-group">
                    <label for="order-delivery">
                        Способ доставки
                    </label>
                    <select name="delivery_id" class="form-control js-order-delivery-select" id="order-delivery">
                        <{foreach $layout_basket.delivery as $delivery}>
                            <option value="<{$delivery.id}>">
                                <{$delivery.name|htmlspecialchars}>
                            </option>
                        <{/foreach}>
                    </select>
                </div>
            <{/if}>

            <{if $layout_basket.payment|count > 1}>
                <div class="form-group">
                    <label for="order-payment">
                        Способ оплаты
                    </label>
                    <select name="payment_id" class="form-control" id="order-payment">
                        <{foreach $layout_basket.payment as $payment}>
                            <option value="<{$payment.id}>">
                                <{$payment.name|htmlspecialchars}>
                            </option>
                        <{/foreach}>
                    </select>
                </div>
            <{/if}>

            <div class="form-group">
                <label>
                    Улица, номер дома, квартира, дополнительно...
                </label>
                <{if $layout_basket.address|count}>
                    <script>
                        jQuery(function ($) {
                            $('.js-order-address-select').on('change', function () {
                                if ($(this).val() == '0') {
                                    $('.js-order-address-text').removeClass('hide');
                                } else {
                                    $('.js-order-address-text').addClass('hide');
                                }
                            });
                        });
                    </script>

                    <select name="address_id" class="form-control js-order-address-select">
                        <option value="0">
                            Указать другой адрес
                        </option>
                        <{foreach $layout_basket.address as $address}>
                            <option value="<{$address.id}>"<{if $address@first}> selected="selected"<{/if}>>
                                <{$address.text|htmlspecialchars}>
                            </option>
                        <{/foreach}>
                    </select>

                    <div class="input-group hide js-order-address-text">
                        <input type="text" name="address[street]" class="form-control" style="width: 50%;" />
                        <input type="text" name="address[number]" class="form-control" style="width: 25%;" />
                        <input type="text" name="address[apartment]" class="form-control" style="width: 25%;" />
                    </div>
                    <textarea name="address[address]" class="form-control hide js-order-address-text" rows="2"></textarea>
                <{else}>
                    <div class="input-group">
                        <input type="text" name="address[street]" class="form-control" style="width: 50%;" />
                        <input type="text" name="address[number]" class="form-control" style="width: 25%;" />
                        <input type="text" name="address[apartment]" class="form-control" style="width: 25%;" />
                    </div>
                    <textarea name="address[address]" class="form-control" rows="2"></textarea>
                <{/if}>
            </div>

            <div class="form-group">
                <label for="order-comment">
                    Комментарий к заказу
                </label>
                <textarea name="comment" class="form-control" id="order-comment" rows="5"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">
                <{t "Подтвердить"}>
            </button>
            <{/order_form}>
        </div>
        <div class="col-lg-8">
            <{foreach $layout_basket.items as $item}>
                <div class="row js-basket-item">
                    <div class="col-lg-4">
                        <{if $item.article.cover}>
                            <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">
                                <img src="<{$item.article.cover.photo_file_small}>" style="width: 100%;" />
                            </a>
                        <{/if}>
                    </div>
                    <div class="col-lg-4">
                        <{basket_form class="js-basket-item-form form-inline"}>
                        <div class="input-group">
                            <input type="text" name="article[<{$item.article.id}>]" class="form-control js-basket-item-count" style="width:50px;" value="<{$item.count}>" />
                            <label class="input-group-text">
                                X <{$item.article.price.html}>
                            </label>
                            <button type="submit" class="btn btn-outline-success">
                                ОК
                            </button>
                        </div>
                        <{/basket_form}>

                        <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">
                            <{$item.article.short_name|htmlspecialchars}>
                        </a>
                    </div>
                    <div class="col-lg-4">
                        <{$item.summary.html}>

                        <button type="button" class="close js-basket-item-delete">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                </div>
            <{/foreach}>

            <div class="row">
                <div class="col-lg-4">
                    <{t "Выбрано {count,plural, one{# товар} few{# товара} many{# товаров} other{# товаров}} на сумму" count=$layout_basket.count}>
                </div>
                <div class="col-lg-4">
                </div>
                <div class="col-lg-4">
                    <{$layout_basket.subtotal.html}>
                </div>
            </div>

            <{foreach $layout_basket.delivery as $delivery}>
                <{if $delivery.is_show}>
                    <div class="row<{if !$delivery@first}> hide<{/if}> js-order-delivery js-order-delivery-<{$delivery.id}>">
                        <div class="col-lg-4">
                            <{$delivery.name|htmlspecialchars}>
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-4">
                            <{$delivery.cost.html}>
                        </div>
                    </div>

                    <div class="row<{if !$delivery@first}> hide<{/if}> js-order-delivery js-order-delivery-<{$delivery.id}>">
                        <div class="col-lg-4">
                            <{t "Итого"}>
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-4">
                            <{$delivery.total.html}>
                        </div>
                    </div>
                <{/if}>
            <{/foreach}>
        </div>
    </div>
<{/block}>
