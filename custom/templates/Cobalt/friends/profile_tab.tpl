{if isset($FRIENDS)}
    {if isset($FRIENDS.button)}
        {if ($FRIENDS.button.action == 'add_friend')}
            {assign var='FRIENDS_BUTTON_CLASS' value='btn btn-sm btn-theme'}
            {assign var='FRIENDS_BUTTON_ICON' value='<i class="fa-solid fa-user-plus mr-1"></i>'}
        {else if ($FRIENDS.button.action == 'remove_friend')}
            {assign var='FRIENDS_BUTTON_CLASS' value='btn btn-sm btn-secondary'}
            {assign var='FRIENDS_BUTTON_ICON' value='<i class="fa-solid fa-user-xmark mr-1"></i>'}
        {else if ($FRIENDS.button.action == 'accept_request')}
            {assign var='FRIENDS_BUTTON_CLASS' value='btn btn-sm btn-theme'}
            {assign var='FRIENDS_BUTTON_ICON' value='<i class="fa-solid fa-user-check mr-1"></i>'}
        {else if ($FRIENDS.button.action == 'cancel_request')}
            {assign var='FRIENDS_BUTTON_CLASS' value='btn btn-sm btn-secondary'}
            {assign var='FRIENDS_BUTTON_ICON' value='<i class="fa-solid fa-user-minus mr-1"></i>'}
        {/if}
    {/if}
    {if isset($FRIENDS.button)}
        <form action="" method="post" class="text-right d-block" id="form-friend">
            <input type="hidden" name="token" value="{$TOKEN}">
            <input type="hidden" name="action" value="{$FRIENDS.button.action}">
            <button type="submit" class="{$FRIENDS_BUTTON_CLASS}">{$FRIENDS_BUTTON_ICON} {$FRIENDS.button.text}</button>
        </form>
    {/if}

    {if !empty($FRIENDS.list)}
        <div class="row mt-1">
            {foreach from=$FRIENDS.list item=$friend}
                <div class="col-md-3 mb-3">
                    <div class="friend">
                        <img src="{$friend.avatar}" class="avatar-img friend-img">
                        <a class="username" style="{$friend.style}" href="{$friend.profile}">{$friend.nickname}</a>
                    </div>
                </div>
            {/foreach}
        </div>
    {else}
        {$FRIENDS.no_friends}
    {/if}
{/if}