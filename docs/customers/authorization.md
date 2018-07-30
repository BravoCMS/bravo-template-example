---
title: Authorization
---

# Authorization

## How to sign in or change account

Use tag <{account_sign_in_url}>

<a href="<{account_sign_in_url}>">
    link text, e.g. 'Sign In' or 'Change Account'
</a>


## How to sign out

Use tag <{account_sign_out_url}>

<{if !$customer.is_guest}>
    <a href="<{account_sign_out_url}>">
        link text, e.g. 'Sign Out'
    </a>
<{/if}>