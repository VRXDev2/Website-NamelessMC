{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERROR)}
        <div class="alert alert-danger">{$ERROR}</div>
    {/if}
    <div class="card">
        <div class="card-header header-theme">{$FORUM_SEARCH}</div>
        <div class="card-body">
            {include file='forum/search_box.tpl' form_submit=$FORM_ACTION}
        </div>
    </div>
</div>
{include file='footer.tpl'}