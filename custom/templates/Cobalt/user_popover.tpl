<div class="popover-flex">
    <div class="popover-avatar">
        <a href="{$PROFILE}"><img src="{$AVATAR}" alt="{$USERNAME}" class="avatar-img popover-img"/></a>
    </div>
    <div class="popover-user-info">
        <div class="popover-username">
            <a class="popover-user username" href="{$PROFILE}" style="{$STYLE}">{$NICKNAME}</a>
            {if count($GROUPS)}
                {foreach from=$GROUPS item=group} {$group}{/foreach}
            {else}
                <span class="badge badge-secondary">{$GUEST}</div>
            {/if}
        </div>
        {if isset($REGISTERED)}{$REGISTERED}<br />{/if}
        {if isset($TOPICS) && isset($POSTS)}{$TOPICS} &bull; {$POSTS}{/if}
    </div>
</div>