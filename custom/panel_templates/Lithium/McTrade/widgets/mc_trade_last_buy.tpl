<div class="card card-secondary">
	<div class="card-header">
		{$LAST_BUY_LABEL}
	</div>
	<div class="card-body">
		<div class="list">
			{if !empty($MC_LOGS_LIST) && $MC_LOGS_LIST[0].username != 'no logs'}
				{foreach from=$MC_LOGS_LIST item=log}
					<div class="list-item">
						<div class="list-icon">
							<a href="{$log.profile}">
								<img src="{$log.avatar}" alt="{$log.username}">
							</a>
						</div>
						<div class="list-content">
							<a href="{$log.profile}" style="{$log.style}">{$log.username}</a>
							<div class="list-meta">
								{$log.product_name}
							</div>
						</div>
					</div>
				{/foreach}
			{else}
				{$MC_LOGS_LIST[0].username|capitalize}
			{/if}
		</div>
	</div>
</div>