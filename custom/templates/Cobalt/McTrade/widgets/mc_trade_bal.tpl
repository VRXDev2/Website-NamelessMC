<div class="card">
	<div class="card-header header-theme">
		{$WG_TITLE} <a class="float-right" href="{$MC_ACCOUNT_LINK}"><i class="fas fa-external-link-alt"></i></a>
	</div>
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
					<dl>
			</div>
			<a href="{$MAKE_BALANCE_LINK}" class="btn btn-theme btn-block" role="button">{$MAKE_BALANCE}</a>
		</div>
	{else}
		<div class="card-body">
			{$ACTIVATE_CONTENT}
			<a href="{$VALIDATE_URL}" class="btn btn-theme mt-4" role="button" aria-pressed="true">{$ACTIVATE_ACCOUNT}</a>
		</div>
	{/if}
</div>