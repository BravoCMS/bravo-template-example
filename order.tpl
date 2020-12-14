
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /order.tpl
<{/block}>

<{block name=title}>
    <{t 'Checkout'}>
<{/block}>

<{block name="module"}>
    <{if $customer.is_guest}>
        <script>
            require(['jquery', 'js-cookie', 'bootstrap'], function ($, cookie) {
                if (!cookie.get('order-form-sign-in-hidden')) {
                    $('#order-form-sign-in').modal('show').on('hidden.bs.modal', function () {
                        cookie.set('order-form-sign-in-hidden', '1', {path: '/'});
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
                            <{t 'Login_for_quick_checkout'}>
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-warning hide js-order-form-sign-in-alert">
                            <h4 class="alert-heading"><{t 'want_to_register'}></h4>
                            <p><{t 'Click_again_to'}></p>
                        </div>
                        <{t 'reg_social'}>
                    </div>
                    <div class="modal-footer">
                        <a href="<{account_sign_in_url}>" class="btn btn-success">
                            <{t "Войти"}>
                        </a>
                        <a class="btn btn-outline-secondary" data-dismiss="modal">
                            <{t 'Checkout_without_registration'}>
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
                            <{t 'I_m_new'}><br><{t 'buyer'}>		
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<{account_sign_in_url}>">
                            <{t 'I_m_already_here'}><br><{t 'bought'}>
                        </a>
                    </li>
                </ul>

                <div class="form-group">
                    <label for="order-name">
                        <{t 'Name' }>
                    </label>
                    <input type="text" name="customer[name]" class="form-control" id="order-name" />
                </div>

                <div class="form-group">
                    <label for="order-last-name">
                        <{t 'Surname'}>*
                    </label>
                    <input type="text" name="customer[last_name]" class="form-control" id="order-last-name" />
                </div>

                <div class="form-group">
                    <label for="order-email">
                        <{t 'Mail'}>*
                    </label>
                    <input type="email" name="customer[email]" class="form-control" id="order-email" />
                </div>

            <{/if}>

            <div class="form-group">
                <label>
                    <{t 'Telephone'}>*
                </label>

                <{if $layout_basket.phones|count}>
                    <script>
                        require(['jquery'], function ($) {
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
                    require(['jquery'], function ($) {
                        $('.js-order-delivery-select').on('change', function () {
                            $('.js-order-delivery').addClass('hide');
                            $('.js-order-delivery-' + $(this).val()).removeClass('hide');
                        });
                    });
                </script>

                <div class="form-group">
                    <label for="order-delivery">
                        <{t 'Delivery_method'}>
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
                        <{t 'Payment_method'}>
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

            <script>
                require(['jquery'], function ($) {
                    $.ajax({
                        url: "<{order_country_list_url}>",
                        success: function (data) {
                            if (data.country_list.length) {
                                $('.js-order-country-text').addClass('hide').removeAttr('id');
                                $('.js-order-country-select').removeClass('hide').attr('id', 'order-country');

                                $(data.country_list).each(function (i, e) {
                                    var selected = '';
                                    if (e.default == 1) {
                                        selected = ' selected="selected"';
                                    }

                                    $('.js-order-country-select').append('<option value="' + e.id + '" data-tax="' + e.tax + '" data-tax-rate="' + e.tax_rate + '"' + selected + '>' + e.name + '</option>');
                                    $('.js-order-country-select').trigger('change');
                                });
                            }
                        }
                    });

                    $regionXhr = false;
                    $(document).on('change', '.js-order-country-select', function () {
                        var $option = $(this).find('option:selected');
                        if ($option.length) {
                            $('.js-order-region-select').html('').addClass('hide').removeAttr('id');
                            $('.js-order-region-text').addClass('hide').removeAttr('id');
                            applyTax($option.text(), $option.data('tax'), $option.data('tax-rate'));

                            if ($regionXhr) {
                                $regionXhr.abort();
                            }
                            $regionXhr = $.ajax({
                                url: "<{order_region_list_url}>?country_id=" + $option.attr('value'),
                                success: function (data) {
                                    if (data.region_list.length) {
                                        $('.js-order-region-select').removeClass('hide').attr('id', 'order-country');

                                        $(data.region_list).each(function (i, e) {
                                            var selected = '';
                                            if (e.default == 1) {
                                                selected = ' selected="selected"';
                                            }

                                            $('.js-order-region-select').append('<option value="' + e.id + '" data-tax="' + e.tax + '" data-tax-rate="' + e.tax_rate + '"' + selected + '>' + e.name + '</option>');
                                            $('.js-order-region-select').trigger('change');
                                        });
                                    } else {
                                        $('.js-order-region-text').removeClass('hide').attr('id', 'order-region');
                                    }
                                }
                            });
                        } else {
                            $('.js-order-region-select').html('').addClass('hide').removeAttr('id');
                            $('.js-order-region-text').removeClass('hide').attr('id', 'order-region');
                            applyTax('', 0, 0);
                        }
                    });

                    $(document).on('change', '.js-order-region-select', function () {
                        var $option = $(this).find('option:selected');
                        if ($option.length) {
                            applyTax($option.text(), $option.data('tax'), $option.data('tax-rate'));
                        } else {
                            $('.js-order-country-select').trigger('change');
                        }
                    });

                    function applyTax(taxRegionName, tax, taxRate) {
                        tax = parseFloat(tax);
                        tax = tax ? tax : 0;
                        taxRate = parseFloat(taxRate);
                        taxRate = taxRate ? taxRate : 0;
                        var subTotal = parseFloat(<{$layout_basket.subtotal.price}>);
                        var taxValue = Math.round(subTotal * taxRate * 100) / 100;

                        var $summary = $('.js-order-tax-summary');
                        if (taxRate > 0) {
                            $summary.find('.js-order-tax-summary-percent').html(tax + '%');
                            $summary.find('.js-order-tax-summary-value').html(taxValue);
                            $summary.find('.js-order-tax-summary-text').html('(' + taxRegionName + ')');
                        } else {
                            $summary.find('.js-order-tax-summary-percent').html('');
                            $summary.find('.js-order-tax-summary-value').html('');
                            $summary.find('.js-order-tax-summary-text').html('');
                        }

                        $('.js-order-total-value').each(function () {
                            if (taxValue) {
                                $(this).html(taxValue + $(this).data('value'));
                            } else {
                                $(this).html($(this).data('text'));
                            }
                        });
                    }
                });
            </script>

            <div class="form-group">
                <label for="order-country">
                    Страна
                </label>
                <select name="address[country_id]" class="form-control js-order-country-select hide">
                </select>
                <input type="text" name="address[country]" class="form-control js-order-country-text" id="order-country">
            </div>

            <div class="form-group">
                <label for="order-region">
                    Регион
                </label>
                <select name="address[region_id]" class="form-control js-order-region-select hide">
                </select>
                <input type="text" name="address[region]" class="form-control js-order-region-text" id="order-region">
            </div>

            <div class="form-group">
                <{if $layout_basket.address|count}>
                    <script>
                        require(['jquery'], function ($) {
                            $('.js-order-address-select').on('change', function () {
                                if ($(this).val() == '0') {
                                    $('.js-order-address-text').removeClass('hide');
                                } else {
                                    $('.js-order-address-text').addClass('hide');
                                }
                            });
                        });
                    </script>

                    <label>
                        <{t 'Street_house_number_apartment_additionally'}>
                    </label>
                    <select name="address_id" class="form-control js-order-address-select">
                        <option value="0">
                            <{t 'Specify_a_different_address'}>
                        </option>
                        <{foreach $layout_basket.address as $address}>
                            <option value="<{$address.id}>"<{if $address@first}> selected="selected"<{/if}>>
                                <{$address.text|htmlspecialchars}>
                            </option>
                        <{/foreach}>
                    </select>

                    <div class="input-group hide js-order-address-text">
                        <input type="text" name="address[street]" placeholder="<{t 'Street2'}>" class="form-control" style="width: 50%;" />
                        <input type="text" name="address[number]" placeholder="<{t 'Number'}>" class="form-control" style="width: 25%;" />
                        <input type="text" name="address[apartment]" placeholder="<{t 'Apartment'}>" class="form-control" style="width: 25%;" />
                    </div>
                    <textarea name="address[address]" placeholder="<{t 'Address'}> class="form-control hide js-order-address-text" rows="2"></textarea>
                <{else}>
                    <label for="order-zip">
                        Индекс
                    </label>
                    <input type="text" name="address[zip]" class="form-control" id="order-zip" />

                    <label for="order-city">
                        Населенный пункт
                    </label>
                    <input type="text" name="address[city]" class="form-control" id="order-city" />

                    <label>
                        Улица, номер дома, квартира, дополнительно...
                    </label>
                    <div class="input-group">
                        <input type="text" name="address[street]" placeholder="<{t 'Street2'}>" class="form-control" style="width: 50%;" />
                        <input type="text" name="address[number]" placeholder="<{t 'Number'}>" class="form-control" style="width: 25%;" />
                        <input type="text" name="address[apartment]" placeholder="<{t 'Apartment'}>" class="form-control" style="width: 25%;" />
                    </div>
                    <textarea name="address[address]" placeholder="<{t 'Address'}> class="form-control" rows="2"></textarea>
                <{/if}>
            </div>

            <div class="form-group">
                <label for="order-comment">
                    <{t 'Comment_on_the_order'}>
                </label>
                <textarea name="comment" class="form-control" id="order-comment" rows="5"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">
                <{t "Оформить заказ"}>
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

            <div class="row js-order-tax-summary">
                <div class="col-lg-4" title="Подсчитанная сумма приблизительна, финальный расчет может немного отличаться!">
                    Налог*
                    <span class="js-order-tax-summary-percent">
                    </span>
                    <span class="js-order-tax-summary-text">
                    </span>
                </div>
                <div class="col-lg-4">
                </div>
                <div class="col-lg-4 js-order-tax-summary-value">
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
                        <div class="col-lg-4 js-order-total-value" data-value="<{$delivery.total.price|escape}>" data-text="<{$delivery.total.html|escape}>">
                            <{$delivery.total.html}>
                        </div>
                    </div>
                <{/if}>
            <{/foreach}>
        </div>
    </div>
<{/block}>
