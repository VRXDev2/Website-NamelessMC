{extends file="layout.tpl"}

{block name=heading}

	<ol class="breadcrumb">
		{foreach from=$BREADCRUMBS item=breadcrumb}
			{if isset($breadcrumb.active)}
				<li class="breadcrumb-item active">
					{$breadcrumb.forum_title}
				</li>
			{else}
				<li class="breadcrumb-item">
					<a href="{$breadcrumb.link}">{$breadcrumb.forum_title}</a>
				</li>
			{/if}
		{/foreach}
	</ol>

	<h2>{$FORUM_TITLE}</h2>

{/block}

{block name=content}

	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		{if ($NEW_TOPIC_BUTTON)}
			<div class="action-bar-buttons">
				<a href="{$NEW_TOPIC_BUTTON}" class="btn btn-primary btn-sm">{$NEW_TOPIC}</a>
			</div>
		{/if}
	</div>

	{if !empty($SUBFORUMS)}
		<div class="card card-forum">
			<div class="card-header">
				{$SUBFORUM_LANGUAGE}
			</div>
			<div class="card-body">
				{foreach from=$SUBFORUMS item=subforum}
					<div class="forum-node" data-href="{$subforum->link}">
						<div class="forum-node-icon">
							{if !empty($subforum.icon)}
								{$subforum.icon}
							{else}
								<i class="fas fa-comment"></i>
							{/if}
						</div>
						<div class="forum-node-info">
							<div class="forum-node-title">
								<a href="{$subforum.link}">{$subforum.title}</a>
							</div>
							<div class="forum-node-meta">
								{if !empty($subforum.description)}
									<div class="mb-2">
										{$subforum.description}
									</div>
								{/if}
								<div class="d-xxl-none mt-1">
									{$TOPICS|capitalize}: {$subforum.topics}
								</div>
								<div class="d-md-none">
									{if !isset($subforum->redirect_confirm) && !empty($subforum.latest_post)}
										{$LITHIUM_LOCALE.latestPost}:
										<a href="{$subforum.latest_post.link}">{$subforum.latest_post.title}</a>
										&bull;
										<a href="{$subforum.latest_post.last_user_link}" style="{$subforum.latest_post.last_user_style}">{$subforum.latest_post.last_user}</a>
										&bull;
										<span title="{$subforum.latest_post.time}">{$subforum.latest_post.timeago}</span>
									{/if}
								</div>
							</div>
						</div>
						<div class="forum-node-stats">
							<div class="forum-node-stats-item">
								<div class="forum-node-stats-key">
									{$TOPICS|capitalize}
								</div>
								<div class="forum-node-stats-value">
									{$subforum.topics}
								</div>
							</div>
						</div>
						<div class="forum-node-latest">
							{if !isset($subforum->redirect_confirm) && !empty($subforum.latest_post)}
								<div class="forum-node-latest-icon">
									<a href="{$subforum.latest_post.last_user_link}">
										<img src="{$subforum.latest_post.last_user_avatar}" alt="{$subforum.latest_post.last_user}">
									</a>
								</div>
								<div class="forum-node-latest-info">
									<div class="forum-node-latest-title">
										<a href="{$subforum.latest_post.link}">{$subforum.latest_post.title}</a>
									</div>
									<div class="forum-node-latest-meta">
										<a href="{$subforum.latest_post.last_user_link}" style="{$subforum.latest_post.last_user_style}" data-poload="{$USER_INFO_URL}{$subforum.latest_post.last_user_id}">{$subforum.latest_post.last_user}</a>
										&bull;
										<span title="{$subforum.latest_post.time}">{$subforum.latest_post.timeago}</span>
									</div>
								</div>
							{else}
								<div class="forum-node-latest-info">
									<div class="forum-node-latest-meta">
										{$NO_TOPICS}
									</div>
								</div>
							{/if}
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	{/if}

	{if (($LITHIUM_SETTINGS.separateStickyTopics) && !empty($STICKY_DISCUSSIONS))}
		<div class="card card-threads pb-0">
			<div class="card-header">
				{$STICKY_TOPICS|capitalize}
			</div>
			<div class="card-body">
				{foreach from=$STICKY_DISCUSSIONS item=discussion}
					<div class="forum-thread">
						<div class="forum-thread-info">
							<div class="forum-thread-title">
								<span class="float-end">
									<span title="{$LITHIUM_LOCALE.sticky}">
										<i class="fas fa-thumbtack fa-fw"></i> 
									</span>
									{if ($discussion.locked == 1)}
										<span title="{$LITHIUM_LOCALE.locked}">
											<i class="fas fa-lock fa-fw"></i>
										</span>
									{/if}
								</span>
								{if !empty($discussion.labels)}
									{foreach from=$discussion.labels item=label}
										{$label}
									{/foreach}
								{/if}
								<a href="{$discussion.link}">{$discussion.topic_title}</a>
							</div>
							<div class="forum-thread-meta">
								<div>
									<a href="{$discussion.author_link}" style="{$discussion.topic_created_style}" data-poload="{$USER_INFO_URL}{$discussion.topic_created_user_id}">{$discussion.topic_created_username}</a>
									&bull;
									<span title="{$discussion.topic_created}">{$discussion.topic_created_rough}</span>
								</div>
								<div class="d-lg-none mt-2">
									{$VIEWS|capitalize}: {$discussion.views}
									&bull;
									{$POSTS|capitalize}: {$discussion.posts}
								</div>
								<div class="d-md-none">
									{$LAST_REPLY}:
									<a href="{$discussion.last_reply_link}">{$discussion.last_reply_username}</a>
									&bull;
									<span title="{$discussion.last_reply}">{$discussion.last_reply_rough}</span>
								</div>
							</div>
						</div>
						<div class="forum-thread-stats">
							<div class="forum-thread-stats-item">
								<div class="forum-thread-stats-key">
									{$VIEWS|capitalize}
								</div>
								<div class="forum-thread-stats-value">
									{$discussion.views}
								</div>
							</div>
							<div class="forum-thread-stats-item">
								<div class="forum-thread-stats-key">
									{$POSTS|capitalize}
								</div>
								<div class="forum-thread-stats-value">
									{$discussion.posts}
								</div>
							</div>
						</div>
						<div class="forum-thread-latest">
							<div class="forum-thread-latest-icon">
								<a href="{$discussion.last_reply_link}">
									<img src="{$discussion.last_reply_avatar}" alt="{$discussion.last_reply_username}">
								</a>
							</div>
							<div class="forum-thread-latest-info">
								<div class="forum-thread-latest-title">
									<a href="{$discussion.last_reply_link}" style="{$discussion.last_reply_style}" data-poload="{$USER_INFO_URL}{$discussion.last_reply_user_id}">{$discussion.last_reply_username}</a>
								</div>
								<div class="forum-thread-latest-meta">
									<span title="{$discussion.last_reply}">{$discussion.last_reply_rough}</span>
								</div>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	{/if}

	{if ((!($LITHIUM_SETTINGS.separateStickyTopics) && !empty($STICKY_DISCUSSIONS)) || !empty($LATEST_DISCUSSIONS))}
		<div class="card card-threads pb-0">
			<div class="card-header">
				{$TOPICS|capitalize}
			</div>
			<div class="card-body">
				{if (!($LITHIUM_SETTINGS.separateStickyTopics) && !empty($STICKY_DISCUSSIONS))}
					{foreach from=$STICKY_DISCUSSIONS item=discussion}
						<div class="forum-thread">
							<div class="forum-thread-info">
								<div class="forum-thread-title">
									<span class="float-end">
										<span title="{$LITHIUM_LOCALE.sticky}">
											<i class="fas fa-thumbtack fa-fw"></i> 
										</span>
										{if ($discussion.locked == 1)}
											<span title="{$LITHIUM_LOCALE.locked}">
												<i class="fas fa-lock fa-fw"></i>
											</span>
										{/if}
									</span>
									{if !empty($discussion.labels)}
										{foreach from=$discussion.labels item=label}
											{$label}
										{/foreach}
									{/if}
									<a href="{$discussion.link}">{$discussion.topic_title}</a>
								</div>
								<div class="forum-thread-meta">
									<div>
										<a href="{$discussion.author_link}" style="{$discussion.topic_created_style}" data-poload="{$USER_INFO_URL}{$discussion.topic_created_user_id}">{$discussion.topic_created_username}</a>
										&bull;
										<span title="{$discussion.topic_created}">{$discussion.topic_created_rough}</span>
									</div>
									<div class="d-lg-none mt-2">
										{$VIEWS|capitalize}: {$discussion.views}
										&bull;
										{$POSTS|capitalize}: {$discussion.posts}
									</div>
									<div class="d-md-none">
										{$LAST_REPLY}:
										<a href="{$discussion.last_reply_link}">{$discussion.last_reply_username}</a>
										&bull;
										<span title="{$discussion.last_reply}">{$discussion.last_reply_rough}</span>
									</div>
								</div>
							</div>
							<div class="forum-thread-stats">
								<div class="forum-thread-stats-item">
									<div class="forum-thread-stats-key">
										{$VIEWS|capitalize}
									</div>
									<div class="forum-thread-stats-value">
										{$discussion.views}
									</div>
								</div>
								<div class="forum-thread-stats-item">
									<div class="forum-thread-stats-key">
										{$POSTS|capitalize}
									</div>
									<div class="forum-thread-stats-value">
										{$discussion.posts}
									</div>
								</div>
							</div>
							<div class="forum-thread-latest">
								<div class="forum-thread-latest-icon">
									<a href="{$discussion.last_reply_link}">
										<img src="{$discussion.last_reply_avatar}" alt="{$discussion.last_reply_username}">
									</a>
								</div>
								<div class="forum-thread-latest-info">
									<div class="forum-thread-latest-title">
										<a href="{$discussion.last_reply_link}" style="{$discussion.last_reply_style}" data-poload="{$USER_INFO_URL}{$discussion.last_reply_user_id}">{$discussion.last_reply_username}</a>
									</div>
									<div class="forum-thread-latest-meta">
										<span title="{$discussion.last_reply}">{$discussion.last_reply_rough}</span>
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				{/if}
				{if !empty($LATEST_DISCUSSIONS)}
					{foreach from=$LATEST_DISCUSSIONS item=discussion}
						<div class="forum-thread">
							<div class="forum-thread-info">
								<div class="forum-thread-title">
									<span class="float-end">
										{if ($discussion.locked == 1)}
											<span title="{$LITHIUM_LOCALE.locked}">
												<i class="fas fa-lock fa-fw"></i>
											</span>
										{/if}
									</span>
									{if !empty($discussion.labels)}
										{foreach from=$discussion.labels item=label}
											{$label}
										{/foreach}
									{/if}
									<a href="{$discussion.link}">{$discussion.topic_title}</a>
								</div>
								<div class="forum-thread-meta">
									<div>
										<a href="{$discussion.author_link}" style="{$discussion.topic_created_style}" data-poload="{$USER_INFO_URL}{$discussion.topic_created_user_id}">{$discussion.topic_created_username}</a>
										&bull;
										<span title="{$discussion.topic_created}">{$discussion.topic_created_rough}</span>
									</div>
									<div class="d-lg-none mt-2">
										{$VIEWS|capitalize}: {$discussion.views}
										&bull;
										{$POSTS|capitalize}: {$discussion.posts}
									</div>
									<div class="d-md-none">
										{$LAST_REPLY}:
										<a href="{$discussion.last_reply_link}">{$discussion.last_reply_username}</a>
										&bull;
										<span title="{$discussion.last_reply}">{$discussion.last_reply_rough}</span>
									</div>
								</div>
							</div>
							<div class="forum-thread-stats">
								<div class="forum-thread-stats-item">
									<div class="forum-thread-stats-key">
										{$VIEWS|capitalize}
									</div>
									<div class="forum-thread-stats-value">
										{$discussion.views}
									</div>
								</div>
								<div class="forum-thread-stats-item">
									<div class="forum-thread-stats-key">
										{$POSTS|capitalize}
									</div>
									<div class="forum-thread-stats-value">
										{$discussion.posts}
									</div>
								</div>
							</div>
							<div class="forum-thread-latest">
								<div class="forum-thread-latest-icon">
									<a href="{$discussion.last_reply_link}">
										<img src="{$discussion.last_reply_avatar}" alt="{$discussion.last_reply_username}">
									</a>
								</div>
								<div class="forum-thread-latest-info">
									<div class="forum-thread-latest-title">
										<a href="{$discussion.last_reply_link}" style="{$discussion.last_reply_style}" data-poload="{$USER_INFO_URL}{$discussion.last_reply_user_id}">{$discussion.last_reply_username}</a>
									</div>
									<div class="forum-thread-latest-meta">
										<span title="{$discussion.last_reply}">{$discussion.last_reply_rough}</span>
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				{/if}
			</div>
		</div>
	{/if}

	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		{if ($NEW_TOPIC_BUTTON)}
			<div class="action-bar-buttons">
				<a href="{$NEW_TOPIC_BUTTON}" class="btn btn-primary btn-sm">{$NEW_TOPIC}</a>
			</div>
		{/if}
	</div>

{/block}