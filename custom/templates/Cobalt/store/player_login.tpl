{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='store/navbar.tpl'}
            {if count($WIDGETS_LEFT)}
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            {/if}
        </div>
        <div class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }col-lg-6{else}col-lg-9{/if}">
            {if isset($ERRORS)}
                <div class="alert alert-danger">
                    {foreach from=$ERRORS item=error}
                        {$error}<br />
                    {/foreach}
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$STORE} &raquo; {$ACTIVE_CATEGORY}</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="username">{$PLEASE_ENTER_USERNAME}</label>
                            <input class="form-control" type="text" name="username" id="username">
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="hidden" name="type" value="store_login">
                            <button type="submit" class="btn btn-theme">{$CONTINUE} &raquo;</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        {if count($WIDGETS_RIGHT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}
    </div>
</div>
{include file='footer.tpl'}