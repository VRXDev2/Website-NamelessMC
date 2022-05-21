{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="cf-full-post">
        <div class="cf-full-post-img" style="background-image: url({$post_image})"></div>
        <div class="cf-full-post-body">
            <div class="d-flex">
                <div class="cf-full-post-title theme-text flex-grow-1">{$post_name}</div>
                <div class="readtime">{$post_readtime}</div>
            </div>
            <div class="d-flex mt-2 mb-4">
                <a href="{$post_author_profile}"><img class="avatar-img" src="{$post_avatar}" alt="{$post_author}"
                        style="height: 25px; width: 25px" /></a>
                <div class="cf-full-post-info ml-2 mr-3">
                    <span class="cf-full-post-author d-inline-block mr-4"><a class="username"
                            style="{$post_author_styles}" href="{$post_author_profile}">{$post_author}</a>
                        {$post_author_groups}</span> {$post_date}
                </div>
            </div>
            <div class="cf-full-post-content mb-4">
                {$post_content}
            </div>
        </div>
    </div>

    {if !empty($GHOST_POSTS)}
    <div class="more-posts mb-4" style="font-size: 2rem; font-weight: 600; color: #FFF; margin-top: 3rem">{$MORE_POSTS}
    </div>
    {include file='ghost/post-list.tpl'}
    {/if}
</div>
{include file='footer.tpl'}