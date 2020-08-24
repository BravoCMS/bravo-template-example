
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /account/activity.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        Что произошло
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
                            <{t "вы оставили комментарий к" }>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'discussion_post_answered'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "на ваш комментарий ответил другой пользователь" }>

                            <{if $activity.other_customer_id}>
                                (<a href="<{$activity.other_customer.relative_url}>" title="<{$activity.other_customer.name|escape}>">
                                    <{$activity.other_customer.short_name|htmlspecialchars}>
                                </a>)
                            <{elseif $activity.other_customer_name}>
                                (<{$activity.other_customer_name}>)
                            <{else}>
                                (Аноним)
                            <{/if}>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'discussion_post_published'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "ваш комментарий опубликован" }>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'discussion_post_discarded'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "ваш комментарий заблокирован" }>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_added'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "вы добавили статью" }>

                            <{if $activity.element.id}>
                                <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                    <{$activity.element.short_name|htmlspecialchars}>
                                </a>
                            <{else}>
                                Не опубликована
                            <{/if}>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_published'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "ваша статья опубликована" }>

                            <{if $activity.element.id}>
                                <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                    <{$activity.element.short_name|htmlspecialchars}>
                                </a>
                            <{else}>
                                Не опубликована
                            <{/if}>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_discarded'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "ваша статья заблокирована" }>

                            <{if $activity.element.id}>
                                <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                    <{$activity.element.short_name|htmlspecialchars}>
                                </a>
                            <{else}>
                                Не опубликована
                            <{/if}>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_reviewed'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>
                            <{t "вашу статью прокомментировали" }>

                            <{if $activity.other_customer_id}>
                                (<a href="<{$activity.other_customer.relative_url}>" title="<{$activity.other_customer.name|escape}>">
                                    <{$activity.other_customer.short_name|htmlspecialchars}>
                                </a>)
                            <{elseif $activity.other_customer_name}>
                                (<{$activity.other_customer_name}>)
                            <{else}>
                                (Аноним)
                            <{/if}>

                            <{if $activity.element.id}>
                                <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                    <{$activity.element.short_name|htmlspecialchars}>
                                </a>
                            <{else}>
                                Не опубликована
                            <{/if}>
                        </div>
                    <{elseif $activity.activity_type == 'discussion_post_liked'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>

                            <{if $activity.count == 1}>
                                <{t "ваш комментарий лайкнули"}>
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
                                <{t "вам понравился комментарий на странице:"}>
                            <{else}>
                                <{t "вам понравилось:"}>
                            <{/if}>

                            <a href="<{$activity.element.relative_url}>" title="<{$activity.element.name|escape}>">
                                <{$activity.element.short_name|htmlspecialchars}>
                            </a>
                        </div>
                    <{elseif $activity.activity_type == 'blog_article_liked'}>
                        <div class="col-lg-12">
                            <{$activity.updated_at|as_datetime:'short'}>

                            <{if $activity.count == 1}>
                                <{t "вашу статью лайкнули"}>
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
