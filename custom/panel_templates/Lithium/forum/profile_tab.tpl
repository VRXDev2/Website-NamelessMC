{if !empty($PF_LATEST_POSTS)}
	<div class="card">
		<div class="card-body">
			{foreach from=$PF_LATEST_POSTS item=post}
				<div class="message">
					<div class="message-icon">
						<a href="{$CONFIG_PATH}profile/{$USERNAME}">
							<img src="{$AVATAR}" alt="{$NICKNAME}">
						</a>
					</div>
					<div class="message-content">
						<div class="message-title">
							<a href="{$post.link}">{$post.title}</a>
						</div>
						<div class="message-post">
							<div class="post">
								{$post.content|strip_tags:false}
							</div>
						</div>
						<div class="message-meta">
							<span title="{$post.date_full}">{$post.date_friendly}</span>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
	</div>
{else}
	<div class="alert alert-danger">
		{$NO_POSTS}
	</div>
{/if}