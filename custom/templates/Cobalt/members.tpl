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
                <div class="card-body">
                    <a href="{$ALL_LINK}" class="btn btn-theme mb-3">{$DISPLAY_ALL}</a>
                    {foreach from=$GROUPS item=groups}
                        <a href="{$groups.link}" class="btn btn-theme mb-3">{$groups.name}</a>
                    {/foreach}
                    <div class="table-responsive">
                        <table class="table table-striped dataTables-users">
                            <thead>
                                <tr>
                                    <th>{$USERNAME}</th>
                                    <th>{$GROUP}</th>
                                    <th>{$CREATED}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$MEMBERS item=member}
                                    <tr>
                                        <td>
                                            <img src="{$member.avatar}" class="avatar-img mr-1" style="height:30px; width:30px;" alt="{$member.nickname}" />
                                            <a class="username" style="{$member.style}" href="{$member.profile}">{$member.nickname}</a>
                                        </td>
                                        <td>{foreach from=$member.groups item=group}<span class="d-inline-block mr-2">{$group}</span>{/foreach}</td>
                                        <td>{$member.joined}</td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
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