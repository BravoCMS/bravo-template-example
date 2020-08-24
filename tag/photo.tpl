
<{* TODO: DECISION (UNUSED) *}>
<{*div class="photos">
    <{if $tag_attributes.title && $album.album_title}>
        <div>
            <{$album.album_title|htmlspecialchars}>
        </div>
    <{/if}>

    <{if $tag_attributes.desc && $album.album_description}>
        <div>
            <{$album.album_description}>
        </div>
    <{/if}>

    <{if $tag_attributes.description && $album.album_description_full}>
        <div>
            <{$album.album_description_full}>
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

            <{if $tag_attributes.photo-desc}>
                <div>
                    <{$photo.description}>
                </div>
            <{/if}>
        </div>
    <{/foreach}>

    <{if $tag_attributes.url}>
        <div>
            <a href="<{$tag_attributes.url}>">
                <{t "Смотреть все"}>
            </a>
        </div>
    <{/if}>
</div*}>
