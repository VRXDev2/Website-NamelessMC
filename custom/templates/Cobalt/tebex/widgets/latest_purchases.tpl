<div class="card">
    <div class="card-header header-theme">{$LATEST_PURCHASES}</div>
    <div class="card-body">
        {if count($PURCHASES)}
            {foreach from=$PURCHASES item=purchase name=purchases_array}
                <a href="{$purchase.profile}" style="{$purchase.style}"
                    data-poload="{$USER_INFO_URL}{if $purchase.user_id > 0}{$purchase.user_id}{else}{$purchase.username}&uuid={$purchase.uuid}{/if}"
                    data-html="true" data-placement="top">{$purchase.username}</a> <a
                    {if $purchase.user_id}href="{$purchase.profile}" {/if}
                    data-poload="{$USER_INFO_URL}{if $purchase.user_id > 0}{$purchase.user_id}{else}{$purchase.username}&uuid={$purchase.uuid}{/if}"><img
                        class="avatar-img" style="max-height:20px;max-width:20px;" src="{$purchase.avatar}"
                        alt="{$purchase.username}" /></a><br />
                <span data-toggle="tooltip" data-trigger="hover"
                    data-original-title="{$purchase.date_full}">{$purchase.date_friendly}</span>
                {if not $smarty.foreach.purchases_array.last}
                    <hr />
                {/if}
            {/foreach}
        {else}
            No Purchases.
        {/if}
    </div>
</div>