
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /contacts.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{$module.name|htmlspecialchars}>
    </h1>

    <{$module.text}>

    <{get_contacts "contacts"}>
    <{foreach $contacts.contacts as $contact}>
        <p>
            <b>
                <{$contact.city_name|htmlspecialchars}>
            </b>
            <{$contact.address|htmlspecialchars}>
        </p>

        <{$contact.comment}>

        <{$contact|debug_print_var}>
    <{/foreach}>

<{/block}>
