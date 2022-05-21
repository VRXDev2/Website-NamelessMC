{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            {if isset($SUCCESS)}
                <div class="alert alert-success">
                    {$SUCCESS}
                </div>
            {/if} {if isset($ERRORS)}
                <div class="alert alert-danger">
                    {foreach from=$ERRORS item=error} {$error}
                    <br /> {/foreach}
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$SUBMISSIONS}</div>
                <div class="card-body pb-0">
                    <div class="row">
                        <div class="col-md-4">{$FORM_X}</div>
                        <div class="col-md-4">{$CURRENT_STATUS_X}</div>
                        <div class="col-md-4">{$LAST_UPDATED} <span data-toggle="tooltip" data-original-title="{$LAST_UPDATED_DATE}">{$LAST_UPDATED_FRIENDLY}</span></div>
                    </div>
                    <div class="card mt-3 mb-2 form-card">
                        <div class="card-header">
                            <img src="{$USER_AVATAR}" class="avatar-img" style="max-width:20px;max-height:20px;margin-top:-5px" alt="{$USER}" /><a class="username" href="{$USER_PROFILE}" style="{$USER_STYLE}" target="_blank"> {$USER}</a>
                            <span class="float-right" data-toggle="tooltip" data-original-title="{$CREATED_DATE}">{$CREATED_DATE_FRIENDLY}</span>
                        </div>
                        <div class="card-body">
                            {foreach from=$ANSWERS item=answer}
                            <b>{$answer.question}</b>
                            {if $answer.field_type != 10}
                                <p>{$answer.answer}</p>
                              {else}
                                <p><a href="{$PATH_TO_UPLOADS}{$answer.answer}" target="_blank">{$answer.answer}</a></p>
                            {/if}
                            {/foreach}
                        </div>
                    </div>
                </div>
                <div class="card-header header-theme">{$COMMENTS_TEXT}</div>
                <div class="card-body pt-2">
                    {if count($COMMENTS)} {foreach from=$COMMENTS item=comment}
                    <div class="card">
                        <div class="card-header">
                            {if !empty($comment.avatar)}
                                <img src="{$comment.avatar}" class="avatar-img" style="max-height:20px;max-width:20px;margin-top:-5px" alt="{$comment.username}" /><a class="username" href="{$comment.profile}" style="{$comment.style}" target="_blank"> {$comment.username}</a>
                            {else}
                                <i class="fa-solid fa-user"></i> {$comment.username}
                            {/if}
                            <span class="float-right" data-toggle="tooltip" data-original-title="{$comment.date}">{$comment.date_friendly}</span>
                        </div>
                        <div class="card-body pt-0">
                            {$comment.content}
                        </div>
                    </div>
                    {/foreach} {else} {$NO_COMMENTS}
                    {/if} {if $CAN_COMMENT}
                    <form class="mt-2" action="" method="post">
                        <div class="form-group">
                            <textarea class="form-control" name="content" rows="5" placeholder="{$NEW_COMMENT}"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                        </div>
                    </form>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}