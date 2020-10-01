
<div class="photos">
    <{if $tag_attributes.title && $album.short_name}>
        <div>
            <{$album.short_name|htmlspecialchars}>
        </div>
    <{/if}>

    <{if $tag_attributes.desc && $album.intro}>
        <div>
            <{$album.intro}>
        </div>
    <{/if}>

    <{if $tag_attributes.description && $album.extra}>
        <div>
            <{$album.extra}>
        </div>
    <{/if}>

    <{foreach $photos as $photo}>
        <div>
            <{if $tag_attributes.large}>
                <a href="<{$photo.photo_file}>">
                    <img src="<{$photo.photo_file}>" alt="<{$photo.photo_title|escape}>" title="<{$photo.photo_title|escape}>" border="0" />
                </a>
            <{else}>
                <a href="<{$photo.photo_file}>">
                    <img src="<{$photo.photo_file_small}>" alt="<{$photo.photo_title|escape}>" title="<{$photo.photo_title|escape}>" border="0" />
                </a>
            <{/if}>

            <{if $tag_attributes['photo-desc']}>
                <div>
                    <{$photo.description}>
                </div>
            <{/if}>
        </div>
    <{/foreach}>

    <{if $tag_attributes.url && $album.relative_url}>
        <div>
            <a href="<{$album.relative}>">
                <{t "Смотреть все"}>
            </a>
        </div>
    <{/if}>
</div>
