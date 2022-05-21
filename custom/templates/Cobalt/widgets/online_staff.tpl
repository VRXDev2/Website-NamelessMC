<div class="card widget-card">
    <div class="card-header header-theme widget-header"><div class="widget-header-txt">{$ONLINE_STAFF}</div><div class="number">{$TOTAL_ONLINE_STAFF|regex_replace:'/[^0-9]+/':''}</div></div>
    <div class="card-body">
        {if isset($ONLINE_STAFF_LIST)} {foreach from=$ONLINE_STAFF_LIST name=online_staff_arr item=user}
        <div class="staff-card"{if not $smarty.foreach.online_staff_arr.last} style="margin-bottom: 1rem"{/if}>
            <div class="staff-widget-img">
                <img src="{$user.avatar}" alt="{$user.nickname}" class="avatar-img" style="max-width: 50px;">
            </div>
            <div class="staff-info">
                <a class="staff-name" style="{$user.style}" href="{$user.profile}" data-poload="{$USER_INFO_URL}{$user.id}" data-html="true" data-placement="top">{$user.nickname}</a><br /> {if $user.group} {$user.group} {else} {$user.title} {/if}
            </div>
        </div>
        {/foreach} {else} {$NO_STAFF_ONLINE} {/if}
    </div>
</div>