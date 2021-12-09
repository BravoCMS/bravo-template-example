
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /catalog.tpl
<{/block}>

<{block name=title}>
    <{$article.title|htmlspecialchars}>
<{/block}>

<{block name=head append}>
    <meta property="og:image" content="<{absolute_url $article.cover.photo_file_small}>" />
<{/block}>

<{block name="module"}>
    <div class="row">
        <div class="col-lg-3">
            <{if $article.cover}>
                <a href="<{$article.cover.photo_file}>" title="<{$article.name|escape}>">
                    <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                </a>
            <{/if}>

            <{foreach $article.covers as $cover}>
                <a href="<{$cover.photo_file}>" title="<{$article.name|escape}>">
                    <img src="<{$cover.photo_file_small}>" style="width: 90%; margin: 10px 5% 0px;" />
                </a>
            <{/foreach}>
        </div>

        <div class="col-lg-9">
            <h1>
                <{$article.branded_name|htmlspecialchars}>
            </h1>

            <{if $article.part_number}>
                <{t 'Product_code'}>: <{$article.part_number|htmlspecialchars}><br />
            <{/if}>

            <{if $article.barcode}>
                <{t 'Barcode'}>: <{$article.barcode|htmlspecialchars}><br />
            <{/if}>

            <{if $article.availability_text}>
                <{t 'Availability'}>: <{$article.availability_text|htmlspecialchars}><br />
            <{/if}>

            <{if $article.price.price > 0}>
                <{$article.price.html}><br />
            <{/if}>

            <{if $article.availability_code != 'out_of_stock'}>
                <{basket_form article=$article return_url="#basket-modal"}>
                <button type="submit" class="btn btn-success">
                    <{t 'Buy'}>
                </button>
                <{/basket_form}>

                <button class="btn btn-primary" data-toggle="modal" data-target="#callback-form">
                    <{t 'Quick_order'}>
                </button>
            <{/if}>

            <div class="modal" role="dialog" id="callback-form">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <{callback_form}>
                        <div class="modal-header">
                            <h5 class="modal-title"><{t 'Quick_order'}></h5>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <label for="callback-form-name"><{t 'Your_name' }></label>
                                <input type="text" class="form-control" name="name" id="callback-form-name" />
                            </div>

                            <div class="form-group">
                                <label for="callback-form-phone"><{t 'Telephone' }></label>
                                <input type="text" class="form-control" name="phone" id="callback-form-phone" />
                            </div>

                            <div class="form-group">
                                <textarea class="form-control" name="text" rows="10" aria-required="true" placeholder="<{t 'Comment' }>"></textarea>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="js-recaptcha-button btn btn-primary"><{t 'Send' }></button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><{t 'Cancel' }></button>
                        </div>
                        <{/callback_form}>
                    </div>
                </div>
            </div>

            <{if $layout_contacts.catalog_phones}>
                <{t 'Or_call_us' }>:
                <a href="tel:<{$layout_contacts.catalog_phones.0.number|escape}>">
                    <{$layout_contacts.catalog_phones.0.number|htmlspecialchars}>
                </a>
            <{/if}>

            <{foreach $article.groups as $group}>
                <{if $group.settings.select}>
                    <div style="width:100%;">
                        <{$group.name|htmlspecialchars}>:

                        <select onchange="window.location = this.val;">
                            <{foreach $group.items as $item}>
                                <option value="<{$item.article.relative_url}>"<{if $item.is_active}> selected="selected"<{/if}>>
                                    <{$item.name|htmlspecialchars}>
                                </option>
                            <{/foreach}>
                        </select>
                    </div>
                <{else}>
                    <h2>
                        <{$group.name|htmlspecialchars}>
                    </h2>

                    <div class="row" style="width:100%;">
                        <{foreach $group.items as $item}>
                            <div class="col-lg-2<{if $item.is_active}> active<{/if}>">
                                <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>"<{if $item.color}> style="background-color: <{$item.color}>;"<{/if}>>
                                    <{$item.name|htmlspecialchars}>
                                </a><br />

                                <{if $group.settings.photo}>
                                    <{if $item.img}>
                                        <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">
                                            <img src="<{$item.img}>" style="width: 100%;" />
                                        </a><br />
                                    <{elseif $item.article.cover.photo_file_small}>
                                        <a href="<{$item.article.relative_url}>" title="<{$item.article.name|escape}>">
                                            <img src="<{$item.article.cover.photo_file_small}>" style="width: 100%;" />
                                        </a><br />
                                    <{/if}>
                                <{/if}>

                                <{if $group.settings.code && $item.article.part_number}>
                                    <{t 'Vendor_code'}>: <{$item.article.part_number|htmlspecialchars}><br />

                                    <{if $item.article.barcode}>
                                        <{t 'Barcode'}>: <{$item.article.barcode|htmlspecialchars}><br />
                                    <{/if}>
                                <{/if}>

                                <{if $group.settings.available && $item.article.availability_text}>
                                    <{$item.article.availability_text|htmlspecialchars}><br />
                                <{/if}>

                                <{if $group.settings.price && $item.article.price.price}>
                                    <{$item.article.price.html}>
                                <{/if}>

                                <{if $group.settings.buy}>
                                    <{basket_form article=$item.article return_url="#basket-modal"}>
                                    <button type="submit" class="btn btn-success">
                                        <{t 'Buy'}>
                                    </button>
                                    <{/basket_form}>
                                <{/if}>
                            </div>
                        <{/foreach}>
                    </div>
                <{/if}>
            <{/foreach}>

            <{* tabs *}>
            <{assign 'is_tab_active' 1}>

            <{foreach $article.tabs as $tab}>
                <{if $tab.id == 1 && $tab.is_hide == 0 && $article.text}>
                    <{* $tab.id == 1 => Общее описание *}>

                    <{capture append="tabs_links"}>
                        <li class="nav-item">
                            <a class="nav-link<{if $is_tab_active}> active<{/if}>" data-toggle="tab" href="#article-text-tab" id="article-text-tab-button">
                                <{$tab.name|htmlspecialchars}>
                            </a>
                        </li>
                    <{/capture}>

                    <{capture append="tabs_contents"}>
                        <div class="tab-pane fade<{if $is_tab_active}> show active<{/if}>" id="article-text-tab">
                            <{$article.text}>
                        </div>
                    <{/capture}>

                    <{assign 'is_tab_active' 0}>
                <{elseif $tab.id == 2 && $tab.is_hide == 0 && $article.covers}>
                    <{* $tab.id == 2 => Фото *}>

                    <{capture append="tabs_links"}>
                        <li class="nav-item">
                            <a class="nav-link<{if $is_tab_active}> active<{/if}>" data-toggle="tab" href="#article-photo-tab" id="article-photo-tab-button">
                                <{$tab.name|htmlspecialchars}>
                            </a>
                        </li>
                    <{/capture}>

                    <{capture append="tabs_contents"}>
                        <div class="tab-pane fade<{if $is_tab_active}> show active<{/if}>" id="article-photo-tab">
                            <{if $article.cover}>
                                <a href="<{$article.cover.photo_file}>" title="<{$article.name|escape}>">
                                    <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                                </a>
                            <{/if}>

                            <{foreach $article.covers as $cover}>
                                <a href="<{$cover.photo_file}>" title="<{$article.name|escape}>">
                                    <img src="<{$cover.photo_file_small}>" style="width: 90%; margin: 10px 5% 0px;" />
                                </a>
                            <{/foreach}>
                        </div>
                    <{/capture}>

                    <{assign 'is_tab_active' 0}>
                <{elseif $tab.id == 3 && $tab.is_hide == 0 && $article.parameters.tab}>
                    <{* $tab.id == 3 => Характеристики *}>

                    <{capture append="tabs_links"}>
                        <li class="nav-item">
                            <a class="nav-link<{if $is_tab_active}> active<{/if}>" data-toggle="tab" href="#article-parameters-tab" id="article-parameters-tab-button">
                                <{$tab.name|htmlspecialchars}>
                            </a>
                        </li>
                    <{/capture}>

                    <{capture append="tabs_contents"}>
                        <div class="tab-pane fade<{if $is_tab_active}> show active<{/if}>" id="article-parameters-tab">
                            <{foreach $article.parameters.tab as $group}>
                                <h2><{$group.name|htmlspecialchars}></h2>

                                <{foreach $group.children as $parameter}>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <{$parameter.name|htmlspecialchars}>
                                        </div>
                                        <div class="col-lg-8">
                                            <{foreach $parameter.values as $value}>
                                                <{$value.value|htmlspecialchars}>

                                                <{if $value.unit_short_name}>
                                                    <span class="parameter-unit">
                                                        <{$value.unit_short_name|htmlspecialchars}>
                                                    </span>
                                                <{/if}>
                                            <{/foreach}>
                                        </div>
                                    </div>
                                <{/foreach}>
                            <{/foreach}>
                        </div>
                    <{/capture}>

                    <{assign 'is_tab_active' 0}>

                <{elseif $tab.id == 4 && $tab.is_hide == 0}>
                    <{* $tab.id == 4 => Отзывы *}>

                    <{get_discussion "discussion" "pagination" element=$article page_query}>
                    <{if $discussion.is_active}>
                        <{if $discussion.thread}>
                            <{capture append="tabs_links"}>
                                <li class="nav-item">
                                    <a class="nav-link<{if $is_tab_active}> active<{/if}>" data-toggle="tab" href="#article-discussion-tab">
                                        <{$tab.name|htmlspecialchars}>(<{$discussion.thread|count}>)
                                    </a>
                                </li>
                            <{/capture}>

                            <{capture append="tabs_contents"}>
                                <div class="tab-pane fade<{if $is_tab_active}> show active<{/if}>" id="article-discussion-tab">
                                    <{if $discussion.is_guest_review || !$customer.is_guest}>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#discussion-form" id="discussion-anchor">
                                            <{t 'Write_a_feedback'}>
                                        </button>
                                    <{else}>
                                        <a href="<{account_sign_in_url '#discussion-anchor'}>" class="btn btn-primary" id="discussion-anchor">
                                            <{t 'Log_in_to'}>
                                        </a>
                                    <{/if}>

                                    <{foreach $discussion.thread as $post}>
                                        <div class="js-discussion-post" id="discussion-post-<{$post.id}>">
                                            <p>
                                                <b class="js-discussion-post-author">
                                                    <{if $post.image}>
                                                        <img src="<{$post.image}>" width="50" class="img-thumbnail" />
                                                    <{/if}>

                                                    <{if $post.author}>
                                                        <{$post.author|htmlspecialchars}>
                                                    <{else}>
                                                        <{t "Anonymous" }>
                                                    <{/if}>

                                                    <{if $post.is_authorized}>
                                                        <b title="<{t 'Authorized'}>">
                                                            A
                                                        </b>
                                                    <{/if}>
                                                </b>

                                                <{if $discussion.is_guest_review || !$customer.is_guest}>
                                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#discussion-form" data-post-id="<{$post.id}>">
                                                        <{t 'Reply_to_review' }>
                                                    </button>
                                                <{else}>
                                                    <a href="<{account_sign_in_url '#discussion-anchor'}>" class="btn btn-primary">
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
                                                </div>
                                            <{/if}>
                                        </div>

                                        <{foreach $post.answers as $answer}>
                                            <div id="discussion-post-<{$answer.id}>">
                                                <p>
                                                    <b>
                                                        <{if $answer.image}>
                                                            <img src="<{$answer.image}>" width="50" class="img-thumbnail" />
                                                        <{/if}>

                                                        <{if $answer.author}>
                                                            <{$answer.author|htmlspecialchars}>
                                                        <{else}>
                                                            <{t "Anonymous" }>
                                                        <{/if}>

                                                        <{if $answer.is_authorized}>
                                                            <b title="<{t 'Authorized'}>">
                                                                A
                                                            </b>
                                                        <{/if}>
                                                    </b>
                                                </p>

                                                <p>
                                                    <{$answer.comment|htmlspecialchars|nl2br}>
                                                </p>
                                            </div>

                                            <{if $discussion.is_votes}>
                                                <div class="votes js-votes" data-element-id="<{$answer.id}>" data-element-type="discussion_post" data-action="view">
                                                </div>
                                            <{/if}>
                                        <{/foreach}>
                                    <{/foreach}>

                                    <{include 'misc/pagination.tpl' pagination_fragment='#discussion-anchor'}>
                                </div>
                            <{/capture}>

                            <{assign 'is_tab_active' 0}>
                        <{else}>
                            <{capture append="tabs_links"}>
                                <li class="nav-item">
                                    <a class="nav-link" href="#discussion-form" data-toggle="modal" data-target="#discussion-form">
                                        <{t 'Give_feedback' }>
                                    </a>
                                </li>
                            <{/capture}>
                        <{/if}>

                        <{discussion_form_success $discussion}>
                        <script>
                            jQuery(function ($) {
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
                            jQuery(function ($) {
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

                        <script>
                            jQuery(function ($) {
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
                                        <h5 class="modal-title js-discussion-new"><{t 'Write_a_feedback'}></h5>
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
                                                <label for="discussion-pros-field"><{t 'Pros' }></label>
                                                <textarea class="form-control" name="pros" id="discussion-pros-field" rows="5" aria-required="true" placeholder="<{t 'Describe_the_pros' }>"></textarea>
                                            </div>
                                        <{/if}>

                                        <{if $discussion.is_cons}>
                                            <div class="form-group js-discussion-new">
                                                <label for="discussion-cons-field"><{t 'Minuses' }></label>
                                                <textarea class="form-control" name="cons" id="discussion-cons-field" rows="5" aria-required="true" placeholder="<{t 'Describe_the_cons' }>"></textarea>
                                            </div>
                                        <{/if}>

                                        <{if $customer.is_guest}>
                                            <div class="form-group">
                                                <label for="discussion-author-field"><{t 'Your_name' }></label>
                                                <input type="text" class="form-control" name="author" id="discussion-author-field" placeholder="<{t 'Name' }>" />
                                            </div>
                                        <{/if}>

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
                <{elseif $tab.id == 5 && $tab.is_hide == 0 && $article.text && $article.parameters.promo}>
                    <{* $tab.id == 5 => Всё *}>

                    <{capture append="tabs_links"}>
                        <li class="nav-item">
                            <a class="nav-link<{if $is_tab_active}> active<{/if}>" data-toggle="tab" href="#article-all-tab">
                                <{$tab.name|htmlspecialchars}>
                            </a>
                        </li>
                    <{/capture}>

                    <{capture append="tabs_contents"}>
                        <div class="tab-pane fade<{if $is_tab_active}> show active<{/if}>" id="article-all-tab">
                            <{foreach $article.parameters.promo as $group}>
                                <h2><{$group.name|htmlspecialchars}></h2>

                                <{foreach $group.children as $parameter}>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <{$parameter.name|htmlspecialchars}>
                                        </div>
                                        <div class="col-lg-8">
                                            <{foreach $parameter.values as $value}>
                                                <{$value.value|htmlspecialchars}>

                                                <{if $value.unit_short_name}>
                                                    <span class="parameter-unit">
                                                        <{$value.unit_short_name|htmlspecialchars}>
                                                    </span>
                                                <{/if}>
                                            <{/foreach}>
                                        </div>
                                    </div>
                                <{/foreach}>
                            <{/foreach}>

                            <{if $article.parameters.tab}>
                                <a class="btn btn-link" href="#" onClick="jQuery('#article-parameters-tab-button').tab('show');
                                        return false;">
                                    <{t 'All_characteristics'}>
                                </a>
                            <{/if}>

                            <{if $article.intro}>
                                <{$article.intro}>

                                <a href="#" onClick="jQuery('#article-text-tab-button').tab('show');
                                        return false;">
                                    <{t 'Read_description'}>
                                </a>
                            <{else}>
                                <p>
                                    <{$article.text|strip_tags|truncate:200|nl2br}>

                                    <a href="#" onClick="jQuery('#article-text-tab-button').tab('show');
                                            return false;">
                                        <{t 'Read_description'}>
                                    </a>
                                </p>
                            <{/if}>
                        </div>
                    <{/capture}>

                    <{assign 'is_tab_active' 0}>
                <{elseif $tab.id == 6 && $tab.is_hide == 0}>
                    <{* $tab.id == 6 => Вопросы *}>
                <{elseif $tab.text && $tab.is_hide == 0}>
                    <{* $tab.text => Custom *}>

                    <{capture append="tabs_links"}>
                        <li class="nav-item">
                            <a class="nav-link<{if $is_tab_active}> active<{/if}>" data-toggle="tab" href="#article-custom-tab-<{$tab.id}>">
                                <{$tab.name|htmlspecialchars}>
                            </a>
                        </li>
                    <{/capture}>

                    <{capture append="tabs_contents"}>
                        <div class="tab-pane fade<{if $is_tab_active}> show active<{/if}>" id="article-custom-tab-<{$tab.id}>">
                            <{$tab.text}>
                        </div>
                    <{/capture}>

                    <{assign 'is_tab_active' 0}>
                <{/if}>
            <{/foreach}>

            <{* TODO: remove debug tab*}>
            <{capture append="tabs_links"}>
                <li class="nav-item">
                    <a class="nav-link<{if $is_tab_active}> active<{/if}>" data-toggle="tab" href="#article-debug-tab">
                        Debug
                    </a>
                </li>
            <{/capture}>

            <{capture append="tabs_contents"}>
                <div class="tab-pane fade<{if $is_tab_active}> show active<{/if}>" id="article-debug-tab">
                    <pre><{$article|var_dump}></pre>
                </div>
            <{/capture}>

            <{assign 'is_tab_active' 0}>
            <{* /debug tab *}>

            <{if $tabs_links && $tabs_contents}>
                <ul class="nav nav-tabs" role="tablist">
                    <{foreach $tabs_links as $tab_link}>
                        <{$tab_link}>
                    <{/foreach}>
                </ul>
                <div class="tab-content"> 
                    <{foreach $tabs_contents as $tab_content}>
                        <{$tab_content}>
                    <{/foreach}>
                </div>
            <{/if}>

            <{get_catalog_articles 'r1_articles' related_1=$article by=6}>
            <{if $r1_articles}>
                <h2>
                    <{t "Recommend"}>
                </h2>
                <div class="row">
                    <{foreach $r1_articles as $article}>
                        <div class="col-lg-2">
                            <{if $article.cover}>
                                <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                    <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                                </a>
                            <{/if}>

                            <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                <{$article.short_name|htmlspecialchars}>
                            </a>

                            <{basket_form article=$article return_url="#basket-modal"}>
                            <button type="submit" class="btn btn-success">
                                <{if $article.price.is_price}>
                                    <{t 'Buy_for'}>
                                    <{$article.price.html}>
                                <{else}>
                                    <{t 'Buy'}>
                                <{/if}>
                            </button>
                            <{/basket_form}>
                        </div>
                    <{/foreach}>
                </div>
            <{/if}>

            <{get_catalog_articles 'r2_articles' related_2=$article by=6}>
            <{if $r2_articles}>
                <h2>
                    <{t 'Also_buy'}>
                </h2>
                <div class="row">
                    <{foreach $r2_articles as $article}>
                        <div class="col-lg-2">
                            <{if $article.cover}>
                                <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                    <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                                </a>
                            <{/if}>

                            <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                <{$article.short_name|htmlspecialchars}>
                            </a>

                            <{basket_form article=$article return_url="#basket-modal"}>
                            <button type="submit" class="btn btn-success">
                                <{if $article.price.is_price}>
                                    <{t 'Buy_for'}>
                                    <{$article.price.html}>
                                <{else}>
                                    <{t 'Buy'}>
                                <{/if}>
                            </button>
                            <{/basket_form}>
                        </div>
                    <{/foreach}>
                </div>
            <{/if}>

            <{get_catalog_articles 'r3_articles' related_3=$article by=6}>
            <{if $r3_articles}>
                <h2>
                    <{t 'Similar'}>
                </h2>
                <div class="row">
                    <{foreach $r3_articles as $article}>
                        <div class="col-lg-2">
                            <{if $article.cover}>
                                <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                    <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                                </a>
                            <{/if}>

                            <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                                <{$article.short_name|htmlspecialchars}>
                            </a>

                            <{basket_form article=$article return_url="#basket-modal"}>
                            <button type="submit" class="btn btn-success">
                                <{if $article.price.is_price}>
                                    <{t 'Buy_for'}>
                                    <{$article.price.html}>
                                <{else}>
                                    <{t 'Buy'}>
                                <{/if}>
                            </button>
                            <{/basket_form}>
                        </div>
                    <{/foreach}>
                </div>
            <{/if}>
        </div>
    </div>
<{/block}>
