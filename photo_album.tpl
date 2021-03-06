
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /photo_album.tpl
<{/block}>

<{block name=title}>
    <{$photo_album.title|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{$photo_album.name|htmlspecialchars}>
    </h1>

    <{$photo_album.text}>

    <div class="row">
        <{foreach $photo_album.photos as $photo}>
            <div class="col-6">
                <img src="<{$photo.photo_file_small}>" width="100%" />
            </div>
        <{/foreach}>
    </div>

    <{$photo_album.extra}>

<{/block}>
