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
            <div class="card">
                <div class="card-header header-theme">{$STORE}</div>
                <div class="card-body">
                    {$CHECKOUT_COMPLETE_CONTENT}
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