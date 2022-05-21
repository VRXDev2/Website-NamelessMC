{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="user-nav">
                {if $SHOW_HOME_TAB eq '1'}<a href="{$HOME_URL}" class="user-nav-link active">{$HOME}</a>{/if}
                {foreach from=$CATEGORIES item=category}
                    {if count($category.subcategories)}
                        <div class="dropdown">
                            <a class="user-nav-link dropdown-toggle" href="#" id="dropdownMenuButton" data-toggle="dropdown"
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
                    <a href="{$category.url}" class="user-nav-link">{$category.title}</a> {/if}
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
            <div class="card">
                <div class="card-header header-theme">{$STORE}</div>
                <div class="card-body">{$CONTENT}</div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}