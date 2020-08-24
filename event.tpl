
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /event.tpl
<{/block}>

<{block name=title}>
    <{$event.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{$event.name|htmlspecialchars}>
    </h1>

    <{if $is_web_admin}>
        <a href="<{$event.panel_absolute_url}>" target="_blank" title="Редактирвать элемент в панели администратора">
            В админку
        </a>
    <{/if}>

    <{if $event.cover}>
        <img src="<{$event.cover.photo_file_small}>" style="width: 100%;" title="<{$event.name|escape}>" />
    <{/if}>

    <p>
        Даты проведения:
    </p>
    <{foreach $event.dates as $date}>
        <p<{if !$date.is_past}> style="font-weight: bold;"<{/if}>>
            <{$date.date|as_date:'long'}>
            с
            <{$date.time_from|as_time:'short'}>
            по
            <{$date.time_to|as_time:'short'}>
        </p>
    <{/foreach}>

    <{$event.text}>

<{/block}>
