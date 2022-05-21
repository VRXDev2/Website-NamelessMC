{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header header-theme">
                    {$MESSAGING}
                    {if isset($NEW_MESSAGE)}
                        <a href="{$NEW_MESSAGE_LINK}" class="btn btn-theme float-right">{$NEW_MESSAGE}</a>
                    {/if}
                </div>
                <div class="card-body">
                    {if count($MESSAGES)}
                    <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>{$MESSAGE_TITLE}</th>
                                <th>{$PARTICIPANTS}</th>
                                <th>{$LAST_MESSAGE}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$MESSAGES item=message}
                            <tr>
                                <td><a class="grey-link" href="{$message.link}">{$message.title}</a></td>
                                <td><span class="message-people">{$message.participants}</span></td>
                                <td>
                                    <div class="d-flex">
                                        <div>
                                            <a href="{$message.last_message_user_profile}">
                                                <img class="avatar-img" style="max-height:30px; max-width:30px;" src="{$message.last_message_user_avatar}" alt="{$message.last_message_user}" />
                                            </a>
                                        </div>
                                        <div class="flex-grow-1 ml-3">
                                            <span data-toggle="tooltip" data-trigger="hover" data-original-title="{$message.last_message_date_full}">{$message.last_message_date}</span><br />
                                            {$BY} <a class="msg-user username" style="{$message.last_message_user_style}" href="{$message.last_message_user_profile}">{$message.last_message_user}</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                    </div>
                    {$PAGINATION} {else} {$NO_MESSAGES} {/if}
                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}