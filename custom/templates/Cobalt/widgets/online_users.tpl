<div class="card widget-card">
    <div class="card-header header-theme widget-header"><div class="widget-header-txt">{$ONLINE_USERS}</div><div class="number">{$TOTAL_ONLINE_USERS|regex_replace:'/[^0-9]+/':''}</div></div>
    <div class="card-body">
        {if isset($ONLINE_USERS_LIST)} {foreach from=$ONLINE_USERS_LIST name=online_users_arr item=user}
        <a class="grey-link" href="{$user.profile}" data-poload="{$USER_INFO_URL}{$user.id}" data-html="true" data-placement="top">{if $SHOW_NICKNAME_INSTEAD}{$user.nickname}{else}{$user.username}{/if}</a>
        {if not $smarty.foreach.online_users_arr.last},{/if} {/foreach} 
        {else} {$NO_USERS_ONLINE} {/if}
    </div>
</div>