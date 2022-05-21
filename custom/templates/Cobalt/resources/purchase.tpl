{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$PURCHASING_RESOURCE}</div>
        <div class="card-body">
            {if isset($ERROR)}
            <div class="alert alert-danger">{$ERROR}</div>
            {/if} {$PRE_PURCHASE_INFO}
            <hr />
            <form action="" method="post">
                <input type="hidden" name="token" value="{$TOKEN}">
                <input type="hidden" name="action" value="agree">
                <button type="submit" class="btn btn-theme">{$PURCHASE}</button>
                <a href="{$CANCEL_LINK}" onclick="return confirm('{$CONFIRM_CANCEL}');" class="btn btn-secondary">{$CANCEL}</a>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}