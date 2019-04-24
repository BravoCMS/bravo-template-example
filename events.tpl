<{extends 'layout/layout.tpl'}><{block name="template-name"}>    /events.tpl<{/block}><{block name=title}>    <{$module.name|htmlspecialchars}><{/block}><{block name="module"}>    <h1>        <{$module.name|htmlspecialchars}>    </h1>    <{$module.text}>    <div class="row">        <{get_events 'events' 'pagination' select='date' page_query}>        <{foreach $events as $event}>            <div class="col-6">                <p>                    <b>                        <{$event.date.date|as_date:'long'}>                        с                        <{$event.date.time_from|as_time:'short'}>                        по                        <{$event.date.time_to|as_time:'short'}>                        <!--                         you can use other date formats or combine them:                        <{$event.date.date|as_date:'short'}>                        <{$event.date.date|as_date:'medium'}>                        <{$event.date.date|as_date:'long'}>                        <{$event.date.date|as_date:'full'}>                        <{$event.date.date|as_date:'Y'}>                        <{$event.date.date|as_date:'iso'}>                                                time formats:                        <{$event.date.time_from|as_time:'short'}>                        <{$event.date.time_from|as_time:'medium'}>                        <{$event.date.time_from|as_time:'long'}>                        <{$event.date.time_from|as_time:'full'}>                        <{$event.date.time_from|as_time:'iso'}>                        -->                    </b>                </p>                <{if $event.cover}>                    <a href="<{$event.relative_url}>" title="<{$event.name|escape}>">                        <img src="<{$event.cover.photo_file_small}>" style="width: 100%;" />                    </a>                <{/if}>                <a href="<{$event.relative_url}>" title="<{$event.name|escape}>">                    <{$event.short_name|htmlspecialchars}>                </a>                <{if $is_web_admin}>                    <a href="<{$event.panel_absolute_url}>" target="_blank" title="Редактирвать элемент в панели администратора">                        В админку                    </a>                <{/if}>            </div>        <{/foreach}>    </div>    <div class="row">        <{include 'misc/pagination.tpl'}>    </div><{/block}>