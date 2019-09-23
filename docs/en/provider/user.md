
# Display user info
use <{get_user "user_variable"}> tag, to get the user data


# User sign in
use <{user_sign_in_url[ return_url='#some_url'][ auth]}> tag, to get sign in url

use `auth` flag to force select user, in case is already authorized


# User sign out
use <{user_sign_out_url return_url='#some_url'}> tag, to get sign out url


# User update account
use <{user_update_url return_url='#some_url'}> tag, to get update url


Example:

```html
<div id="anchor">
    <{get_user "user"}>
    <{if $user.is_guest}>
        <a href="<{user_sign_in_url return_url='#anchor'}>">
            sign in
        </a>
    <{else}>
        <p>
            <{if $user.image}>
                <img src="<{$user.image|htmlspecialchars}>" width="50" class="img-thumbnail">
            <{/if}>
            <{$user.display_name|htmlspecialchars}>

            <a href="<{user_update_url return_url='#anchor'}>">
                Edit account
            </a>
            <a href="<{user_sign_in_url return_url='#anchor' auth}>">
                Change
            </a>
            <a href="<{user_sign_out_url return_url='#anchor'}>">
                Sign out
            </a>
        </p>
    <{/if}>
</div>
```


[Provider functionality](index.md).

[Home](../index.md).
