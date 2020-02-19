
<{if $brands|count}>
    <div>
        <{foreach $brands as $brand}>
            <div>
                <{if !$tag_attributes.noname}>
                    <div>
                        <a href="<{$brand.relative_url}>">
                            <{$brand.name|htmlspecialchars}>
                        </a>
                    </div>
                <{/if}>

                <{if $tag_attributes.photo && $brand.cover.photo_file_small}>
                    <div>
                        <a href="<{$brand.relative_url}>">
                            <img src="<{$brand.cover.photo_file_small}>" />
                        </a>
                    </div>
                <{/if}>

                <{if $tag_attributes.desc}>
                    <div>
                        <{$brand.intro}>
                    </div>
                <{/if}>
            </div>
        <{/foreach}>
    </div>
<{/if}>
