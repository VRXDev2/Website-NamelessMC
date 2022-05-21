<div class="card card-secondary">
	<div class="card-header">
		{$LATEST_PROFILE_POSTS}
	</div>
	<div class="card-body">
		{if !empty($PROFILE_POSTS_ARRAY)}
			<div class="list">
				{foreach from=$PROFILE_POSTS_ARRAY item=post}
					<div class="list-item">
						<div class="list-icon">
							<a href="{$post.user_profile_link}">
								<img src="{$post.avatar}" alt="{$post.username}">
							</a>
						</div>
						<div class="list-content">
							<a href="{$post.link}" class="text-truncate" title="{$post.content}">{$post.content}</a>
							<div class="list-meta">
								<a href="{$post.user_profile_link}" style="{$post.username_style}" data-poload="{$USER_INFO_URL}{$post.user_id}">{$post.username}</a>
								&bull;
								<span title="{$post.date_ago}">{$post.ago}</span>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			{$NO_PROFILE_POSTS}
		{/if}
	</div>
</div>