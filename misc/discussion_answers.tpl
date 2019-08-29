
<{foreach $answers as $answer}>
    <div id="discussion-post-<{$answer.id}>" class="js-discussion-post answer answer-level-<{$answerLevel}><{if $answerLevel > 4}> answer-level-max<{/if}>">
        <p>
            <b class="js-discussion-post-author">
                <{if $answer.customer && $answer.image}>
                    <a href="<{$answer.customer.relative_url}>">
                        <img src="<{$answer.image}>" width="50" class="img-thumbnail" />
                    </a>
                <{elseif $answer.image}>
                    <img src="<{$answer.image}>" width="50" class="img-thumbnail" />
                <{/if}>

                <{if $answer.customer}>
                    <a href="<{$answer.customer.relative_url}>">
                        <{$answer.author|htmlspecialchars}>
                    </a>
                <{elseif $answer.author}>
                    <{$answer.author|htmlspecialchars}>
                <{else}>
                    Аноним
                <{/if}>

                <{if $answer.is_authorized}>
                    <b title="Авторизован">
                        A
                    </b>
                <{/if}>
            </b>

            <b>
                ответил на пост
                <{if $post.author}>
                    <{$post.author|htmlspecialchars}>
                <{else}>
                    Аноним
                <{/if}>
            </b>

            <{if $discussion.is_guest_review || !$customer.is_guest}>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#discussion-form" data-post-id="<{$answer.id}>">
                    Ответить на отзыв
                </button>
            <{else}>
                <a href="<{account_sign_in_url '#discussion-anchor'}>" class="btn btn-primary">
                    Авторизоваться чтобы ответить на отзыв
                </a>
            <{/if}>
        </p>

        <p>
            <{$answer.comment|htmlspecialchars|nl2br}>
        </p>

        <{if $discussion.is_votes}>
            <div class="votes js-votes" data-element-id="<{$answer.id}>" data-element-type="discussion_post" data-action="view">
                <span class="votes-label">
                    <{t "Всего голосов:"}>
                </span>
                <span class="votes-count">
                    <{$answer.votes_count}>
                </span>
            </div>
        <{/if}>
    </div>

    <{if $answer.answers}>
        <{include 'misc/discussion_answers.tpl' post=$answer answerLevel=$answerLevel+1 answers=$answer.answers}>
    <{/if}>

<{/foreach}>
