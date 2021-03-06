
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /events.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{$module.name|htmlspecialchars}>
    </h1>

    <{foreach $top_menu.0 as $top_menu_item}>
        <{if $top_menu_item.is_active || $top_menu_item.is_active_ancestor}>
            <{if $top_menu[$top_menu_item.id]}>
                <ul class="navbar-nav mr-auto">
                    <{foreach $top_menu[$top_menu_item.id] as $menu_item}>
                        <li class="nav-item<{if $menu_item.is_active}> active<{/if}>">
                            <a class="nav-link" href="<{$menu_item.href}>">
                                <{$menu_item.page_name|htmlspecialchars}>
                            </a>
                        </li>
                    <{/foreach}>
                </ul>
                <{break}>
            <{/if}>
        <{/if}>
    <{/foreach}>

    <{$module.text}>

    <div class="row">
        <{get_events 'events' 'pagination' select='date' page_query}>
        <{foreach $events as $event}>
            <div class="col-6">
                <p>
                    <b>
                        <{$event.date.date|as_date:'long'}>
                        <{t 'from'}>
                        <{$event.date.time_from|as_time:'short'}>
                        <{t 'by'}>
                        <{$event.date.time_to|as_time:'short'}>

                        <!-- 
                        you can use other date formats or combine them:
                        <{$event.date.date|as_date:'short'}>
                        <{$event.date.date|as_date:'medium'}>
                        <{$event.date.date|as_date:'long'}>
                        <{$event.date.date|as_date:'full'}>
                        <{$event.date.date|as_date:'yyyy'}>
                        <{$event.date.date|as_date:'iso'}>
                        <{$event.date.date|as_date:'d MMMM'}>
                        
                        time formats:
                        <{$event.date.time_from|as_time:'short'}>
                        <{$event.date.time_from|as_time:'medium'}>
                        <{$event.date.time_from|as_time:'long'}>
                        <{$event.date.time_from|as_time:'full'}>
                        <{$event.date.time_from|as_time:'iso'}>
                        
                        for more formats see:
                        http://userguide.icu-project.org/formatparse/datetime
                        -->
                    </b>
                </p>

                <{if $event.cover}>
                    <a href="<{$event.relative_url}>" title="<{$event.name|escape}>">
                        <img src="<{$event.cover.photo_file_small}>" style="width: 100%;" />
                    </a>
                <{/if}>

                <a href="<{$event.relative_url}>" title="<{$event.name|escape}>">
                    <{$event.short_name|htmlspecialchars}>
                </a>

                <{if $is_web_admin}>
                    <a href="<{$event.panel_absolute_url}>" target="_blank" title="<{t 'Edit_item_in_admin_panel'}>">
                        <{t 'To_admin_panel'}>
                    </a>
                <{/if}>
            </div>
        <{/foreach}>
    </div>

    <script>
        require(['jquery'], function ($) {
            $(document.body).on('change', '.js-events-filter', function () {
                $(this).submit();
            });

            $(document.body).on('click', '.js-events-pagination a', function (e) {
                e.preventDefault();
                $('.js-page-value').val($(this).data('page')).trigger('change');
            });
        });
    </script>

    <form method="GET" class="js-events-filter">
        <input type="hidden" name="page" value="<{$smarty.get.page|intval}>" class="js-page-value" />
        <{if $smarty.get.past}>
            <input type="hidden" name="past" value="1" />
        <{/if}>
    </form>

    <div class="row js-events-pagination">
        <{include 'misc/pagination.tpl'}>
    </div>

<{/block}>
