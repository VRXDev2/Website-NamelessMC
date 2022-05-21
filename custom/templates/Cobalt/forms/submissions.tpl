{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header header-theme">{$SUBMISSIONS}</div>
                <div class="card-body">
                    {nocache}
                    {if count($SUBMISSIONS_LIST)}
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>{$FORM}</th>
                                    <th>{$UPDATED_BY}</th>
                                    <th>{$STATUS}</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$SUBMISSIONS_LIST item=submission}
                                <tr>
                                    <td>{$submission.form_name}</td>
                                    <td>
                                        {if !empty($submission.updated_by_avatar)}
                                            <img src="{$submission.updated_by_avatar}" style="max-height:20px;max-width:20px;margin-top:-5px;" alt="{$submission.updated_by_name}" class="avatar-img">
                                            <a class="username" href="{$submission.updated_by_profile}" style="{$submission.updated_by_style}"> {$submission.updated_by_name}</a>
                                        {else}
                                            <i class="fa fa-user"></i> {$submission.updated_by_name}
                                        {/if}
                                        <br /><span data-toggle="tooltip" data-original-title="{$submission.reported_at_full}">{$submission.updated_at}</span>
                                    </td>
                                    <td>
                                        <h5>{$submission.status}</h5>
                                    </td>
                                    <td><a href="{$submission.link}" class="btn btn-theme float-right">{$VIEW} &raquo;</a></td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    {$PAGINATION} {else} {$NO_SUBMISSIONS} {/if}
                    {/nocache}
                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}