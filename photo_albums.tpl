
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /photo_albums.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{$module.name|htmlspecialchars}>
    </h1>

    <{$module.text}>

    <div class="row">
        <{foreach $photo_albums as $photo_album}>
            <div class="col-6">
                <{if $photo_album.cover}>
                    <a href="<{$photo_album.relative_url}>" title="<{$photo_album.name|escape}>">
                        <img src="<{$photo_album.cover.photo_file_small}>" style="width: 100%;" />
                    </a>
                <{/if}>

                <a href="<{$photo_album.relative_url}>" title="<{$photo_album.name|escape}>">
                    <{$photo_album.short_name|htmlspecialchars}>
                </a>
            </div>
        <{/foreach}>
    </div>

    <div class="row">
        <{include 'misc/pagination.tpl'}>
    </div>

<{/block}>
