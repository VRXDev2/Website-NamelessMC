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

	<h2>
		{if ($LOCKED)}
			<span class="float-end" title="{$LITHIUM_LOCALE.locked}">
				<i class="fas fa-lock"></i>
			</span>
		{/if}
		{if !empty($TOPIC_LABELS)}
			{foreach from=$TOPIC_LABELS item=label}
				{$label}
			{/foreach}
		{/if}
		{$TOPIC_TITLE}
		<div class="meta">
			{$started_by_val = "<a href=\"`$TOPIC_AUTHOR_PROFILE`\" style=\"`$TOPIC_AUTHOR_STYLE`\">`$TOPIC_AUTHOR_USERNAME`</a>"}
			{$STARTED_BY|replace:'{x}':$started_by_val}
		</div>
	</h2>

{/block}

{block name=content}

	{if isset($SESSION_SUCCESS_POST)}
		<div class="alert alert-success">
			{$SESSION_SUCCESS_POST}
		</div>
	{/if}

	{if isset($SESSION_FAILURE_POST)}
		<div class="alert alert-danger">
			{$SESSION_FAILURE_POST}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}
	
	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		<div class="action-bar-buttons">
			<div class="dropdown">
				<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$SHARE}</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li>
						<a class="dropdown-header">{$SHARE}</a>
					</li>
					<li>
						<a href="{$SHARE_TWITTER_URL}" target="_blank" class="dropdown-item">{$SHARE_TWITTER}</a>
					</li>
					<li>
						<a href="{$SHARE_FACEBOOK_URL}" target="_blank" class="dropdown-item">{$SHARE_FACEBOOK}</a>
					</li>
				</ul>
			</div>
			{if isset($CAN_MODERATE)}
				<div class="dropdown">
					<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$MOD_ACTIONS}</a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li>
							<a class="dropdown-header">{$MOD_ACTIONS}</a>
						</li>
						<li>
							<form action="{$LOCK_URL}" method="post" class="d-block">
								<a href="#button-formSubmit" class="dropdown-item">{$LOCK}</a>
								<input type="hidden" name="token" value="{$TOKEN}">
							</form>
						</li>
						<li>
							<form action="{$STICK_URL}" method="post" class="d-block">
								<a href="#button-formSubmit" class="dropdown-item">{$STICK}</a>
								<input type="hidden" name="token" value="{$TOKEN}">
							</form>
						</li>
						<li>
							<a href="{$MOVE_URL}" class="dropdown-item" data-request-modal="move">{$MOVE}</a>
						</li>
						<li>
							<a href="{$MERGE_URL}" class="dropdown-item" data-request-modal="merge">{$MERGE}</a>
						</li>
						<li>
							<a href="#modal-forumTopicDelete" class="dropdown-item" data-bs-toggle="modal">{$DELETE}</a>
						</li>
					</ul>
				</div>
			{/if}
			{if isset($UNFOLLOW)}
				<form action="{$UNFOLLOW_URL}" method="POST">
					<a href="#button-formSubmit" class="btn btn-secondary btn-sm">{$UNFOLLOW}</a>
					<input type="hidden" name="token" value="{$TOKEN}">
				</form>
			{else if isset($FOLLOW)}
				<form action="{$FOLLOW_URL}" method="POST">
					<a href="#button-formSubmit" class="btn btn-secondary btn-sm">{$FOLLOW}</a>
					<input type="hidden" name="token" value="{$TOKEN}">
				</form>
			{/if}
			{if isset($CAN_REPLY)}
				{if isset($LOCKED) && !isset($CAN_MODERATE)}
					<a href="#" class="btn btn-primary btn-sm disabled">{$NEW_REPLY}</a>
				{else}
					<a href="#post-reply" class="btn btn-primary btn-sm">{$NEW_REPLY}</a>
				{/if}
			{/if}
		</div>
	</div>

	{if isset($TOPIC_LOCKED_NOTICE)}
		<div class="alert alert-warning alert-sm">
			{$TOPIC_LOCKED_NOTICE}
		</div>
	{/if}

	{foreach from=$REPLIES item=reply}
		<div class="card card-post" id="post-{$reply.id}">
			<div class="card-body">
				<div class="forum-post">
					<div class="row">
						<div class="col-lg-3 col-xl-2">
							<div class="forum-post-sidebar">
								<div class="forum-post-user-avatar">
									<img src="{$reply.avatar}" alt="{$reply.username}">
								</div>
								<div class="forum-post-user-info">
									<div class="forum-post-user-name">
										<a href="{$reply.profile}" style="{$reply.user_style}" data-poload="{$USER_INFO_URL}{$reply.user_id}">{$reply.username}</a>
									</div>
									{if !empty($reply.user_title)}
										<div class="forum-post-user-title">
											{$reply.user_title}
										</div>
									{/if}
									{if !empty($reply.user_groups)}
										<div class="forum-post-user-badges">
											{foreach from=$reply.user_groups item=group}
												{$group}
											{/foreach}
										</div>
									{/if}
								</div>
								<div class="forum-post-user-stats">
									<div class="pairs">
										<dl>
											<dt>{$reply.user_registered|regex_replace:'/[:].*/':''}</dt>
											<dd>{$reply.user_registered_full}</dd>
										</dl>
										<dl>
											<dt>{$reply.last_seen|regex_replace:'/[:].*/':''}</dt>
											<dd>{$reply.last_seen_full}</dd>
										</dl>
										<dl>
											<dt>{$reply.user_topics_count|regex_replace:'/[0-9]+/':''|capitalize}</dt>
											<dd>{$reply.user_topics_count|regex_replace:'/[^0-9]+/':''}</dd>
										</dl>
										<dl>
											<dt>{$reply.user_posts_count|regex_replace:'/[0-9]+/':''|capitalize}</dt>
											<dd>{$reply.user_posts_count|regex_replace:'/[^0-9]+/':''}</dd>
										</dl>
										<hr />
										{if !empty($reply.fields)}
											{foreach from=$reply.fields item=field}
												<dl>
													<dt>{$field.name|capitalize}</dt>
													<dd>{$field.value}</dd>
												</dl>
											{/foreach}
										{/if}
									</div>
								</div>
								{if isset($USER_BADGES_LIST)}
									<div class="forum-post-user-profile-badges">
										{include file='badges/forum_badges.tpl'}
									</div>
								{/if}
							</div>
						</div>
						<div class="col-lg-9 col-xl-10">
							<div class="forum-post-main">
								<div class="forum-post-attributes">
									<div class="forum-post-meta">
										<span data-toggle="tooltip" title="{$reply.post_date}">{$reply.post_date_rough|ucfirst}</span>
										{if ($reply.edited !== null)}
											&bull;
											<span data-toggle="tooltip" title="{$reply.edited_full}">{$reply.edited}</span>
										{/if}
									</div>
									<ul class="forum-post-actions">
										{if isset($reply.buttons.edit)}
											<li>
												<a href="{$reply.buttons.edit.URL}">{$reply.buttons.edit.TEXT}</a>
											</li>
										{/if}
										{if isset($reply.buttons.delete)}
											<li>
												<a href="#modal-forumPostDelete-{$reply.id}" data-bs-toggle="modal">{$reply.buttons.delete.TEXT}</a>
											</li>
										{/if}
										{if isset($reply.buttons.report)}
											<li>
												<a href="#modal-forumPostReport-{$reply.id}" data-bs-toggle="modal">{$reply.buttons.report.TEXT}</a>
											</li>
										{/if}
										{if isset($reply.buttons.spam)}
											<li>
												<a href="#modal-forumPostSpam-{$reply.id}" data-bs-toggle="modal">{$reply.buttons.spam.TEXT}</a>
											</li>
										{/if}
										{if isset($reply.buttons.quote)}
											<li>
												<a href="#" onclick="quote({$reply.id})">{$reply.buttons.quote.TEXT}</a>
											</li>
										{/if}
									</ul>
								</div>
								<div class="forum-post-content">
									<div class="post">
										{$reply.content}
									</div>
								</div>
								{if !empty($reply.post_reactions) || (!empty($REACTIONS) && $reply.user_id !== $USER_ID)}
									<div class="forum-post-reactions">
										{if !empty($reply.post_reactions)}
											<a href="#modal-forumPostReactions-{$reply.id}" class="forum-post-reactions-list" data-bs-toggle="modal">
												<ul>
													{foreach from=$reply.post_reactions item=reaction}
														<li>
															{$reaction.html} x{$reaction.count}
														</li>
													{/foreach}
												</ul>
											</a>
										{/if}
										{if (!empty($REACTIONS) && $reply.user_id !== $USER_ID)}
											<ul class="forum-post-reactions-buttons">
												{foreach from=$REACTIONS item=reaction}
													<li>
														<form action="{$REACTIONS_URL}" method="post">
															<button type="submit" class="btn btn-link" data-bs-toggle="tooltip" title="{$reaction->name}">{$reaction->html}</button>
															<input type="hidden" name="token" value="{$TOKEN}">
															<input type="hidden" name="post" value="{$reply.id}">
															<input type="hidden" name="reaction" value="{$reaction->id}">
														</form>
													</li>
												{/foreach}
											</ul>
										{/if}
									</div>
								{/if}
								{if !empty($reply.signature)}
									<div class="forum-post-signature">
										<div class="post">
											{$reply.signature}
										</div>
									</div>
								{/if}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/foreach}

	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		<div class="action-bar-buttons">
			<div class="dropdown">
				<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$SHARE}</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li>
						<a class="dropdown-header">{$SHARE}</a>
					</li>
					<li>
						<a href="{$SHARE_TWITTER_URL}" target="_blank" class="dropdown-item">{$SHARE_TWITTER}</a>
					</li>
					<li>
						<a href="{$SHARE_FACEBOOK_URL}" target="_blank" class="dropdown-item">{$SHARE_FACEBOOK}</a>
					</li>
				</ul>
			</div>
			{if isset($CAN_MODERATE)}
				<div class="dropdown">
					<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$MOD_ACTIONS}</a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li>
							<a class="dropdown-header">{$MOD_ACTIONS}</a>
						</li>
						<li>
							<form action="{$LOCK_URL}" method="post" class="d-block">
								<a href="#button-formSubmit" class="dropdown-item">{$LOCK}</a>
								<input type="hidden" name="token" value="{$TOKEN}">
							</form>
						</li>
						<li>
							<form action="{$STICK_URL}" method="post" class="d-block">
								<a href="#button-formSubmit" class="dropdown-item">{$STICK}</a>
								<input type="hidden" name="token" value="{$TOKEN}">
							</form>
						</li>
						<li>
							<a href="{$MOVE_URL}" class="dropdown-item" data-request-modal="move">{$MOVE}</a>
						</li>
						<li>
							<a href="{$MERGE_URL}" class="dropdown-item" data-request-modal="merge">{$MERGE}</a>
						</li>
						<li>
							<a href="#modal-forumTopicDelete" class="dropdown-item" data-bs-toggle="modal">{$DELETE}</a>
						</li>
					</ul>
				</div>
			{/if}
			{if isset($UNFOLLOW)}
				<form action="{$UNFOLLOW_URL}" method="POST">
					<a href="#button-formSubmit" class="btn btn-secondary btn-sm">{$UNFOLLOW}</a>
					<input type="hidden" name="token" value="{$TOKEN}">
				</form>
			{else if isset($FOLLOW)}
				<form action="{$FOLLOW_URL}" method="POST">
					<a href="#button-formSubmit" class="btn btn-secondary btn-sm">{$FOLLOW}</a>
					<input type="hidden" name="token" value="{$TOKEN}">
				</form>
			{/if}
			{if isset($CAN_REPLY)}
				{if isset($LOCKED) && !isset($CAN_MODERATE)}
					<a href="#" class="btn btn-primary btn-sm disabled">{$NEW_REPLY}</a>
				{else}
					<a href="#post-reply" class="btn btn-primary btn-sm">{$NEW_REPLY}</a>
				{/if}
			{/if}
		</div>
	</div>

	{if isset($CAN_REPLY)}
		<div class="card card-post mt-4" id="post-reply">
			<div class="card-body">
				<div class="forum-post">
					<div class="row">
						<div class="col-lg-3 col-xl-2">
							<div class="forum-post-sidebar">
								<div class="forum-post-user-avatar">
									<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}">
								</div>
								<div class="forum-post-user-info">
									<div class="forum-post-user-name">
										<a href="{$LOGGED_IN_USER.profile}" style="{$reply.user_style}">{$LOGGED_IN_USER.username}</a>
									</div>
									{if !empty($LOGGED_IN_USER.user_title)}
										<div class="forum-post-user-title">
											{$LOGGED_IN_USER.user_title}
										</div>
									{/if}
								</div>
							</div>
						</div>
						<div class="col-lg-9 col-xl-10">
							<div class="forum-post-main">
								<form action="" method="post">
									{if !isset($MARKDOWN)}
										<div class="form-group">
											<textarea class="form-control" id="quickreply" name="content"></textarea>
										</div>
									{else}
										<div class="form-group">
											<textarea class="form-control" id="markdown" name="content"></textarea>
											<div class="form-meta">
												{$MARKDOWN_HELP}
											</div>
										</div>
									{/if}
									<div class="form-actions">
										<button type="button" class="btn btn-secondary" id="quoteButton" onclick="return insertQuotes()">{$INSERT_QUOTES}</button>
										<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
									</div>
									<input type="hidden" name="token" value="{$TOKEN}">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}

	{foreach from=$REPLIES item=reply}
		{if !empty($reply.post_reactions)}
			<div class="modal fade" id="modal-forumPostReactions-{$reply.id}">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-title">
								{$REACTIONS_TEXT}
							</div>
							<a href="#" class="close" data-bs-dismiss="modal">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<div class="modal-body">
							{foreach from=$reply.post_reactions item=reaction}
								<div class="card card-reactions">
									<div class="card-header">
										{$reaction.html} {$reaction.name} ({$reaction.count})
									</div>
									<div class="card-body">
										<div class="list list-reactions">
											{foreach from=$reaction.users item=user}
												<div class="list-item align-items-center">
													<div class="list-icon">
														<a href="{$user.profile}">
															<img src="{$user.avatar}" alt="{$user.nickname}">
														</a>
													</div>
													<div class="list-content">
														<a href="{$user.profile}" style="{$user.style}">{$user.nickname}</a>
													</div>
												</div>
											{/foreach}
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		{/if}
		<div class="modal fade" id="modal-forumPostReport-{$reply.id}">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$reply.buttons.report.TEXT}
						</div>
						<a href="#" class="close" data-bs-dismiss="modal">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<form action="{$reply.buttons.report.URL}" method="post">
						<div class="modal-body">
							<div class="form-group">
								<label class="form-label" for="input-reason-{$reply.id}">{$reply.buttons.report.REPORT_TEXT}</label>
								<textarea class="form-control" id="input-reason-{$reply.id}" name="reason"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
							<button type="submit" class="btn btn-primary btn-sm">{$reply.buttons.report.TEXT}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
						<input type="hidden" name="topic" value="{$TOPIC_ID}">
						<input type="hidden" name="post" value="{$reply.id}">
					</form>
				</div>
			</div>
		</div>
		{if isset($CAN_MODERATE)}
			<div class="modal fade" id="modal-forumPostSpam-{$reply.id}">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-title">
								{$MARK_AS_SPAM}
							</div>
							<a href="#" class="close" data-bs-dismiss="modal">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<div class="modal-body">
							<p>{$CONFIRM_SPAM_POST}</p>
						</div>
						<div class="modal-footer">
							<form action="{$reply.buttons.spam.URL}" method="post">
								<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
								<button type="submit" class="btn btn-primary btn-sm">{$MARK_AS_SPAM}</button>
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="hidden" name="post" value="{$reply.id}">
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="modal-forumPostDelete-{$reply.id}">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-title">
								{$CONFIRM_DELETE_SHORT}
							</div>
							<a href="#" class="close" data-bs-dismiss="modal">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<div class="modal-body">
							<p>{$CONFIRM_DELETE_POST}</p>
						</div>
						<div class="modal-footer">
							<form action="{$reply.buttons.delete.URL}" method="post">
								<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
								<button type="submit" class="btn btn-primary btn-sm">{$reply.buttons.delete.TEXT}</button>
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="hidden" name="tid" value="{$TOPIC_ID}">
								<input type="hidden" name="pid" value="{$reply.id}">
								<input type="hidden" name="number" value="{$reply.buttons.delete.NUMBER}">
							</form>
						</div>
					</div>
				</div>
			</div>
		{/if}
	{/foreach}

	{if isset($CAN_MODERATE)}
		<div class="modal fade" id="modal-forumTopicDelete">	
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$CONFIRM_DELETE_SHORT}
						</div>
						<a href="#" class="close" data-bs-dismiss="modal">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<div class="modal-body">
						<p>{$CONFIRM_DELETE}</p>
					</div>
					<div class="modal-footer">
						<form action="{$DELETE_URL}" method="post">
							<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
							<button type="submit" class="btn btn-primary btn-sm">{$DELETE}</button>
							<input type="hidden" name="token" value="{$TOKEN}">
						</form>
					</div>
				</div>
			</div>
		</div>
	{/if}

{/block}