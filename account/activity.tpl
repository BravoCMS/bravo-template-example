
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/activity.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{t 'What_happened'}>
    </h1>

    <div class="row">
        <div class="col-lg-3">
            <nav class="nav flex-column">
                <{foreach $module.menu as $menuItem}>
                    <a class="nav-link<{if $menuItem.is_active}> active<{/if}>" href="<{$menuItem.url}>">
                        <{$menuItem.short_name}>
                    </a>
                <{/foreach}>
            </nav>
        </div>

        <div class="col-lg-9">

            <div class="row">
                <{get_customer_activities 'activities' 'pagination' page_query}>

                <{foreach $activities as $activity}>
                    <{if $activity.activity_type == 'discussion_post_added'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "you_left_a_comment_on" }>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'discussion_post_answered'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "your_comment_was" }>

                            <{if $activity.other_customer_id}>
                                (<a href="<{$activity.other_customer.relative_url}>" title="<{$activity.other_customer.name|escape}>">
                                    <{$activity.other_customer.short_name|htmlspecialchars}>
                                </a>)
                            <{elseif $activity.other_customer_name}>
                                (<{$activity.other_customer_name}>)
                            <{else}>
                                (<{t "Anonymous" }>)
                            <{/if}>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'discussion_post_published'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "your_comment_has_been_published" }>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'discussion_post_discarded'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "your_comment_has_been_blocked" }>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_added'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "you_added_an_article" }>

                            <{if $activity.element.id}>
                                <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                    <{$activity.element.short_name|htmlspecialchars}>
                                </a>
                            <{else}>
                                <{t 'Not_published'}>
                            <{/if}>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_published'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "your_article_is_published" }>

                            <{if $activity.element.id}>
                                <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                    <{$activity.element.short_name|htmlspecialchars}>
                                </a>
                            <{else}>
                                <{t 'Not_published'}>
                            <{/if}>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_discarded'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "your_article_is_blocked" }>

                            <{if $activity.element.id}>
                                <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                    <{$activity.element.short_name|htmlspecialchars}>
                                </a>
                            <{else}>
                                <{t 'Not_published'}>
                            <{/if}>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_reviewed'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "your_article_was_commented_on" }>

                            <{if $activity.other_customer_id}>
                                (<a href="<{$activity.other_customer.relative_url}>" title="<{$activity.other_customer.name|escape}>">
                                    <{$activity.other_customer.short_name|htmlspecialchars}>
                                </a>)
                            <{elseif $activity.other_customer_name}>
                                (<{$activity.other_customer_name}>)
                            <{else}>
                                (<{t "Anonymous" }>)
                            <{/if}>

                            <{if $activity.element.id}>
                                <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                    <{$activity.element.short_name|htmlspecialchars}>
                                </a>
                            <{else}>
                                <{t 'Not_published'}>
                            <{/if}>
                        </div>
                    <{elseif $activity.activity_type == 'discussion_post_liked'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>

                            <{if $activity.count == 1}>
                                <{t "your_comment_was_liked"}>
                            <{else}>
                                <{t "ваш комментарий собрал {n,plural,one{# лайк} few{# лайка} other{# лайков}}" n=$activity.count}>
                            <{/if}>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'element_liked'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>

                            <{if $activity.discussion_post_id}>
                                <{t "you_liked_the_comment_on_the_page"}>
                            <{else}>
                                <{t "did_you_like_it"}>
                            <{/if}>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_liked'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>

                            <{if $activity.count == 1}>
                            <   {t "your_article_was_liked"}>
                            <{else}>
                                <{t "ваша статья собрала {n,plural,one{# лайк} few{# лайка} other{# лайков}}" n=$activity.count}>
                            <{/if}>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{else}>
                        <{* development option, if something new will be added, uncomment to see the data *}>
                        <{* div class="col-lg-12">
                        <{$activity|debug_print_var}>
                        </div *}>
                    <{/if}>
                <{/foreach}>
            </div>

            <div class="row">
                <{include 'misc/pagination.tpl'}>
            </div>

        </div>
    </div>

<{/block}>
