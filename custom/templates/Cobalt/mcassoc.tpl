{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$VERIFY_ACCOUNT}</div>
        <div class="card-body">
            <div class="alert alert-info">{$VERIFY_ACCOUNT_HELP}</div>
            {if !isset($STEP)}
                <div id="mcassoc-body">{$MCASSOC}</div>
            {else}
                {if isset($ERROR)}
                    <div class="alert alert-danger">
                        {$ERROR}
                    </div>
                    <br />
                    <a class="btn btn-secondary" href="{$RETRY_LINK}">{$RETRY_TEXT}</a>
                {elseif isset($SUCCESS)}
                    <div class="alert alert-success">
                        {$SUCCESS}
                    </div>
                    <br />
                    <a class="btn btn-theme" href="{$LOGIN_LINK}">{$LOGIN_TEXT}</a>
                {/if}
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}

{*  
 *  ValentinXD
 *  21683
 *  83139
 *  1649870447
 *  a054306a9a3fd032ded20ec917c6e6a0
 *  9c4a5c8b321ac5507c4f7aa2484c8867
 *}