<div class="card card-secondary">
	<a href="{$MC_ACCOUNT_LINK}" class="card-header">
		{$WG_TITLE}
	</a>
	{if $VALIDATE != 1}
		<div class="card-body">
			<div class="pairs">
				<dl>
					<dt>{$MC_ACCOUNT}</dt>
					<dd>{$MC_NAME}</dd>
				</dl>
				<dl>
					<dl>
						<dt>{$BALANCE}</dt>
						<dd>{$BAL_VALUE} {$CURRENCY}</dd>
					</dl>
				</dl>
			</div>
			<a href="{$MAKE_BALANCE_LINK}" class="btn btn-secondary btn-sm btn-block mt-3">{$MAKE_BALANCE}</a>
		</div>
	{else}
		<div class="card-body">
			{$ACTIVATE_CONTENT}
		</div>
		<a href="{$VALIDATE_URL}" class="btn btn-secondary btn-block mt-3">{$ACTIVATE_ACCOUNT}</a>
	{/if}
</div>