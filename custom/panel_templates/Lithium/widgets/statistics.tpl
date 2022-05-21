<div class="card card-secondary">
	<div class="card-header">
		{$STATISTICS}
	</div>
	<div class="card-body">
		<div class="pairs">
			{if isset($FORUM_STATISTICS)}
				<dl>
					<dt>{$TOTAL_THREADS}</dt>
					<dd>{$TOTAL_THREADS_VALUE}</dd>
				</dl>
				<dl>
					<dt>{$TOTAL_POSTS}</dt>
					<dd>{$TOTAL_POSTS_VALUE}</dd>
				</dl>
			{/if}
			<dl>
				<dt>{$USERS_REGISTERED}</dt>
				<dd>{$USERS_REGISTERED_VALUE}</dd>
			</dl>
			<dl>
				<dt>{$GUESTS_ONLINE}</dt>
				<dd>{$GUESTS_ONLINE_VALUE}</dd>
			</dl>
			<dl>
				<dt>{$LATEST_MEMBER}</dt>
				<dd>
					<a href="{$LATEST_MEMBER_VALUE.profile}" style="{$LAST_MEMBER_VALUE.style}" data-poload="{$USER_INFO_URL}{$LATEST_MEMBER_VALUE.id}">{$LATEST_MEMBER_VALUE.nickname}</a>
				</dd>
			</dl>
		</div>
	</div>
</div>