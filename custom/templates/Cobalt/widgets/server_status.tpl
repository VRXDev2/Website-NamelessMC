<div class="card widget-card">
    <div class="card-header header-theme widget-header">
        <div class="widget-header-txt">{$SERVER_STATUS}</div>
        <div class="status-badge">
            {if $SERVER.status_value eq 1}
                <span class="badge badge-success">{$ONLINE}</span>
            {else}
                <span class="badge badge-danger">{$OFFLINE}</span>
            {/if}
        </div>
    </div>
    <div class="card-body">
        {if isset($SERVER)}
            {if $SERVER.status_value eq 1}
                {$ONLINE}: <strong>{$SERVER.player_count} / {$SERVER.player_count_max}</strong><br />
                {$IP}: <strong>{$SERVER.join_at}</strong><br />
                {if isset($VERSION)}{$VERSION}<br />{/if}
                {if isset($SERVER.format_player_list) && count($SERVER.format_player_list)}
                    {foreach from=$SERVER.format_player_list item=player}
                        <a href="{$player.profile}" data-toggle="tooltip" data-original-title="{$player.username}"><img class="avatar-img" src="{$player.avatar}" alt="{$player.username}" style="width: 35px; margin-bottom: 5px" /></a>
                    {/foreach}
                {/if}
            {/if}
        {else}
            {$NO_SERVERS}
        {/if}
    </div>
</div>