
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /text.tpl
<{/block}>

<{block name=title}>
    <{$module.name|htmlspecialchars}>
<{/block}>

<{block name="module"}>

    <h1>
        <{$module.name|htmlspecialchars}>
    </h1>

    <{$module.text}>

<{/block}>
