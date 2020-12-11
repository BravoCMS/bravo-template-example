
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /article.tpl
<{/block}>

<{block name=title}>
    <{$article.title|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{$module.name|htmlspecialchars}>
    </h1>

    <{if $module.image}>
        <img src="<{$module.image}>" />
    <{/if}>

    <{get_blog_articles 'articles' by=5 customer_id=$module.id}>
    <{if $articles}>
        <div class="row">
            <{foreach $articles as $article}>
                <div class="col-6">
                    <{if $article.cover}>
                        <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                            <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                        </a>
                    <{/if}>

                    <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                        <{$article.short_name|htmlspecialchars}>
                    </a>
                </div>
            <{/foreach}>
        </div>
    <{/if}>

    <{get_discussion_posts 'posts' by=5 customer_id=$module.id}>
    <{if $posts}>
        <div class="row">
            <{foreach $posts as $post}>
                <div class="col-6">
                    <{if $post.element}>
                        <p>
                            <a href="<{$post.element.relative_url}>" title="<{$post.element.name|escape}>">
                                <b class="js-discussion-post-author">
                                    <{$post.element.short_name|htmlspecialchars}>
                                </b>
                            </a>
                        </p>
                    <{/if}>

                    <div class="js-discussion-post-comment">
                        <p>
                            <{$post.comment|htmlspecialchars|nl2br}>
                        </p>

                        <{if $post.pros}>
                            <p>
                                <b><{t 'Pros'}>:</b><br />
                                <{$post.pros|htmlspecialchars|nl2br}>
                            </p>
                        <{/if}>

                        <{if $post.cons}>
                            <p>
                                <b><{t 'Minuses'}>:</b><br />
                                <{$post.cons|htmlspecialchars|nl2br}>
                            </p>
                        <{/if}>
                    </div>
                </div>
            <{/foreach}>
        </div>
    <{/if}>

<{/block}>
