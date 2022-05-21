<div class="card card-secondary">
	<div class="card-header">
		{$UPDATED_RESOURCES_TITLE}
	</div>
	<div class="card-body">
		{if !empty($UPDATED_RESOURCES)}
			<div class="list">
				{foreach from=$UPDATED_RESOURCES item=resource}
					<div class="list-item">
						<div class="list-icon">
							<a href="{$resource.link}">
								<img src="{$resource.icon}" alt="{$resource.name}">
							</a>
						</div>
						<div class="list-content">
							<a href="{$resource.link}" title="{$post.topic_title}">{$resource.name}</a>
							<div class="list-meta">
								{if !empty($resource.short_description)}
									<span>{$resource.short_description}</span>
									<br />
								{/if}
								<a href="{$resource.creator_profile}" style="{$resource.creator_style}" data-poload="{$USER_INFO_URL}{$resource.creator_id}">{$resource.creator_username}</a>
								&bull;
								<span data-bs-toggle="tooltip" title="{$resource.released_full}">{$resource.released}</span>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			{$NO_UPDATED_RESOURCES}
		{/if}
	</div>
</div>