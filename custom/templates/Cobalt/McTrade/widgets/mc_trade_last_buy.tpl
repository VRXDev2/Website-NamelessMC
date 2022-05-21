<div class="card">
	<div class="card-header header-theme">
		{$LAST_BUY_LABEL}
	</div>
	<div class="card-body">
		{foreach from=$MC_LOGS_LIST item=log}
			<div class="d-flex">
			    <div>
					<a href="{$log.profile}"><img src="{$log.avatar}" alt="{$log.username}" style="width: 30px; height: 30px"></a>
				</div>
				<div class="ml-3 flex-grow-1">
					<a class="white-link" href="{$log.profile}" style="{$log.style}" data-poload="/queries/user/?id={$log.id}">{$log.username}</a>
					<br />{$log.product_name}
				</div>

			</div>
		{/foreach}
	</div>
</div>