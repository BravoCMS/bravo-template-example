
<{if count($articles)}>
    <div>
        <{get_catalog_wishlists "wishlists"}>
        <{foreach $articles as $article}>
            <div>
                <{if $article.cover}>
                    <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                        <img src="<{$article.cover.photo_file_small}>" style="width: 100%;" />
                    </a>
                <{/if}>

                <a href="<{$article.relative_url}>" title="<{$article.name|escape}>">
                    <{$article.short_name|htmlspecialchars}>
                </a>

                <{if $article.in_basket}>
                    <a href="#basket-modal" class="btn btn-warning" data-toggle="modal" data-target="#basket-modal">
                        В корзине
                    </a>
                <{else}>
                    <{basket_form article=$article return_url="#basket-modal"}>
                    <button type="submit" class="btn btn-success">
                        <{if $article.price.is_price}>
                            <{t 'Buy_for'}>
                            <{$article.price.html}>
                        <{else}>
                            <{t 'Buy'}>
                        <{/if}>
                    </button>
                    <{/basket_form}>
                <{/if}>

                <{if $article.in_comparison}>
                    <a href="<{comparison_url}>" class="btn btn-primary">
                        <{t 'Compare_one'}>
                    </a>
                <{else}>
                    <{comparison_form article=$article}>
                    <button type="submit" class="btn btn-secondary">
                        <{t 'Compare'}>
                    </button>
                    <{/comparison_form}>
                <{/if}>

                <{if $customer.is_guest}>
                    <a href="<{account_sign_in_url}>">
                        <{t 'Sign in to add to favorites'}>
                    </a>
                <{else}>
                    <{catalog_wishlist_form $article add}>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".js-wishlist-modal-<{$article.id}>">
                        <{t 'Add to wishlist'}>
                    </button>

                    <div class="modal js-wishlist-modal-<{$article.id}>" tabindex="-1" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title"><{t 'Add_to_Wishlist'}></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <{foreach $wishlists as $wishlist}>
                                        <label>
                                            <input type="radio" name="catalog_wishlist_id" value="<{$wishlist.id|escape}>" />
                                            <{$wishlist.name|htmlspecialchars}>
                                        </label><br />
                                    <{/foreach}>
                                    <label>
                                        <input type="radio" name="catalog_wishlist_id" value="0" />
                                        <input type="text" name="catalog_wishlist_name" />
                                    </label><br />
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">
                                        <{t 'Add'}>
                                    </button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><{t 'Close'}></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <{/catalog_wishlist_form}>
                <{/if}>
            </div>
        <{/foreach}>
    </div>
<{/if}>
