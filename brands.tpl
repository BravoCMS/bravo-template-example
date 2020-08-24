
<{extends 'layout/layout.tpl'}>

<{block name="template-name"}>
    /brands.tpl
<{/block}>

<{block name=title}>
    <{$module.title|htmlspecialchars}>
<{/block}>

<{block name="module"}>
    <div class="row">
        <{foreach $brands as $brand}>
            <div class="col-lg-4">
                <{if $brand.cover}>
                    <a href="<{$brand.relative_url}>" title="<{$brand.name|escape}>">
                        <img src="<{$brand.cover.photo_file_small}>" style="width: 100%;" />
                    </a>
                <{/if}>
            </div>

            <div class="col-lg-8">
                <a href="<{$brand.relative_url}>" title="<{$brand.name|escape}>">
                    <{$brand.short_name|htmlspecialchars}>
                </a>
            </div>
        <{/foreach}>
    </div>
<{/block}>
