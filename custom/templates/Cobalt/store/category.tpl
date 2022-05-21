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
                <div class="card-body">{$CONTENT}</div>
            </div>
            {if isset($NO_PRODUCTS)}
                <div class="alert alert-danger">
                    {$NO_PRODUCTS}
                </div>
            {else}
                <div class="row">
                    {foreach from=$PRODUCTS item=product}
                        <div class="col-lg-6 col-xl-4">
                            <div class="card">
                                <div class="card-header header-theme">{$product.name}</div>
                                <div class="card-body">
                                    {if $product.image}
                                        <div class="text-center"><img class="rounded" style="max-width: 100%;"
                                            src="{$product.image}" alt="{$product.name}"></div><br /> {/if}

                                    <span class="store-text-large">{if $product.sale_active}<span
                                                class="store-sale">{$CURRENCY_SYMBOL}{$product.price}{$CURRENCY}
                                        </span>{/if}{$CURRENCY_SYMBOL}{$product.real_price} {$CURRENCY}</span>
                                    <button role="button" class="btn btn-theme float-right" data-toggle="modal"
                                        data-target="#modal{$product.id}">{$BUY}</button>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {/if}
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
{foreach from=$PRODUCTS item=product}
    <div class="modal fade" id="modal{$product.id}" tabindex="-1" role="dialog" aria-labelledby="modal{$product.id}Label"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="modal{$package.id}Label">{$product.name}</span>
                </div>
                <div class="modal-body">
                    {if $product.image}<img src="{$product.image}" alt="{$product.name}">{/if}
                    <div class="forum_post mb-3">{$product.description}</div>
                    <span class="store-text-large">{$CURRENCY_SYMBOL}{$product.price} {$CURRENCY}</span>
                    <a href="{$product.link}" class="btn btn-theme float-right">{$BUY}</a>
                    <button type="button" class="btn btn-secondary float-right mr-2" data-dismiss="modal">{$CLOSE}</button>
                </div>
            </div>
        </div>
    </div>
{/foreach}
{include file='footer.tpl'}