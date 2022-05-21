{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">

    <div class="card">
        <div class="card-header header-theme">{$VIEW_POLL->subject}</div>
        <div class="card-body">
            {foreach from=$VIEW_POLL_OPTIONS key=key item=opt}
                <div class="poll-option">
                    <div class="option-title">{$opt->name}: </div>
                    {foreach from=$VIEW_POLL_VOTES[$opt->id] item=user name=poll_users}
                        {$user}{if not $smarty.foreach.poll_users.last}, {/if}
                    {/foreach}
                </div>
            {/foreach}

        </div>
    </div>

</div>

{include file='footer.tpl'}