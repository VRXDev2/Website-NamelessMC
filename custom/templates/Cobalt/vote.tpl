{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        {if count($WIDGETS_LEFT)}
            <div class="col-lg-3">
                {foreach from=$WIDGETS_LEFT item=widget}
                    {$widget}
                {/foreach}
            </div>
        {/if}
        <div class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT)}col-lg-6{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}col-lg-9{else}col-lg-12{/if}">
            <div class="card">
                <div class="card-header header-theme">{$TITLE}</div>
                <div class="card-body pb-0">
                    {if isset($MESSAGE_ENABLED)}
                        <div class="mb-2">{$MESSAGE}</div>
                    {/if}
                    {if $THEME_VOTE_REWARDS != ""}
                        <div class="reward-box">
                            {if isset($THEME_VOTE_REWARDS_ICON)}
                                <div class="reward-icon">
                                    <picture>
                                        <source srcset="{$THEME_VOTE_REWARDS_ICON_WEBP}" type="image/webp">
                                        <source srcset="{$THEME_VOTE_REWARDS_ICON}">
                                        <img alt="Vote Reward Icon" src='{$THEME_VOTE_REWARDS_ICON}' />
                                    </picture>
                                </div>
                            {/if}
                            <div class="reward-text">{$THEME_VOTE_REWARDS}</div>
                        </div>
                    {/if}
                    <div class="row d-flex justify-content-center">
                        {foreach from=$SITES item=site}
                            <div class="col-md-6 mb-4">
                                <a class="btn btn-block btn-theme vote-btn d-flex" href="{$site.url}" target="_blank"
                                    role="button" rel="noopener nofollow">
                                    <div class="align-self-center">{$site.name}</div>
                                    <div class="vote-icon ml-4"><i class="fa-solid fa-up-right-from-square"></i></div>
                                </a>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
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
{include file='footer.tpl'}