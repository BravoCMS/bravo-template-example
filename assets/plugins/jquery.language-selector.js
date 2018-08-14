
jQuery(function ($) {
    $(document).on('mouseenter', '.js-l-control-group', function (e) {
        if (!$(this).hasClass('open')) {
            $(this).find('.js-l-control-button').trigger('click');
        }
    });

    $(document).on('mouseleave', '.js-l-control-group', function (e) {
        if ($(this).hasClass('open')) {
            $(this).find('.js-l-control-button').trigger('click');
        }
    });

    $(document).on('click', '.js-l-control', function (e) {
        e.preventDefault();
        // Get Scope
        var $scope = $(this).closest('.js-l-scope');

        if ($scope.length) {
            // Activate Selectees
            $scope.find('.js-l-selectee').addClass('hide').filter('[code=' + $(this).attr('code') + ']').removeClass('hide');
            // Activate Controls
            $scope.find('.js-l-control').removeClass('active').filter('[code=' + $(this).attr('code') + ']').addClass('active');
            // Set Active Text
            $scope.find('.js-l-active').text($(this).text());

            // Set focus on only field
            var $input = $scope.find('.js-l-selectee[code=' + $(this).attr('code') + '] input[type=text]');
            if ($input.length === 1) {
                $input.focus();
            }
        }
    });

    // restore state after load
    var rememberData = $.cookie('language-selector-remember');
    $.removeCookie('language-selector-remember', {path: '/'});

    if (rememberData) {
        rememberData = JSON.parse(rememberData);
    }

    if (rememberData) {
        $.each(rememberData, function (id, code) {
            var $selector = $('.js-l-control[data-remember="' + id + '"][code="' + code + '"]');
            if (!$selector.hasClass('active')) {
                $selector.trigger('click');
            }
        });
    }

    // remember state before unload
    $(window).on('unload', function () {
        rememberData = {};

        $('.js-l-control.active[data-remember]').each(function () {
            rememberData[$(this).data('remember')] = $(this).attr('code');
        });

        $.cookie('language-selector-remember', JSON.stringify(rememberData), {path: '/'});
    });
});
