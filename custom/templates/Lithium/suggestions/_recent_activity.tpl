<div class="card card-secondary">
	<div class="card-header">
		{$RECENT_ACTIVITY}
	</div>
	<div class="card-body">
		{if !empty($RECENT_ACTIVITY_LIST)}
			<div class="list">
				{foreach from=$RECENT_ACTIVITY_LIST item=activity}
					<div class="list-item">
						<div class="list-icon">
							<a href="{$activity.updated_by_link}">
								<img src="{$activity.updated_by_avatar}" alt="{$activity.updated_by_username}">
							</a>
						</div>
						<div class="list-content">
							<a href="{$activity.link}">{$activity.title}</a>
							<div class="list-meta">
								<a href="{$activity.updated_by_link}" style="{$activity.updated_by_style}">{$activity.updated_by_username}</a>
								&bull;
								<span data-toggle="tooltip" title="{$activity.updated}">{$activity.updated_rough}</span>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			No activities.
		{/if}
	</div>
</div>