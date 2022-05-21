<div class="card card-secondary">
	<div class="card-header">
		{$ONLINE_STAFF}
	</div>
	<div class="card-body">
		{if !empty($ONLINE_STAFF_LIST)}
			<div class="list">
				{foreach from=$ONLINE_STAFF_LIST item=user}
					<div class="list-item align-items-center">
						<div class="list-icon">
							<a href="{$user.profile}">
								<img src="{$user.avatar}" alt="{$user.nickname}">
							</a>
						</div>
						<div class="list-content">
							<a href="{$user.profile}" style="{$user.style}" data-poload="{$USER_INFO_URL}{$user.id}">{$user.username}</a>
							{if !empty($user.badge)}
								<div class="list-meta">
									{$user.badge}
								</div>
							{/if}
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			{$NO_STAFF_ONLINE}
		{/if}
	</div>
</div>