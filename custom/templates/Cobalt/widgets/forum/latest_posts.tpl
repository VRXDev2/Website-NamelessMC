<div class="card widget-card">
    <div class="card-header header-theme widget-header">{$LATEST_POSTS}</div>
    <div class="card-body">
        {foreach from=$LATEST_POSTS_ARRAY item=post name=latest_posts}
            <div class="widget-post-flex"{if not $smarty.foreach.latest_posts.last} style="margin-bottom: 15px"{/if}>
                <div class="post-avatar">
                    <img src="{$post.last_reply_avatar}" alt="{$post.last_reply_username}" />
                </div>
                <div class="post-info">
                    <a class="white-link" href="{$post.last_reply_link}">{$post.topic_title}</a><br />
                    <a class="username" href="{$post.last_reply_profile_link}" style="{$post.last_reply_style}" data-poload="{$USER_INFO_URL}{$post.last_reply_user_id}" data-html="true" data-placement="top">{$post.last_reply_username}</a><br />
                    <span data-toggle="tooltip" data-trigger="hover" data-original-title="{$post.last_reply}">{$post.last_reply_rough}</span>
                </div>
            </div>
        {/foreach}
    </div>
</div>

{*  
 *  ValentinXD
 *  21683
 *  83139
 *  1649870447
 *  a054306a9a3fd032ded20ec917c6e6a0
 *  9c4a5c8b321ac5507c4f7aa2484c8867
 *}