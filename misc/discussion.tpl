
<{if $discussion.is_active}>
    <{if $discussion.is_guest_review || !$customer.is_guest}>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#discussion-form" id="discussion-anchor">
            <{t 'Write_a_feedback'}>
        </button>
    <{else}>
        <a href="<{account_sign_in_url '#discussion-anchor' message='Авторизоваться чтобы написать отзыв'}>" class="btn btn-primary" id="discussion-anchor">
            <{t 'Log_in_to'}>
        </a>
    <{/if}>

    <{foreach $discussion.thread as $post}>
        <div class="js-discussion-post" id="discussion-post-<{$post.id}>">
            <p>
                <b class="js-discussion-post-author">
                    <{if $post.customer && $post.image}>
                        <a href="<{$post.customer.relative_url}>">
                            <img src="<{$post.image}>" width="50" class="img-thumbnail" />
                        </a>
                    <{elseif $post.image}>
                        <img src="<{$post.image}>" width="50" class="img-thumbnail" />
                    <{/if}>

                    <{if $post.customer}>
                        <a href="<{$post.customer.relative_url}>">
                            <{$post.author|htmlspecialchars}>
                        </a>
                    <{elseif $post.author}>
                        <{$post.author|htmlspecialchars}>
                    <{else}>
                        <{t "Anonymous" }>
                    <{/if}>

                    <{if $post.is_authorized}>
                        <b title="Авторизован">
                            A
                        </b>
                    <{/if}>
                </b>

                <{if $discussion.is_guest_review || !$customer.is_guest}>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#discussion-form" data-post-id="<{$post.id}>">
                        <{t "Reply_to_review" }>
                    </button>
                <{else}>
                    <a href="<{account_sign_in_url '#discussion-anchor' message='Авторизоваться чтобы написать отзыв'}>" class="btn btn-primary">
                        <{t "Log_in_to_reply" }>
                    </a>
                <{/if}>
            </p>

            <div class="js-discussion-post-comment">
                <p>
                    <{$post.comment|htmlspecialchars|nl2br}>
                </p>

                <{if $post.pros}>
                    <p>
                        <b><{t "Pros" }>:</b><br />
                        <{$post.pros|htmlspecialchars|nl2br}>
                    </p>
                <{/if}>

                <{if $post.cons}>
                    <p>
                        <b><{t 'Minuses' }>:</b><br />
                        <{$post.cons|htmlspecialchars|nl2br}>
                    </p>
                <{/if}>
            </div>

            <{if $discussion.is_votes}>
                <div class="votes js-votes" data-element-id="<{$post.id}>" data-element-type="discussion_post" data-action="view">
                    <span class="votes-label">
                        <{t "Всего голосов:"}>
                    </span>
                    <span class="votes-count">
                        <{$post.votes_count}>
                    </span>
                </div>
            <{/if}>
        </div>

        <{include 'misc/discussion_answers.tpl' post=$post answerLevel=1 answers=$post.answers}>

    <{/foreach}>

    <{include 'misc/pagination.tpl' pagination_fragment='#discussion-anchor'}>

    <{discussion_form_success $discussion}>
    <script>
        require(['jquery'], function ($) {
            $('#discussion-form-success').modal('show');

            $('#discussion-form-success').on('click', function () {
                $(this).modal('hide');
            });
        });
    </script>
    <div class="modal" role="dialog" id="discussion-form-success">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="alert alert-warning">
                    <h4 class="alert-heading"><{t 'has_been_added' }></h4>
                    <p><{t 'Thank' }>!</p>
                </div>
            </div>
        </div>
    </div>
    <{/discussion_form_success}>

    <{discussion_form_error $discussion 'reason'}>
    <script>
        require(['jquery'], function ($) {
            $('#discussion-form-error').modal('show');

            $('#discussion-form-error').on('click', function () {
                $(this).modal('hide');
            });
        });
    </script>
    <div class="modal" role="dialog" id="discussion-form-error">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="alert alert-warning">
                    <h4 class="alert-heading"><{t 'not_been_added' }></h4>
                    <p><{t 'Please_try_again_later' }></p>
                    <{if $reason}>
                        <p>
                            <{t 'Cause' }>:<br />
                            <{$reason|nl2br}>
                        </p>
                    <{/if}>
                </div>
            </div>
        </div>
    </div>
    <{/discussion_form_error}>

    <{if $discussion.is_guest_review || !$customer.is_guest}>
        <script>
            require(['jquery'], function ($) {
                $('#discussion-form').on('show.bs.modal', function (e) {
                    var postId = parseInt($(e.relatedTarget).data('post-id'));
                    // could be NaN
                    postId = postId > 1 ? postId : 0;

                    $('#discussion-form-post-id').val(postId);
                    if (postId) {
                        $(this).find('.js-discussion-new').addClass('d-none');
                        $(this).find('.js-discussion-respond').removeClass('d-none');

                        $(this).find('.js-discussion-respond-comment').html($(e.relatedTarget).closest('.js-discussion-post').find('.js-discussion-post-comment').html());
                        $(this).find('.js-discussion-respond-to').html($(e.relatedTarget).closest('.js-discussion-post').find('.js-discussion-post-author').html().trim());
                    } else {
                        $(this).find('.js-discussion-new').removeClass('d-none');
                        $(this).find('.js-discussion-respond').addClass('d-none');
                    }
                });
            });
        </script>
        <div class="modal" role="dialog" id="discussion-form">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <{discussion_form $discussion return_url="#discussion-anchor"}>
                    <input type="hidden" name="answer_to_discussion_post_id" id="discussion-form-post-id" value="0" />

                    <div class="modal-header">
                        <h5 class="modal-title js-discussion-new"><{t 'Write_a_feedback' }></h5>
                        <h5 class="modal-title js-discussion-respond"><{t 'Reply_to_review' }></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="js-discussion-respond">
                            <{t 'Reply_to_review' }>
                            <b class="js-discussion-respond-to"></b>:
                            <blockquote class="js-discussion-respond-comment">
                            </blockquote>
                        </div>

                        <div class="form-group">
                            <textarea class="form-control" name="comment" rows="10" aria-required="true" placeholder="<{t 'Review_text' }>"></textarea>
                        </div>

                        <{if $discussion.is_pros}>
                            <div class="form-group js-discussion-new">
                                <label for="discussion-pros-field">Плюсы</label>
                                <textarea class="form-control" name="pros" id="discussion-pros-field" rows="5" aria-required="true" placeholder="<{t 'Describe_the_pros' }>"></textarea>
                            </div>
                        <{/if}>

                        <{if $discussion.is_cons}>
                            <div class="form-group js-discussion-new">
                                <label for="discussion-cons-field">Минусы</label>
                                <textarea class="form-control" name="cons" id="discussion-cons-field" rows="5" aria-required="true" placeholder="<{t 'Describe_the_cons' }>"></textarea>
                            </div>
                        <{/if}>

                        <{if $customer.is_guest}>
                            <div class="form-group">
                                <label for="discussion-author-field"><{t 'Your_name' }></label>
                                <input type="text" class="form-control" name="author" id="discussion-author-field" placeholder="<{t 'Name' }>" />
                            </div>
                        <{/if}>

                        <{if $discussion.is_rating}>
                            <div class="form-group js-discussion-new">
                                <label for="discussion-rating-field"><{t 'Rate' }></label>
                                <select class="form-control" name="rating" id="discussion-rating-field">
                                    <option value="1">
                                        <{t 'Sad_shit' }>
                                    </option>
                                    <option value="2">
                                        <{t 'Very_bad' }>
                                    </option>
                                    <option value="3">
                                        <{t 'poorly' }>
                                    </option>
                                    <option value="4">
                                        <{t 'Sad' }>
                                    </option>
                                    <option value="5" selected="selected">
                                        <{t 'Will_do' }>
                                    </option>
                                </select>
                            </div>
                        <{/if}>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary"><{t 'Send' }></button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"><{t 'Cancel' }></button>
                    </div>
                    <{/discussion_form}>
                </div>
            </div>
        </div>
    <{/if}>
<{/if}>
