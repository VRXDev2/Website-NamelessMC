{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="user-nav">
                {if $SHOW_HOME_TAB eq '1'}<a href="{$HOME_URL}" class="user-nav-link">{$HOME}</a>{/if}
                {foreach from=$CATEGORIES item=category}
                    {if count($category.subcategories)}
                        <div class="dropdown">
                            <a class="user-nav-link dropdown-toggle{if $category.active} active{/if}" href="#" id="dropdownMenuButton" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                {$category.title}
                            </a>
                            <div class="dropdown-menu ml-3" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="{$category.url}">{$category.title}</a>
                                {foreach from=$category.subcategories item=subcategory}
                                <a class="dropdown-item" href="{$subcategory.url}">{$subcategory.title}</a> {/foreach}
                            </div>
                        </div>
                    {else}
                    <a href="{$category.url}" class="user-nav-link{if $category.active} active{/if}">{$category.title}</a> {/if}
                {/foreach}
                <a class="btn btn-theme d-block mt-3 ml-3 mr-3" href="{$STORE_URL}"
                    target="_blank">{$VIEW_FULL_STORE}</a>
            </div>
            {if count($WIDGETS)}
                {foreach from=$WIDGETS item=widget}
                    {$widget}
                {/foreach}
            {/if}
        </div>
        <div class="col-lg-9">
            

        {if isset($NO_PACKAGES)}
            <div class="alert alert-info">
                {$NO_PACKAGES}
            </div>
        {else}
            <div class="row">
                {foreach from=$PACKAGES item=package name=packageArray}
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header header-theme">{$package.name}</div>
                            <div class="card-body">
                                {if $package.image}
                                    <div class="text-center"><img class="rounded" style="max-width: 100%;" src="{$package.image}"
                                        alt="{$package.name}"></div><br /> {/if}
                                <span class="store-text-large">{if $package.sale_active}<span
                                            class="store-sale">{$CURRENCY}{$package.price}
                                    </span>{/if}{$CURRENCY}{$package.real_price}</span>
                                <button role="button" class="btn btn-theme pull-right" data-toggle="modal"
                                    data-target="#modal{$package.id}">{$BUY}</button>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}


        </div>
    </div>
</div>
{foreach from=$PACKAGES item=package name=packageArray}
<div class="modal fade" id="modal{$package.id}" tabindex="-1" role="dialog"
    aria-labelledby="modal{$package.id}Label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="modal{$package.id}Label">{$package.name}</span>
            </div>
            <div class="modal-body">
                {if $package.description}
                    <div class="forum_post">
                        {$package.description}
                    </div>
                {/if}
                <span class="store-text-large">{$CURRENCY}{$package.real_price}</span>
                <a href="{$package.link}" target="_blank" rel="nofollow noopener"
                    class="btn btn-theme float-right">{$BUY}</a>
                <button type="button" class="btn btn-secondary float-right mr-2" data-dismiss="modal">{$CLOSE}</button>
            </div>
        </div>
    </div>
</div>
{/foreach}
{include file='footer.tpl'}





