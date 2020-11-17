
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /photo_album_slider.tpl
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
                <a href="<{image $photo}>">
                    <img src="<{image $photo 'thumbnail-1www'}>" width="100%" />
                </a>
            </div>
        <{/foreach}>
    </div>

    <{$photo_album.extra}>

<{/block}>
