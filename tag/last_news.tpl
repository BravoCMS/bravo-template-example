
<{if $tag_attributes.total_count && $total_count}>
    <div>
        <{$total_count}>
    </div>
<{/if}>

<{foreach $articles as $article}>
    <div>
        <{if $tag_attributes.large_photo}>
            <div>
                <{if $tag_attributes.nolink}>
                    <img src="<{$article.cover.photo_file}>" />
                <{else}>
                    <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                        <img src="<{$article.cover.photo_file}>" />
                    </a>
                <{/if}>
            </div>
        <{elseif $tag_attributes.photo}>
            <div>
                <{if $tag_attributes.nolink}>
                    <img src="<{$article.cover.photo_file_small}>" />
                <{else}>
                    <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                        <img src="<{$article.cover.photo_file_small}>" />
                    </a>
                <{/if}>
            </div>
        <{/if}>

        <{if !$tag_attributes.nodate}>
            <div>
                <{$article.publish_date}>
            </div>
        <{/if}>

        <div>
            <{if $tag_attributes.nolink}>
                <{$article.short_name|htmlspecialchars}>
            <{else}>
                <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                    <{$article.short_name|htmlspecialchars}>
                </a>
            <{/if}>
        </div>

        <{if $tag_attributes.views && $article.views_count}>
            <div>
                <{$article.views_count}>
            </div>
        <{/if}>

        <{if $tag_attributes.votes && $article.votes_count}>
            <div>
                <{$article.votes_count}>
            </div>
        <{/if}>

        <{if $tag_attributes.votes_rating_local && $article.votes_rating_local}>
            <div>
                <{$article.votes_rating_local}>
            </div>
        <{/if}>

        <{if $tag_attributes.votes_rating_global && $article.votes_rating_global}>
            <div>
                <{$article.votes_rating_global}>
            </div>
        <{/if}>

        <{if $tag_attributes.source && $article.source}>
            <div>
                <{if $article.source.url}>
                    <a href="<{$article.source.url}>">
                        <{$article.source.name|htmlspecialchars}>
                    </a>
                <{else}>
                    <{$article.source.name|htmlspecialchars}>
                <{/if}>
            </div>
        <{/if}>

        <{if $tag_attributes.full_text}>
            <div>
                <{$article.text}>
            </div>
        <{elseif $tag_attributes.text}>
            <div>
                <{if $article.intro}>
                    <{$article.intro}>
                <{else}>
                    <{$article.text|strip_tags|truncate:$tag_attributes.text}>
                <{/if}>

                <{if !$tag_attributes.nomore}>
                    <a href="<{$article.relative_url}>">
                        <{t "Читать далее"}>
                    </a>
                <{/if}>
            </div>
        <{/if}>

        <{if $tag_attributes.author && $article.author}>
            <div>
                <{if $article.author.relative_url}>
                    <a href="<{$article.author.relative_url}>">
                        <{if $tag_attributes.author-photo-preview}>
                            <img src="<{$article.author.cover.photo_file_small}>" width="50" class="img-thumbnail" />
                        <{elseif $tag_attributes.author-photo-original}>
                            <img src="<{$article.author.cover.photo_file}>" width="50" class="img-thumbnail" />
                        <{/if}>

                        <{$article.author.name|htmlspecialchars}>
                    </a>
                <{else}>
                    <{$article.author.name|htmlspecialchars}>
                <{/if}>
            </div>
        <{/if}>


        <{if $tag_attributes.review_count}>
            <{get_discussion "discussion" element=$article by=$tag_attributes.review_count}>

            <div>
                <{foreach $discussion.thread as $post}>
                    <div>
                        <{if $tag_attributes.review_author}>
                            <div>
                                <{if $post.image}>
                                    <img src="<{$post.image}>" width="50" class="img-thumbnail" />
                                <{/if}>

                                <{if $post.author}>
                                    <{$post.author|htmlspecialchars}>
                                <{else}>
                                    <{t "Anonymous" }>
                                <{/if}>

                                <{if $post.is_authorized}>
                                    <b title="Авторизован">
                                        A
                                    </b>
                                <{/if}>
                            </div>
                        <{/if}>

                        <{if $tag_attributes.review_date}>
                            <div>
                                <{$post.created_at|as_date:'medium'}>,
                                <{$post.created_at|as_time:'short'}>
                            </div>
                        <{/if}>

                        <p>
                            <{if $tag_attributes.review_trunc}>
                                <{$post.comment|truncate:$tag_attributes.review_trunc|htmlspecialchars|nl2br}>
                            <{else}>
                                <{$post.comment|htmlspecialchars|nl2br}>
                            <{/if}>
                        </p>
                    </div>
                <{/foreach}>
            </div>
        <{/if}>
    </div>
<{/foreach}>
