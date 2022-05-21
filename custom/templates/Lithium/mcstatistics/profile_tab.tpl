{if !isset($MCSTATISTICS_ERROR)}
	{if !empty($MCSTATISTICS_FIELDS)}
		<div class="card">
			<div class="card-body">
				<div class="pairs pairs-50">
					{foreach from=$MCSTATISTICS_FIELDS item=field}
						<dl>
							<dt>{$field.title}</dt>
							<dd>{$field.value}</dd>
						</dl>
					{/foreach}
				</div>
			</div>
		</div>
	{/if}
	<div class="meta mt-3">
		Statistics provided by <a href="https://mcstatistics.org/" target="_blank">MCStatistics</a>
	</div>
{else}
	<div class="alert alert-warning">
		{$MCSTATISTICS_ERROR}
	</div>
{/if}