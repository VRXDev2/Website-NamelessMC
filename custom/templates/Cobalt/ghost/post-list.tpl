<div class="post-list mb-4">
    {foreach $GHOST_POSTS item=post}
        <div class="{$post.card_size}">
            <div class="post-card-img">
                <a href="{$post.link}"><img src="{$post.image}" alt="{$post.name}" loading="lazy"></a>
            </div>
            <div class="post-card-body">
                <div class="post-card-title"><a class="theme-text" href="{$post.link}">{$post.name}</a></div>
                <div class="post-card-content">{$post.content}</div>
                {if $post.card_size == "post-card-large"}
                    <div class="post-card-footer">
                        <a href="{$post.author_profile}"><img class="avatar-img" src="{$post.avatar}" alt="{$post.author}"
                                style="height: 40px; width: 40px" /></a>
                        <div class="full-post-info ml-3 flex-grow-1 mr-3">
                            <div class="full-post-author"><a class="username" style="{$post.author_styles}"
                                    href="{$post.author_profile}">{$post.author}</a></div>
                            <div>{$post.date}</div>
                        </div>
                        <div class="readtime">{$post.readtime}</div>
                    </div>
                {/if}
            </div>
            {if $post.card_size !== "post-card-large"}
                <div class="post-card-footer outside-footer">
                    <a href="{$post.author_profile}"><img class="avatar-img" src="{$post.avatar}" alt="{$post.author}"
                            style="height: 40px; width: 40px" /></a>
                    <div class="full-post-info ml-3 flex-grow-1 mr-3">
                        <div class="full-post-author"><a class="username" style="{$post.author_styles}"
                                href="{$post.author_profile}">{$post.author}</a></div>
                        <div>{$post.date}</div>
                    </div>
                    <div class="readtime">{$post.readtime}</div>
                </div>
            {/if}
        </div>
    {/foreach}
</div>