{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error}{$error}<br />{/foreach}
        </div>
    {/if}
    {if isset($ERROR_CONTENT)}
        <div class="alert alert-danger">
            {$ERROR_CONTENT}
        </div>
    {/if}
    {if isset($ERROR_EMAIL)}
        <div class="alert alert-danger">
            {$ERROR_EMAIL}
        </div>
    {/if}
    {if isset($SUCCESS)}
        <div class="alert alert-success">
            {$SUCCESS}
        </div>
    {/if}
    <div class="card">
        <div class="card-header header-theme">{$TITLE}</div>
        <div class="card-body">
            <form action="" method="post">
                <div class="form-group">
                    <input type="email" name="email" id="email" class="form-control" placeholder="{$EMAIL}" tabindex="3">
                </div>
                <div class="form-group">
                    <textarea id="inputMessage" name="content" class="form-control" rows="5" placeholder="{$MESSAGE}"></textarea>
                </div>
                {if $CAPTCHA}
                <div class="form-group">
                    {$CAPTCHA}
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