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
                {if count($STAFF_GROUPS)} {foreach from=$STAFF_GROUPS item=group} {if count($group.members)} 
                <div class="card-header" style="color: {$group.color}; font-weight: 600; font-size: 1.3rem">{$group.name}</div>
                <div class="card-body pt-0 pb-0">
                    <div class="row staff-row">
                        {foreach from=$group.members item=member}
                            <div class="col-lg-6 col-xl-4">
                            <div class="staff-flexbox">
                                <div class="staff-avatar-body">
                                    {if $THEME_FULL_BODY_AVATARS == "yes"}
                                        <img class="full-body" src="https://mc-heads.net/body/{$member.username}/right" alt="{$member.username}">
                                    {else}
                                        <img class="avatar-img" style="height: 60px" src="{$member.avatar}" alt="{$member.username}" />
                                    {/if}
                                </div>
                                <div class="staff-info">
                                    <a class="{if $THEME_FULL_BODY_AVATARS == "no"}mt-0 {/if}staff-page-name username{if !empty($member.title)} staff-name-less-margin{/if}" href="{$member.profile}" style="color: {$group.color};">{$member.username}</a>
                                    {if !empty($member.title)}
                                        <span style="font-size: 0.9rem">{$member.title}</span>
                                    {/if}
                                </div>
                            </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
                {/if} {/foreach} {/if}
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