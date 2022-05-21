{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$CONFIRM_REDIRECT}</div>
        <div class="card-body">
            {$CONFIRM_REDIRECT}
            <hr />
            <a href="{$FORUM_INDEX}" class="btn btn-secondary">{$NO}</a>
            <a href="{$REDIRECT_URL}" target="_blank" rel="noopener nofollow" class="btn btn-theme">{$YES}</a>
        </div>
    </div>
</div>
{include file='footer.tpl'}