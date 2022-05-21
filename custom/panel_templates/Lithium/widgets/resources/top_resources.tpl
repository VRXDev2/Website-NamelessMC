<div class="card card-secondary">
	<div class="card-header">
		{$TOP_RESOURCES_TITLE}
	</div>
	<div class="card-body">
		{if !empty($TOP_RESOURCES)}
			<div class="list">
				{foreach from=$TOP_RESOURCES item=resource}
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
								<div class="star-rating view">
									<span class="far fa-star" data-rating="1"></span>
									<span class="far fa-star" data-rating="2"></span>
									<span class="far fa-star" data-rating="3"></span>
									<span class="far fa-star" data-rating="4"></span>
									<span class="far fa-star" data-rating="5"></span>
									<input type="hidden" name="rating" class="rating-value" value="{$resource.rating}">
								</div>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			{$NO_TOP_RESOURCES}
		{/if}
	</div>
</div>