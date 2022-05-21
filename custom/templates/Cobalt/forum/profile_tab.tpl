{$PF_LATEST_POSTS_TITLE}:<br /><br />
{if isset($NO_POSTS)}
    {$NO_POSTS}
{else} 

<div class="card-columns-profile">
{foreach from=$PF_LATEST_POSTS item=post}
        <div class="card">
            <div class="card-body">
                {$post.content}<br /><hr />
                <a class="white-link" href="{$post.link}">{$post.title}</a>
	            <span class="float-right" rel="tooltip" title="{$post.date_full}">{$post.date_friendly}</span>
            </div>
        </div>


{/foreach}
</div>

{/if}
