<div class="card widget-card">
    <div class="card-header header-theme widget-header">{$LATEST_PROFILE_POSTS}</div>
    <div class="card-body">
        {if isset($PROFILE_POSTS_ARRAY)}
            {foreach from=$PROFILE_POSTS_ARRAY name=profile_posts item=post}
                <div class="widget-post-flex"{if not $smarty.foreach.profile_posts.last} style="margin-bottom: 15px"{/if}>
                    <div class="post-avatar">
                        <img src="{$post.avatar}" alt="{$post.username}" />
                    </div>
                    <div class="post-info">
                        <a class="white-link" href="{$post.link}">{$post.content}</a><br />
                        <a class="username" href="{$post.user_profile_link}" style="{$post.username_style}" data-poload="{$USER_INFO_URL}{$post.user_id}" data-html="true" data-placement="top">{$post.username}</a>
                        <br /><span data-toggle="tooltip" data-trigger="hover" data-original-title="{$post.date_ago}">{$post.ago}</span>
                    </div>
                </div>
            {/foreach}
        {else}
            {$NO_PROFILE_POSTS}
        {/if}
    </div>
</div>