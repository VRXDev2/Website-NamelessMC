{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">
    <div class="row">
        <div class="col-lg-9">
            {if isset($SESSION_SUCCESS_POST)}
                <div class="alert alert-success" role="alert">
                    {$SUCCESS}<br />
                    {$SESSION_SUCCESS_POST}
                </div>
            {/if}
            {if isset($ERRORS)}
                <div class="alert alert-danger" role="alert">
                    {foreach from=$ERRORS item=error}
                        {$error}<br />
                    {/foreach}
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">
                    {$TITLE}
                    <a class="btn btn-secondary float-right" href="{$BACK_LINK}">{$BACK}</a>
                </div>
                <div class="card-body">



                <article class="panel panel-theme">
                <div class="panel-heading">
                    <a href="{$POSTER_PROFILE}" class="{$POSTER_TAG}" style="{$POSTER_STYLE}" target="_blank"><img
                src="{$POSTER_AVATAR}" class="avatar-img" style="max-height:20px;max-width:20px;"
                alt="{$POSTER_USERNAME}" />
            {$POSTER_USERNAME}</a>

                    <span class="float-right" data-toggle="tooltip" data-original-title="{$POSTER_DATE}">{$POSTER_DATE_FRIENDLY}</span>
                </div>
                <div class="panel-footer">
                    <div class="forum_post">
                        {$CONTENT}<br />
                    <form class="d-inline" action="" method="post">
                        <input type="hidden" name="action" value="vote">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="vote" value="1">
                        <a class="btn mt-3 mb-2 mr-1 {if {$VOTED} == 1}btn-theme{else}btn-secondary{/if}" href="#" onclick="$(this).closest('form').submit();" rel="tooltip"
                            data-content="Like"><i class="fa-solid fa-thumbs-up"></i> {$LIKES}</a>
                    </form>
                    <form class="d-inline" action="" method="post">
                        <input type="hidden" name="action" value="vote">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="vote" value="2">
                        <a class="btn mt-3 mb-2 {if {$VOTED} == 2}btn-theme{else}btn-secondary{/if}" href="#" onclick="$(this).closest('form').submit();" rel="tooltip"
                            data-content="Dislike"><i class="fa-solid fa-thumbs-down"></i> {$DISLIKES}</a>
                    </form>
                    {if isset($CAN_MODERATE)}
                        <button class="btn btn-secondary float-right mt-3 mb-2" data-toggle="modal" data-target="#deleteModal"><i class="fa-solid fa-trash"></i></button>
                        <a class="btn btn-secondary float-right mr-2 mt-3 mb-2" href="{$EDIT_LINK}"><i class="fa-solid fa-pencil"></i></a>
                    {/if}
                    </div>
                </div>
            </article>




                
                </div>

                <div class="card-header header-theme" style="margin-top: -2.5rem">
                {$COMMENTS_TEXT}
            </div>

                <div class="card-body">

                    {if count($COMMENTS_LIST)}
                        <div class="timeline">
                            <div class="line text-muted"></div>
                            {foreach from=$COMMENTS_LIST item=comment}
                                <article class="panel panel-theme" id="post-id-{$post.id}">
                                    <div class="panel-heading icon">
                                        <img class="avatar-img" style="height:40px; width:40px;" src="{$comment.avatar}"
                                            alt="{$comment.username}" />
                                    </div>
                                    <div class="panel-heading">
                                        <a href="{$comment.profile}" class="{$comment_tag}" style="{$comment.style}"
                                            target="_blank">{$comment.username}</a>
                                        <span class="float-right" data-toggle="tooltip"
                                            data-original-title="{$comment.date}">{$comment.date_friendly}</span>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="forum_post">
                                            {$comment.content}
                                            {if isset($CAN_MODERATE)}
                                                <div class="text-right">
                                                    <button class="btn btn-secondary mt-2" data-toggle="modal"
                                                        data-target="#modal-delete-{$comment.id}"><i class="fa-solid fa-trash"></i></button>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                </article>
                            {/foreach}
                        </div>
                    {else}
                        {$NO_COMMENTS}
                    {/if}

                    {if isset($CAN_COMMENT)}
                        <form action="" method="post">
                            {if isset($CAN_MODERATE)}
                                <div class="form-group">
                                    <label for="statusLabel">Status </label>
                                    <select class="form-control" name="status" id="status">
                                        {foreach from=$STATUSES item=item}
                                            <option value="{$item.id}" {if $STATUS == $item.id}selected{/if}>{$item.name}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            {/if}
                            <div class="form-group">
                                <textarea class="form-control" name="content" rows="5"
                                    placeholder="{$NEW_COMMENT}"></textarea>
                            </div>
                            <input type="hidden" name="action" value="comment">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                        </form>
                    {/if}
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            {include file='suggestions/search.tpl'}
            {include file='suggestions/recent_activity.tpl'}
        </div>
    </div>
</div>

{if isset($CAN_MODERATE)}
    {foreach from=$COMMENTS_LIST item=comment}
        <div class="modal fade" id="modal-delete-{$comment.id}" tabindex="-1" role="dialog"
            aria-labelledby="modal-delete-{$comment.id}Label" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="modal-title" id="modal-delete-{$comment.id}Label">{$CONFIRM_DELETE}</span>
                    </div>
                    <div class="modal-body">
                        <p>{$CONFIRM_DELETE_COMMENT}</p>
                    </div>
                    <div class="modal-footer">
                        <form action="" method="post">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                            <input type="hidden" name="action" value="deleteComment">
                            <input type="hidden" name="cid" value="{$comment.id}">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type="submit" class="btn btn-theme">{$DELETE}</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    {/foreach}
{/if}

{if isset($CAN_MODERATE)}
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="deleteModalLabel">{$CONFIRM_DELETE}</span>
                </div>
                <div class="modal-body">
                    <p>{$CONFIRM_DELETE_SUGGESTION}</p>
                </div>
                <div class="modal-footer">
                    <form action="" method="post">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CANCEL}</button>
                        <input type="hidden" name="action" value="deleteSuggestion">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-theme">{$DELETE}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
{/if}

{include file='footer.tpl'}