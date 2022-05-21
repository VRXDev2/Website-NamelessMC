{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$STATUS}</div>
        <div class="card-body">
            {if isset($CLICK_TO_COPY_TOOLTIP)}
                <span class="ip-text mb-3" onclick="copyToClipboard('#ip')" data-toggle="tooltip" title="{$CLICK_TO_COPY_TOOLTIP}">{$CONNECT_WITH}</span>
            {/if}
            {if count($SERVERS)}
                <div class="row">
                {foreach from=$SERVERS item=server name=serverArray}
                <div class="col-md-6">
                    <div class="d-flex server-card card" id="server{$server->id}" data-id="{$server->id}" data-bungee="{$server->bungee}" data-players="{$server->player_list}">
                        <div class="server-icon-box">
                            <i class="fas fa-server"></i>
                        </div>
                        <div class="flex-grow-1 ml-4 position-relative">
                            <div class="server-name">{$server->name|escape:'html'}</div>
                            <span class="server-status-box" id="server-status{$server->id}"></span>
                            <div class="server-content" id="content{$server->id}">
                                <i class="fa fa-spinner fa-pulse" id="spinner{$server->id}"></i> {$LOADING}
                            </div>
                            {if $server->show_ip}
                                <span id="ip{$server->id|escape}" class="ip-text" onclick="copyToClipboard('#ip{$server->id|escape}')" data-toggle="tooltip" title="{$CLICK_TO_COPY_TOOLTIP}">{$server->query_ip|escape:'html'}{if $server->port && $server->port != 25565}:{$server->port|escape:'html'}{/if}</span>
                            {/if}
                        </div>
                    </div>
                </div>
                {/foreach}
                </div>
            {else}
                <div class="alert alert-warning">{$NO_SERVERS}</div>
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}