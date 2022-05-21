{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$PURCHASING_RESOURCE}</div>
        <div class="card-body">
            <div class="alert alert-info">{$PURCHASE_COMPLETE}</div>
            <hr />
            <a href="{$BACK_LINK}" class="btn btn-secondary">{$BACK}</a>
        </div>
    </div>
</div>
{include file='footer.tpl'}