{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERROR)}
        <div class="alert alert-danger">
            {$ERROR}
        </div>
    {elseif isset($SUCCESS)}
        <div class="alert alert-success">
            {$SUCCESS}
        </div>
    {/if}
    <div class="card">
        <div class="card-header header-theme">{$FORGOT_PASSWORD}</div>
        <div class="card-body">
            <form role="form" action="" method="post">
                <p>{$FORGOT_PASSWORD_INSTRUCTIONS}</p>
                <div class="form-group">
                    <input type="email" id="inputEmail" name="email" placeholder="{$EMAIL_ADDRESS}" class="form-control">
                </div>
                <div class="form-group">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                </div>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}