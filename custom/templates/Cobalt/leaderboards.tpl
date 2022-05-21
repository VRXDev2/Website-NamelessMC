{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">
    <div class="row">
        <div class="col-lg-3">
            <div class="nav flex-column nav-pills" id="pills-tab" role="tablist" aria-orientation="vertical">
                {foreach from=$LEADERBOARD_PLACEHOLDERS item=placeholder key=i}
                <a class="btn mb-1 btn-theme btn-lg btn-block"
                    id="pills-{$placeholder->safe_name}-server-{$placeholder->server_id}-tab" data-toggle="pill"
                    href="#pills-{$placeholder->safe_name}-server-{$placeholder->server_id}" role="tab"
                    aria-controls="pills-{$placeholder->safe_name}-server-{$placeholder->server_id}"
                    aria-selected="{if $i == 0}true{else}false{/if}">
                    {$placeholder->leaderboard_title}
                </a>
                {/foreach}
            </div>
        </div>
        <div class="col-lg-9">
            <div class="tab-content" id="pills-tabContent">
                {foreach from=$LEADERBOARD_PLACEHOLDERS item=placeholder key=i name=lb}
                <div class="tab-pane fade{if $smarty.foreach.lb.first} show active{/if}"
                    id="pills-{$placeholder->safe_name}-server-{$placeholder->server_id}" role="tabpanel"
                    aria-labelledby="pills-{$placeholder->safe_name}-server-{$placeholder->server_id}-tab">
                    <div class="card">
                        <div class="card-header header-theme">{$placeholder->leaderboard_title}</div>
                        <div class="card-body" style="overflow-x: auto">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>{$PLAYER}</th>
                                        <th>{$SCORE}</th>
                                        <th>{$LAST_UPDATED}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$LEADERBOARD_PLACEHOLDERS_DATA item=data}
                                    {if $data->name eq $placeholder->name and $data->server_id eq
                                    $placeholder->server_id}
                                    <tr>
                                        <td>
                                            <img class="avatar-img" style="height: 30px; width: 30px;"
                                                src="{$data->avatar}" alt="{$data->username}">
                                            <span>{$data->username}</span>
                                        </td>
                                        <td>
                                            {$data->value}
                                        </td>
                                        <td>
                                            {$data->last_updated}
                                        </td>
                                    </tr>
                                    {/if}
                                    {/foreach}
                            </table>
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}