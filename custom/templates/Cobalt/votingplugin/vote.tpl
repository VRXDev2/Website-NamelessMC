{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($CONFIGURE)}
    <div class="alert alert-info">{$CONFIGURE}</div>
    {else if isset($ERROR)}
    <div class="alert alert-danger">{$ERROR}</div>
    {else}
    <div class="row">
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header header-theme">{$TOP_VOTERS}
                    <div class="float-right">
                        <div class="dropdown">
                            <button class="btn btn-theme dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$ORDER}</button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="{$TODAY_LINK}">{$TODAY}</a>
                                <a class="dropdown-item" href="{$THIS_WEEK_LINK}">{$THIS_WEEK}</a>
                                <a class="dropdown-item" href="{$THIS_MONTH_LINK}">{$THIS_MONTH}</a>
                                <a class="dropdown-item" href="{$ALL_TIME_LINK}">{$ALL_TIME}</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    {if count($RESULTS)}
                    <table class="table table-responsive dataTables-topList">
                        <colgroup>
                            <col span="1" style="width: 40%;">
                            <col span="1" style="width: 15%;">
                            <col span="1" style="width: 15%">
                            <col span="1" style="width: 15%">
                            <col span="1" style="width: 15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>{$USERNAME}</th>
                                <th>{$DAILY_VOTES}</th>
                                <th>{$WEEKLY_VOTES}</th>
                                <th>{$MONTHLY_VOTES}</th>
                                <th>{$ALL_TIME_VOTES}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$RESULTS item=result}
                            <tr>
                                <td>{if $result.exists eq true}<img src="{$result.avatar}" style="max-height:25px;max-width:25px;" class="avatar-img" alt="{$result.name}" /> <a href="{$result.profile}" style="{$result.user_style}">{$result.nickname}</a>{else}<img src="{$result.avatar}" style="max-height:25px;max-width:25px;" class="avatar-img" alt="{$result.name}" /> {$result.name}{/if}</td>
                                <td>{$result.daily}</td>
                                <td>{$result.weekly}</td>
                                <td>{$result.monthly}</td>
                                <td>{$result.alltime}</td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                    {/if}
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="card">
                <div class="card-header header-theme">{$VOTE_SITES}</div>
                <div class="card-body">
                    {foreach from=$VOTE_SITES_LIST item=site}
                        <a class="btn btn-block btn-theme mb-1 text-truncate" href="{$site.site}" target="_blank" rel="noopener nofollow" role="button">{$site.name}</a>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
    {/if}
</div>
{include file='footer.tpl'}