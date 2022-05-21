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
									<div class="mb-1">
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

	<div class="card">
		<div class="card-body">
			{$NO_TOPICS_FULL}
		</div>
		{if ($NEW_TOPIC_BUTTON)}
			<div class="card-footer">
				<a href="{$NEW_TOPIC_BUTTON}" class="btn btn-primary">{$NEW_TOPIC}</a>
			</div>
		{/if}
	</div>

{/block}