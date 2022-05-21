<div class="card card-secondary">
	<div class="card-header">
		{$ONLINE_USERS}
	</div>
	<div class="card-body">
		{if !empty($ONLINE_USERS_LIST)}
			<div class="list list-inline">
				{foreach from=$ONLINE_USERS_LIST item=user}
					<div class="list-item">
						<div class="list-icon">
							<a href="{$user.profile}">
								<img src="{$user.avatar}" alt="{$user.nickname}">
							</a>
						</div>
						<div class="list-content">
							<a href="{$user.profile}" style="{$user.style}" data-poload="{$USER_INFO_URL}{$user.id}">{$user.username}</a>
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			{$NO_USERS_ONLINE}
		{/if}
	</div>
</div>