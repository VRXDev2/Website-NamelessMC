{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">
            {$SEARCH_RESULTS}
            <a href="{$NEW_SEARCH_URL}" class="btn btn-theme float-right">{$NEW_SEARCH}</a>
        </div>
        <div class="card-body">
            {if isset($RESULTS)} 
                <div class="card">
                    <div class="card-body">
                        
                        {foreach from=$RESULTS item=result name=search}
                            <div class="d-flex">
                                <div>
                                    <a href="{$result.post_author_profile}" data-poload="{$USER_INFO_URL}{$result.post_author_id}" data-html="true" data-placement="top"><img class="avatar-img" src="{$result.post_author_avatar}" style="height:45px; width:45px;"/></a>
                                </div>
                                <div class="flex-grow-1 ml-3">
                                    <a class="white-link" href="{$result.post_url}">{$result.topic_title}</a><br />
                                    <a href="{$result.post_author_profile}" style="{$result.post_author_style}" data-poload="{$USER_INFO_URL}{$result.post_author_id}" data-html="true" data-placement="top">{$result.post_author}</a>
                                    &bull; <span data-toggle="tooltip" title="{$result.post_date_full}">{$result.post_date_friendly}</span>
                                </div>
                                <a href="{$result.post_url}" class="btn btn-theme" style="height: fit-content">{$READ_FULL_POST} <i class="fa-solid fa-share"></i></a>
                            </div>
                            {if !$smarty.foreach.search.last}
                            <hr /> 
                            {/if}
                        {/foreach} 
                        
                    </div>
                </div>
            {else}
                <div class="alert alert-info">
                    {$NO_RESULTS}
                </div>
            {/if}
            {if isset($PAGINATION)} {$PAGINATION} {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}