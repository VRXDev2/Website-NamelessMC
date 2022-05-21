{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$INFRACTIONS}</div>
        <div class="card-body">
            {if isset($INFRACTIONS_LIST)}

                <div class="table-responsive">
                    <table class="table table-striped">
                        <colgroup>
                            <col span="1" style="width: 20%;">
                            <col span="1" style="width: 15%;">
                            <col span="1" style="width: 15%">
                            <col span="1" style="width: 20%">
                            <col span="1" style="width: 30%">
                            <!--<col span="1" style="width: 10%">-->
                        </colgroup>

                        <thead>
                            <tr>
                                <th>{$USERNAME}</th>
                                <th>{$STAFF_MEMBER}</th>
                                <th>{$ISSUED}</th>
                                <th>{$ACTION}</th>
                                <th>{$REASON}</th>
                                <!--<th></th>-->
                            </tr>
                        </thead>

                        <tbody>
                            {foreach from=$INFRACTIONS_LIST item=infraction}
                                <tr>
                                    <td><img style="max-height:30px; max-width:30px;" class="avatar-img"
                                            src="{$infraction.avatar}">
                                        <a href="{if !empty($infraction.profile)}{$infraction.profile}{else}#{/if}"
                                            style="{$infraction.username_style}">{$infraction.username}</a>
                                    </td>
                                    <td><img style="max-height:30px; max-width:30px;" class="avatar-img"
                                            src="{$infraction.staff_member_avatar}"> <a
                                            href="{if !empty($infraction.staff_member_link)}{$infraction.staff_member_link}{else}#{/if}"
                                            style="{$infraction.staff_member_style}">{$infraction.staff_member}</a></td>
                                    <td><span data-toggle="tooltip"
                                            title="{$infraction.issued_full}">{$infraction.issued}</span>
                                    </td>
                                    <td>
                                        {if $infraction.action_id == 1 || $infraction.action_id == 2}
                                            <span class="badge badge-danger">{$infraction.action}</span>
                                        {elseif $infraction.action_id == 3 || $infraction.action_id == 4}
                                            <span class="badge badge-warning">{$infraction.action}</span>
                                        {elseif $infraction.action_id == 5}
                                            <span class="badge badge-warning">{$infraction.action}</span>
                                        {elseif $infraction.action_id == 6}
                                        <span class="badge badge-secondary">{$infraction.action}</span> {else}
                                        <span class="ui label">{$infraction.action}</span> {/if}
                                        {if $infraction.action_id lte 4 || $infraction.action_id eq 6}
                                            {if $infraction.revoked == 1}
                                                <span data-toggle="tooltip" title="{$infraction.expires_full}"
                                                    class="badge badge-success">{$infraction.revoked_full}</span>
                                            {else}
                                                <span data-toggle="tooltip" title="{$infraction.expires_full}"
                                                    class="badge badge-danger">{$infraction.revoked_full}</span>
                                            {/if}
                                        {/if}
                                    </td>
                                    <td>{$infraction.reason}</td>
                                    <!--<td><a href="{$infraction.view_link}" class="btn btn-sm btn-theme">{$VIEW} &raquo;</a></td>-->
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            {$PAGINATION} {else}
                <div class="alert alert-info">{$NO_INFRACTIONS}</div>
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}