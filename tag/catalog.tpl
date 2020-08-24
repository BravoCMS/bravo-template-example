
<{get_menu "catalog" "catalog_menu"}>
<{if $catalog_menu|count}>
    <div>
        <{foreach $catalog_menu as $rubric_type}>
            <{if $rubric_type.show_menu_catalog}>
                <{* skip custom pages *}>
                <{continue}>
            <{/if}>

            <ul>
                <li>
                    <h5>
                        <a href="<{$rubric_type.relative_url}>" title="<{$rubric_type.name|escape}>">
                            <{$rubric_type.short_name|htmlspecialchars}>
                        </a>
                    </h5>

                    <{if $rubric_type.photo_file_small}>
                        <p>
                            <a href="<{$rubric_type.relative_url}>">
                                <img src="<{$rubric_type.photo_file_small}>" />
                            </a>
                        </p>
                    <{/if}>
                </li>

                <{foreach $rubric_type.children as $rubric}>
                    <li>
                        <a href="<{$rubric.relative_url}>" title="<{$rubric.name|escape}>">
                            <{$rubric.short_name|htmlspecialchars}>
                        </a>
                    </li>
                <{/foreach}>

                <{if $rubric_type.children|count > 4}>
                    <li>
                        <a href="<{$rubric_type.relative_url}>">
                            <{t 'View all subcategories'}>
                        </a>
                    </li>
                <{/if}>
            </ul>
        <{/foreach}>
    </div>
<{/if}>
