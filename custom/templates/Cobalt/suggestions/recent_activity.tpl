<div class="card">
    <div class="card-header header-theme">{$RECENT_ACTIVITY}</div>
    <div class="card-body">
        {foreach from=$RECENT_ACTIVITY_LIST item=item name=re}
            <div class="d-flex">
                <div>
                    <a href="{$item.updated_by_link}"><img class="avatar-img" style="max-height:50px;max-width:50px;"
                            src="{$item.updated_by_avatar}" alt="{$item.updated_by_username}" /></a>
                </div>
                <div class="flex-grow-1 ml-3">
                    <a href="{$item.link}" class="white-link">{$item.title}</a><br />
                    <span data-toggle="tooltip" data-trigger="hover"
                        data-content="{$item.updated}">{$item.updated_rough}</span><br />{$BY} <a
                        class="{$item.updated_by_tag} username" href="{$item.updated_by_link}"
                        style="{$item.updated_by_style}">{$item.updated_by_username}</a>
                </div>
            </div>
			{if not $smarty.foreach.re.last}<hr />{/if}
        {/foreach}
    </div>
</div>