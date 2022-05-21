<div class="card card-secondary">
	<div class="card-header">
		Latest Subscribers
	</div>
	<div class="card-body">
		{if !empty($LATEST_SUBSCRIBERS_ARRAY)}
			<div class="list">
				{foreach from=$LATEST_SUBSCRIBERS_ARRAY item=subscriber}
					<div class="list-item">
						<div class="list-icon">
							<img src="{$subscriber.user_avatar}" alt="{$subscriber.user_username}">
						</div>
						<div class="list-content">
							<a href="{$subscriber.user_link}">{$subscriber.user_username}</a>
							<div class="list-meta">
								{$item.package_name} - ${$item.package_price} USD
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			No Subscribers Yet
		{/if}
	</div>
</div>

