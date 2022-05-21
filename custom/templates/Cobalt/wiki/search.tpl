{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <ol class="breadcrumb">
                <li><a href="{$WIKI_HOME_LINK}" class="white-link">{$WIKI}</a></li>
                <div class="divider" style="margin: 0 12px"> / </div>
                <li class="active">{$SEARCH_RESULTS_LANG} {$SEARCH_RESULT}</li>
            </ol> 
            <div class="card">
                <div class="card-header header-theme">{$SEARCH_RESULTS_LANG} {$SEARCH_RESULT}</div>
                <div class="card-body">

                    {if $SEARCH_RESULTS|@count <= 0}
                        {$SEARCH_NO_RESULTS}
                    {else}
                        {if $SEARCH_RESULTS|@count > 1}<div class="row">{/if}
                        {foreach from=$SEARCH_RESULTS item=result}
                           {if $SEARCH_RESULTS|@count > 1}<div class="col-md-6">{/if}
                            <div class="card">
                                <div class="card-body">
                                <span style="font-size: 1.1rem" class="d-inline-block mt-1">
                                    <i class="{$result->icon}"></i>
                                    {$result->button}
                                </span>
                                <a href="../wiki/{$result->nameid}" class="btn btn-theme float-right">View</a>
                                </div>
                            </div>
                            {if $SEARCH_RESULTS|@count > 1}</div>{/if}
                        {/foreach} 
                        {if $SEARCH_RESULTS|@count > 1}</div>{/if}
                    {/if}

                </div>
            </div>
        </div>
        <div class="col-md-3">
            {include file='wiki/widgets/search-box.tpl'}
            {include file='wiki/widgets/side-menu.tpl'}
        </div>
    </div>
</div>
{include file='footer.tpl'}