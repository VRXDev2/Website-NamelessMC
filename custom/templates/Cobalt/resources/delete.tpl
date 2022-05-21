{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$DELETE}</div>
        <div class="card-body">
            {$CONFIRM_DELETE_RESOURCE}<br /><br /> {if isset($ERRORS)}
            <div class="alert alert-danger">
                {foreach from=$ERRORS item=error} {$error}
                <br /> {/foreach}
            </div>
            {/if}
            <form action="" method="post">
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-theme">{$DELETE}</button>
                <a class="btn btn-secondary" href="{$CANCEL_LINK}">{$CANCEL}</a>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}