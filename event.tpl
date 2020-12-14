
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
        <a href="<{$event.panel_absolute_url}>" target="_blank" title="<{t 'Edit_item_in_admin_panel'}>">
            <{t 'To_admin_panel'}>
        </a>
    <{/if}>

    <{if $event.cover}>
        <img src="<{$event.cover.photo_file_small}>" style="width: 100%;" title="<{$event.name|escape}>" />
    <{/if}>

    <p>
        <{t 'Dates'}>:
    </p>
    <{foreach $event.dates as $date}>
        <p<{if !$date.is_past}> style="font-weight: bold;"<{/if}>>
            <{$date.date|as_date:'long'}>
            <{t 'from'}>
            <{$date.time_from|as_time:'short'}>
            <{t 'by'}>
            <{$date.time_to|as_time:'short'}>
        </p>
    <{/foreach}>

    <{$event.text}>

<{/block}>
