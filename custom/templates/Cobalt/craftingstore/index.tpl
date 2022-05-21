{include file='header.tpl'}{include file='navbar.tpl'}

<div class="container">
    <div class="row">
    <div class="col-lg-3">
        {include file='craftingstore/parts/nav.tpl'}
    </div>
    <div class="col-lg-9">
        <div class="card">
            <div class="card-header header-theme">{$STORE}</div>
            <div class="card-body">{$CONTENT}</div>
        </div>
    </div>
    </div>
</div>
{include file='footer.tpl'}