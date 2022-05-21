{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error} {$error}
            <br /> {/foreach}
        </div>
    {/if}
    <div class="card">
        <div class="card-header header-theme">{$CONNECT_WITH_AUTHME}</div>
        <div class="card-body">
            <form action="" method="post">
                <div class="alert alert-info">
                    <p>{$AUTHME_SUCCESS}</p>
                    {$AUTHME_INFO}
                </div>
                <div class="form-group">
                    <label for="inputEmail">{$EMAIL}</label>
                    <input type="email" id="inputEmail" name="email" class="form-control" placeholder="{$EMAIL}">
                </div>
                {if isset($NICKNAME)}
                <div class="form-group">
                    <label for="inputNickname">{$NICKNAME}</label>
                    <input type="text" id="inputNickname" name="nickname" class="form-control" placeholder="{$NICKNAME}">
                </div>
                {/if}
                <div class="form-group">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                </div>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}