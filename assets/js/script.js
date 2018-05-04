
jQuery(function ($) {

});

//Start of--------------------------------Votes & Views-------------------------
jQuery(function ($) {
    /*TODO: update to real count? 
     $('.js-views').each(function () {
     $.ajax({
     url: '/ajax/views/',
     data: {
     element_id: $(this).data('element-id'),
     element_type: $(this).data('element-type'),
     action: $(this).data('action'),
     },
     method: 'GET',
     dataType: 'jsonp',
     context: this,
     success: function (data) {
     if (data.views) {
     $(this).html(t.text('js_total_views') + "\n<span class='views-count'>" + data.views + "</span>");
     $(this).trigger('loaded');
     }
     }
     });
     });*/

    $('.js-votes').each(function () {
        $.ajax({
            url: '/ajax/votes/',
            data: {
                element_id: $(this).data('element-id'),
                element_type: $(this).data('element-type'),
                action: $(this).data('action'),
            },
            method: 'GET',
            dataType: 'jsonp',
            context: this,
            success: function (data) {
                if (data) {
                    var htmlCode = "<span class='votes-label'>" + t('Всего голосов:') + "</span>\n<span class='votes-count'>" + data.votes + "</span>";

                    if (data.can_vote) {
                        htmlCode += '<div class="vote js-vote">' + t('Проголосовать') + '</div>';
                    }

                    $(this).html(htmlCode);
                    $(this).trigger('loaded');
                }
            }
        });
    });

    $('.js-votes').on('click', '.js-vote', function () {
        var $votes = $(this).closest('.js-votes');

        $.ajax({
            url: '/ajax/votes/',
            data: {
                element_id: $votes.data('element-id'),
                element_type: $votes.data('element-type'),
                action: $votes.data('action'),
            },
            method: 'POST',
            dataType: 'jsonp',
            context: $votes,
            success: function (data) {
                if (data) {
                    var htmlCode = "<span class='votes-label'>" + t('Всего голосов:') + "</span>\n<span class='votes-count'>" + data.votes + "</span>";

                    if (data.can_vote) {
                        htmlCode += '<div class="vote js-vote">' + t('Проголосовать') + '</div>';
                    }

                    if (data.error === 'authorization_required') {
                        htmlCode += '<div class="vote">' + t('Необходимо авторизоваться') + '</div>';
                    }

                    $(this).html(htmlCode);
                    $(this).trigger('voted');
                }
            }
        });
    });
});
//End of---------------------------------Votes & Views--------------------------
