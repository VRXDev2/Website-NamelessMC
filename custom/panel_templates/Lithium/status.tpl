{extends file="layout.tpl"}

{block name=heading}

	<h2>{$STATUS}</h2>

{/block}

{block name=content}

	{if isset($CLICK_TO_COPY_TOOLTIP)}
		<div class="alert alert-info">
			<a href="#" onclick="return copy('#ip')" data-bs-toggle="tooltip" title="{$CLICK_TO_COPY_TOOLTIP}">{$CONNECT_WITH}</a>
		</div>
	{/if}

	{if !empty($SERVERS)}
		{foreach from=$SERVERS item=server}
			<div class="card card-server" id="serverQuery-{$server->id}" data-id="{$server->id}" data-bungee="{$server->bungee}" data-players="{$server->player_list}">
				<div class="card-header">
					<span class="server-status-indicator"></span>
					{$server->name|escape:'html'}
				</div>
				<div class="card-body">
					<div class="server-info">
						<div class="server-players-list" id="serverPlayersList-{$server->id}">
							{$LOADING}
						</div>
						<div class="server-players-count" id="serverPlayersCount-{$server->id}"></div>
					</div>
				</div>
			</div>
		{/foreach}
	{else}
		<div class="alert alert-warning">
			{$NO_SERVERS}
		</div>
	{/if}
	
{/block}