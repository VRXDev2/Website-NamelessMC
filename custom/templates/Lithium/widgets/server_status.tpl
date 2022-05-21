<div class="card card-secondary">
	<div class="card-header">
		{$SERVER_STATUS}
		{if ($SERVER.status_value == 1)}
			<span class="server-status-indicator" style="--indicator-color: var(--success);" data-bs-toggle="tooltip" title="{$ONLINE}"></span>
		{else}
			<span class="server-status-indicator" style="--indicator-color: var(--danger);" data-bs-toggle="tooltip" title="{$OFFLINE}"></span>
		{/if}
	</div>
	<div class="card-body">
		{if isset($SERVER)}
			{if ($SERVER.status_value == 1)}
				<div class="pairs">
					<dl>
						<dt>{$IP}</dt>
						<dd>{$SERVER.join_at}</dd>
					</dl>
					<dl>
						<dt>{$ONLINE}</dt>
						<dd>{$SERVER.player_count} / {$SERVER.player_count_max}</dd>
					</dl>
					{if isset($SERVER.format_player_list) && !empty($SERVER.format_player_list)}
						<dl class="my-2">
							<div class="list list-inline">
								{foreach from=$SERVER.format_player_list item=player}
									<div class="list-item">
										<div class="list-icon">
											<a href="{$player.profile}" data-bs-toggle="tooltip" title="{$player.username}">
												<img src="{$player.avatar}" alt="{$player.username}">
											</a>
										</div>
									</div>
								{/foreach}	
							</div>		
						</dl>
					{/if}
					{if (isset($VERSION) && !empty($VERSION|regex_replace:"/^[^:]*:/":""|strip_tags|trim))}
						<dl>
							<dt>{$VERSION|regex_replace:"/\:.*$/":""}</dt>
							<dd>{$VERSION|regex_replace:"/^[^:]*:/":""|strip_tags}</dd>
						</dl>
					{/if}
				</div>
			{else}
				{$OFFLINE}
			{/if}
		{else}
			{$NO_SERVERS}
		{/if}
	</div>
</div>