
<div>
    <{foreach $posts as $post}>
        <div>
            <{if $post.element.name && $post.element.url}>
                <div>
                    <{if !$tag_attributes.element_no_name}>
                        <div>
                            <a href="<{$post.element.relative_url}>">
                                <{$post.element.name|htmlspecialchars}>
                            </a>
                        </div>
                    <{/if}>

                    <{if !$tag_attributes.element_no_photo}>
                        <{if $post.element.cover.photo_file_small}>
                            <div class="photo">
                                <a href="<{$post.element.relative_url}>">
                                    <img src="<{$post.element.cover.photo_file_small}>" style="width: 100px;" />
                                </a>
                            </div>
                        <{/if}>
                    <{/if}>
                </div>
            <{/if}>

            <{if $tag_attributes.author && $post.author}>
                <div>
                    <{$post.author|htmlspecialchars}>
                </div>
            <{/if}>

            <{if $tag_attributes.text}>
                <div>
                    <{if $tag_attributes.trunc}>
                        <{assign "comment" $post.comment|truncate:$tag_attributes.trunc}>

                        <{$comment}>
                        <{if $comment|strlen < $post.comment|strlen}>
                            <a href="<{$post.element.more}>">
                                <{t "Читать далее"}>
                            </a>
                        <{/if}>
                    <{else}>
                        <{$post.comment|nl2br}>
                    <{/if}>
                </div>
            <{/if}>

            <{if $tag_attributes.stars}>
                <div>
                    <{t "Поставил оценку {rating}" rating=$post.rating}>
                </div>
            <{/if}>

            <{if $tag_attributes.date}>
                <div>
                    <{$post.created_at|as_date:"long"}>
                    <{$post.created_at|as_time:"short"}>
                </div>
            <{/if}>
        </div>
    <{/foreach}>
</div>
