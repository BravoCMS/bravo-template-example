
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /article.tpl
<{/block}>

<{block name=title}>
    <{$article.title|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{$article.name|htmlspecialchars}>
    </h1>

    <div class="views js-views" data-element-id="<{$article.id}>" data-element-type="blog_article">
        <span class="views-label">
            <{t "Просмотров:"}>
        </span>
        <span class="views-count">
            <{$article.views_count}>
        </span>
    </div>

    <div class="votes js-votes" data-element-id="<{$article.id}>" data-element-type="blog_article">
        <span class="votes-label">
            <{t "Всего голосов:"}>
        </span>
        <span class="votes-count">
            <{$article.votes_count}>
        </span>
    </div>

    <{if $article.authors}>
        <p>
            <{foreach $article.authors as $author}>
                <b>
                    <{if $author.relative_url}>
                        <a href="<{$author.relative_url}>">
                            <{if $author.cover}>
                                <{$author.cover|debug_print_var}>
                            <{/if}>

                            <{$author.name|htmlspecialchars}>
                        </a>
                    <{else}>
                        <{$author.name|htmlspecialchars}>
                    <{/if}>
                </b>
            <{/foreach}>
        </p>
    <{/if}>

    <{if $article.tags}>
        <p>
            <{t 'Tags'}>:
            <{foreach $article.tags as $tag}>
                <a href="<{$tag.relative_url}>">
                    <{$tag.name|htmlspecialchars}>
                </a>
            <{/foreach}>
        </p>
    <{/if}>

    <{$article.text}>
    
    <{get_blog_articles 'related_tag_articles' related_tag=$article unique}>
    <{if $related_tag_articles}>
        <{t 'On_this_topic'}><br />
        <{foreach $related_tag_articles as $related_tag_article}>
            <{$related_tag_article.name|htmlspecialchars}><br />
        <{/foreach}>
    <{/if}>

    <{get_blog_articles 'related_page_articles' related_page=$article unique}>
    <{if $related_page_articles}>
        <{t 'More_in_the_section'}><br />
        <{foreach $related_page_articles as $related_page_article}>
            <{$related_page_article.name|htmlspecialchars}><br />
        <{/foreach}>
    <{/if}>

    <{get_blog_articles 'related_last_articles' related_last=$article unique}>
    <{if $related_last_articles}>
        <{t 'Last_on_site'}><br />
        <{foreach $related_last_articles as $related_last_article}>
            <{$related_last_article.name|htmlspecialchars}><br />
        <{/foreach}>
    <{/if}>

    <{get_discussion "discussion" "pagination" element=$article page_query}>
    <{include 'misc/discussion.tpl'}>

<{/block}>
