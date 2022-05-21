{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-md-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-header header-theme">
                    {$RESOURCES}
                    <a href="{$MY_RESOURCES_LINK}" class="btn btn-theme float-right">{$MY_RESOURCES}</a>
                </div>
                <div class="card-body">
                    {if isset($SUCCESS)}
                    <div class="alert alert-success">
                        {$SUCCESS}
                    </div>
                    {/if} {if isset($ERROR)}
                    <div class="alert alert-danger">
                        {$ERROR}
                    </div>
                    {/if}
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="inputPaypalEmail">{$PAYPAL_EMAIL_ADDRESS}</label>&nbsp;<span class="badge badge-info" data-toggle="popover" data-title="{$INFO}" data-content="{$PAYPAL_EMAIL_ADDRESS_INFO}"><i class="fa-solid fa-circle-question"></i></span><br
                            />
                            <input type="text" class="form-control" id="inputPaypalEmail" name="paypal_email" placeholder="{$PAYPAL_EMAIL_ADDRESS}" value="{$PAYPAL_EMAIL_ADDRESS_VALUE}">
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                        </div>
                    </form>
                </div>
                <div class="card-header header-theme pt-0">{$PURCHASED_RESOURCES}</div>
                <div class="card-body">
                    {if count($PURCHASED_RESOURCES_VALUE)}
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <colgroup>
                                <col span="1" width="50%">
                                <col span="1" width="50%">
                            </colgroup>
                            <tbody>
                                {foreach from=$PURCHASED_RESOURCES_VALUE item=resource}
                                <tr>
                                    <td>
                                        <a href="{$resource.link}">{$resource.name}</a> <small>{$resource.latest_version}</small>
                                    </td>
                                    <td>
                                        <div class="float-right">
                                            <a href="{$resource.author_link}" style="{$resource.author_style}"><img src="{$resource.author_avatar}" class="rounded" style="max-height:20px;max-width:20px;" alt="{$resource.author_username}"/> {$resource.author_nickname}</a>
                                        </div>
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    {else}
                    <div class="alert alert-info">{$NO_PURCHASED_RESOURCES}</div>
                    {/if}
                </div>
                <div class="card-header header-theme pt-0">{$MANAGE_LICENSES}</div>
                <div class="card-body">
                    {if count($PREMIUM_RESOURCES)}
                        <p>{$SELECT_RESOURCE}</p>
                        <div class="table-responsive">
                        <table class="table table-striped">
                            <tbody>
                            {foreach from=$PREMIUM_RESOURCES item=resource}
                                <tr>
                                    <td style="width: 50%">
                                        <a class="white-link" href="{$resource.link}">{$resource.name}</a> <small>{$resource.latest_version}</small>
                                    </td>
                                    <td style="width: 50%">
                                        <span class="float-right">{$resource.license_count}</span>
                                    </td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                        </div>
                    {else}
                        <div class="alert alert-info">{$NO_PREMIUM_RESOURCES}</div>
                    {/if}


                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}