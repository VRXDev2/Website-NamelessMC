{extends file="./layout.tpl"}

{block name=sHeading}

	<h2>
		{$MESSAGE_TITLE}
		<div class="meta">
			{$PARTICIPANTS_TEXT}: {$PARTICIPANTS}
		</span>
	</h2>

{/block}

{block name=sContent}

	{if isset($MESSAGE_SENT)}
		<div class="alert alert-success">
			{$MESSAGE_SENT}
		</div>
	{/if}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}
	
	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		<div class="action-bar-buttons">
			<a href="{$BACK_LINK}" class="btn btn-primary btn-sm">{$BACK}</a>
			<a href="#modal-conversationLeave" class="btn btn-primary btn-sm" data-bs-toggle="modal">{$LEAVE_CONVERSATION}</a>
		</div>
	</div>

	{foreach from=$MESSAGES item=message}
		<div class="card card-post">
			<div class="card-body">
				<div class="forum-post">
					<div class="row">
						<div class="col-xxl-3 col-lg-4">
							<div class="forum-post-sidebar">
								<div class="forum-post-user-avatar">
									<img src="{$message.author_avatar}" alt="{$message.author_username}">
								</div>
								<div class="forum-post-user-info">
									<div class="forum-post-user-name">
										<a href="{$message.author_profile}" style="{$message.author_style}" data-poload="{$USER_INFO_URL}{$message.author_id}">{$message.author_username}</a>
									</div>
									{if !empty($message.author_groups)}
										<div class="forum-post-user-badges">
											{foreach from=$message.author_groups item=group}
												{$group}
											{/foreach}
										</div>
									{/if}
								</div>
							</div>
						</div>
						<div class="col-xxl-9 col-lg-8">
							<div class="forum-post-main">
								<div class="forum-post-attributes">
									<div class="forum-post-meta">
										{$BY|ucfirst} <a href="{$message.author_profile}" style="{$message.author_style}" data-poload="{$USER_INFO_URL}{$message.author_id}">{$message.author_username}</a>
										&bull;
										<span title="{$message.message_date_full}">{$message.message_date}</span>
									</div>
								</div>
								<div class="forum-post-content">
									<div class="post">
										{$message.content}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/foreach}

	<div class="card card-post">
		<div class="card-body">
			<div class="forum-post">
				<div class="row">
					<div class="col-xxl-3 col-lg-4">
						<div class="forum-post-sidebar">
							<div class="forum-post-user-avatar">
								<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}">
							</div>
							<div class="forum-post-user-info">
								<div class="forum-post-user-name">
									<a href="{$LOGGED_IN_USER.profile}" style="{$LOGGED_IN_USER.style}">{$LOGGED_IN_USER.username}</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xxl-9 col-lg-8">
						<div class="forum-post-main">
							<form action="" method="post">
								{if !isset($MARKDOWN)}
									<div class="form-group">
										<textarea class="form-control" id="reply" name="content">{$CONTENT}</textarea>
									</div>
								{else}
									<div class="form-group">
										<textarea class="form-control" id="markdown" name="content">{$CONTENT}</textarea>
										<div class="form-meta">
											{$MARKDOWN_HELP}
										</div>
									</div>
								{/if}
								<div class="form-actions">
									<input type="submit" name="{$SUBMIT}" class="btn btn-primary">
								</div>
								<input type="hidden" name="token" value="{$TOKEN}">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		<div class="action-bar-buttons">
			<a href="{$BACK_LINK}" class="btn btn-primary btn-sm">{$BACK}</a>
			<a href="#modal-conversationLeave" class="btn btn-primary btn-sm" data-bs-toggle="modal">{$LEAVE_CONVERSATION}</a>
		</div>
	</div>

	<div class="modal fade" id="modal-conversationLeave">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						{$LEAVE_CONVERSATION}
					</div>
					<a href="#" class="close" data-bs-dismiss="modal">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<div class="modal-body">
					<p>{$CONFIRM_LEAVE}</p>
				</div>
				<div class="modal-footer">
					<form action="{$LEAVE_CONVERSATION_LINK}" method="post">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$NO}</button>
						<button type="submit" class="btn btn-primary btn-sm">{$YES}</button>
						<input type="hidden" name="token" value="{$TOKEN}">
					</form>
				</div>
			</div>
		</div>
	</div>
	
{/block}