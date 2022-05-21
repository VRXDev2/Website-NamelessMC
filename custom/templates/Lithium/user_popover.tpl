<div class="user-popover">

	<div class="user-popover-header">
		<a href="{$PROFILE}" class="user-popover-header-avatar">
			<img src="{$AVATAR}" alt="{$USERNAME}">
		</a>
		<div class="user-popover-header-content">
			<a href="{$PROFILE}" style="{$STYLE}">{$NICKNAME}</a>
			{if !empty($GROUPS)}
				<div class="user-popover-header-badges">
					{foreach from=$GROUPS item=group}
						{$group}
					{/foreach}
				</div>
			{else}
				<span class="badge bg-secondary">{$GUEST}</span>
			{/if}
		</div>
	</div>

	{if isset($REGISTERED)}
		<div class="user-popover-body">
			<div class="pairs">
				<dl>
					<dt>{$REGISTERED|regex_replace:'/[:].*/':''}:</dt>
					<dd>{$REGISTERED|regex_replace:'/^[^:]+:\s*/':''}</dd>
				</dl>
				{if isset($TOPICS) && isset($POSTS)}
					<dl>
						<dt>{$TOPICS|regex_replace:'/[0-9]+/':''|capitalize}:</dt>
						<dd>{$TOPICS|regex_replace:'/[^0-9]+/':''}</dd>
					</dl>
					<dl>
						<dt>{$POSTS|regex_replace:'/[0-9]+/':''|capitalize}:</dt>
						<dd>{$POSTS|regex_replace:'/[^0-9]+/':''}</dd>
					</dl>
				{/if}
			</div>
		</div>
	{/if}

</div>