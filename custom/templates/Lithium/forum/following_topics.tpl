{extends file="user/layout.tpl"}

{block name=sHeading}

	<h2>{$FOLLOWING_TOPICS}</h2>

{/block}

{block name=sContent}

	{if isset($SUCCESS_MESSAGE)}
		<div class="alert alert-success">
			{$SUCCESS_MESSAGE}
		</div>
	{/if}

	{if !empty($TOPICS_LIST)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
			<div class="action-bar-buttons">
				<a href="#modal-topicsUnfollow" class="btn btn-primary btn-sm" data-bs-toggle="modal">{$UNFOLLOW_ALL}</a>
			</div>
		</div>
	{/if}

	{if !empty($TOPICS_LIST)}
		<div class="card">
			<div class="card-body">
				<div class="list list-relaxed list-divided">
					{foreach from=$TOPICS_LIST item=topic}
						<div class="list-item align-items-center">
							<div class="list-icon">
								<a href="{$topic.reply_author_link}">
									<img src="{$topic.reply_author_avatar}" alt="{$topic.reply_author_nickname}">
								</a>
							</div>
							<div class="list-content">
								<a href="{$topic.last_post_link}">
									{if ($topic.unread)}
										<i class="fas fa-bell fa-fw"></i>
										<strong>{$topic.topic_title}</strong>
									{else}
										{$topic.topic_title}
									{/if}
								</a>
								<div class="list-meta">
									<a href="{$topic.reply_author_link}" style="{$topic.reply_author_style}">{$topic.reply_author_nickname}</a>
									&bull;
									<span title="{$topic.reply_date_full}">{$topic.reply_date}</span>
								</div>
							</div>
							<div class="list-extra">
								<a href="{$topic.unfollow_link}" class="btn btn-danger btn-sm">{$UNFOLLOW_TOPIC}</a>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	{else}
		<div class="card">
			<div class="card-body">
				{$NO_TOPICS}
			</div>
		</div>
	{/if}

	{if !empty($TOPICS_LIST)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
			<div class="action-bar-buttons">
				<a href="#modal-topicsUnfollow" class="btn btn-primary btn-sm" data-bs-toggle="modal">{$UNFOLLOW_ALL}</a>
			</div>
		</div>
	{/if}

	<div class="modal fade" id="modal-topicsUnfollow">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						{$UNFOLLOW_ALL}
					</div>
					<a href="#" class="close">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<div class="modal-body">
					<p>{$CONFIRM_UNFOLLOW}</p>
				</div>
				<div class="modal-footer">
					<form action="" method="post">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$NO}</button>
						<button type="submit" class="btn btn-primary btn-sm">{$YES}</button>
						<input type="hidden" name="token" value="{$TOKEN}">
						<input type="hidden" name="action" value="purge">
					</form>
				</div>
			</div>
		</div>
	</div>

{/block}