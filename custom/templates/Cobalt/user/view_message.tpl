{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERROR)}
    <div class="alert alert-danger">
        {$ERROR}
    </div>
    {/if} {if isset($MESSAGE_SENT)}
    <div class="alert alert-success">
        {$MESSAGE_SENT}
    </div>
    {/if}
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header header-theme">
                    {$MESSAGE_TITLE}
                    <span class="float-right">
                        <a href="{$BACK_LINK}" class="btn btn-theme mt-1">{$BACK}</a>
                        <a class="btn btn-secondary mt-1" href="#" data-toggle="modal"
                            data-target="#modal-leave">{$LEAVE_CONVERSATION}</a>
                    </span>
                </div>
                <div class="card-body pt-2">
                    {$PARTICIPANTS_TEXT}: <span class="message-people">{$PARTICIPANTS}</span><br /><br />
                    {foreach from=$MESSAGES item=message}
                    <div class="card">
                    <div class="card-body">
                    <div class="d-flex">
                        <div class="text-center">
                            <img class="avatar-img d-block mb-3" style="width:75px; height:75px" src="{$message.author_avatar}" alt="{$message.author_username}" />
                            <a class="msg-user username" style="{$message.author_style}" href="{$message.author_profile}">{$message.author_username}</a><br />
                            {foreach from=$message.author_groups item=group}{$group}<br />{/foreach}
                        </div>
                        <div class="flex-grow-1 ml-4 position-relative">
                            {$message.content}
                            <br />
                            <span class="float-right msg-date" data-toggle="tooltip" data-trigger="hover"
                                data-original-title="{$message.message_date_full}">{$message.message_date}</span>
                        </div>
                    </div>
                    </div>
                    </div>
                    {/foreach}
                    <div class="no-margin">{$PAGINATION}</div>
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$NEW_REPLY}</div>
                <div class="card-body">
                    <form action="" method="post">
                        {if !isset($MARKDOWN)}
                        <div class="form-group">
                            <textarea style="width:100%" name="content" id="reply" rows="15">{$CONTENT}</textarea>
                        </div>
                        {else}
                        <div class="form-group">
                            <textarea class="form-control" style="width:100%" id="markdown" name="content"
                                rows="15">{$CONTENT}</textarea>
                            <span class="float-right"><i data-toggle="popover" data-placement="top" data-html="true"
                                    data-content="{$MARKDOWN_HELP}" class="fa fa-question-circle text-info"
                                    aria-hidden="true"></i></span>
                        </div>
                        {/if}
                        <div class="form-group mb-0">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-leave" tabindex="-1" role="dialog" aria-labelledby="modal-leaveLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="modal-leaveLabel">{$LEAVE_CONVERSATION}</span>
            </div>
            <div class="modal-body">
                {$CONFIRM_LEAVE}
                <form action="{$LEAVE_CONVERSATION_LINK}" method="post" id="leave-form">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="button" class="btn btn-secondary mt-4" data-dismiss="modal">{$NO}</button>
                    <button class="btn btn-theme mt-4" type="submit">{$YES}</button>
                </form>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}