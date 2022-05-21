<div class="card widget-card stats-card">
    <div class="card-header header-theme widget-header">{$STATISTICS}</div>
    <div class="card-body">
      {if isset($FORUM_STATISTICS)}
        {$TOTAL_THREADS}<b class="float-right">{$TOTAL_THREADS_VALUE}</b><br />
        {$TOTAL_POSTS}<b class="float-right">{$TOTAL_POSTS_VALUE}</b><br />
      {/if}
      {$USERS_REGISTERED}<b class="float-right">{$USERS_REGISTERED_VALUE}</b><br />
      {if $USERS_ONLINE}{$USERS_ONLINE}<b class="float-right">{$USERS_ONLINE_VALUE}</b><br />{/if}
      {if $GUESTS_ONLINE}{$GUESTS_ONLINE}<b class="float-right">{$GUESTS_ONLINE_VALUE}</b><br />{/if}
      {if $TOTAL_ONLINE}{$TOTAL_ONLINE}<b class="float-right">{$TOTAL_ONLINE_VALUE}</b><br />{/if}
      {$LATEST_MEMBER}<br /><a class="white-link" style="{$LAST_MEMBER_VALUE.style}" href="{$LATEST_MEMBER_VALUE.profile}" data-poload="{$USER_INFO_URL}{$LATEST_MEMBER_VALUE.id}" data-html="true" data-placement="top"><b>{$LATEST_MEMBER_VALUE.nickname}</b></a>
    </div>
</div>