{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$MOVE_TOPIC}</div>
        <div class="card-body">
            <div class="container">
                <form action="" method="post">
                    <div class="form-group">
                        <label for="InputForum">{$MOVE_TO}</label>
                        <select class="form-control" name="forum" id="InputForum">
                            {foreach from=$FORUMS item=forum}
                                <option value="{$forum->id}">{$forum->forum_title|escape}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                        <a class="btn btn-secondary" href="{$CANCEL_LINK}"
                            onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}