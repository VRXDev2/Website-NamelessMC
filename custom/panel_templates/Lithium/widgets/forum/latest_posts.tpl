<div class="card card-secondary">
	<div class="card-header">
		{$LATEST_POSTS}
	</div>
	<div class="card-body">
		{if !empty($LATEST_POSTS_ARRAY)}
			<div class="list">
				{foreach from=$LATEST_POSTS_ARRAY item=post}
					<div class="list-item">
						<div class="list-icon">
							<a href="{$post.last_reply_profile_link}">
								<img src="{$post.last_reply_avatar}" alt="{$post.last_reply_username}">
							</a>
						</div>
						<div class="list-content">
							{$post.label} <a href="{$post.last_reply_link}" title="{$post.topic_title}">{$post.topic_title}</a>
							<div class="list-meta">
								<a href="{$post.last_reply_profile_link}" style="{$post.last_reply_style}" data-poload="{$USER_INFO_URL}{$post.last_reply_user_id}">{$post.last_reply_username}</a>
								&bull;
								<a href="{$post.forum_link}">{$post.forum_name}</a>
								&bull;
								<span title="{$post.last_reply}">{$post.last_reply_rough}</span>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		{else}
			~
		{/if}
	</div>
</div>