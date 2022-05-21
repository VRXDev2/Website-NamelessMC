<div class="card card-secondary">
	<div class="card-header">
		{$LATEST_PURCHASES}
	</div>
	<div class="card-body">
		{if !empty($PURCHASES)}
			<div class="list">
				{foreach from=$PURCHASES item=purchase name=name}
					<div class="list-item">
						<div class="list-icon">
							<img src="{$purchase.avatar}" alt="{$purchase.username}">
						</div>
						<div class="list-content">
							<a{if ($purchase.user_id)} href="{$purchase.profile}" style="{$purchase.style}"{/if}>{$purchase.username}</a>
							<div class="list-meta">
								{$purchase.currency_symbol}{$purchase.price}
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			No Purchases Yet
		{/if}
	</div>
</div>

