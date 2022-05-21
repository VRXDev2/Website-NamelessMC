{extends file="user/layout.tpl"}

{block name=sHeading}

	<h2>{$SUBMISSIONS}</h2>

{/block}

{block name=sContent}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="alert alert-info">
		<div>
			{$FORM_X}
		</div>
		<div>
			{$CURRENT_STATUS_X|strip_tags:false}
		</div>
		<div>
			{$LAST_UPDATED} <span data-toggle="tooltip" title="{$LAST_UPDATED_DATE}">{$LAST_UPDATED_FRIENDLY}</span>
		</div>
	</div>

	<div class="card card-post">
		<div class="card-body">
			<div class="forum-post">
				<div class="row">
					<div class="col-xxl-3 col-lg-4">
						<div class="forum-post-sidebar">
							<div class="forum-post-user-avatar">
								<img src="{$USER_AVATAR}" alt="{$USER}">
							</div>
							<div class="forum-post-user-info">
								<div class="forum-post-user-name">
									<a href="{$USER_PROFILE}" style="{$USER_STYLE}">{$USER}</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xxl-9 col-lg-8">
						<div class="forum-post-main">
							<div class="forum-post-attributes">
								<div class="forum-post-meta">
									{$BY|ucfirst} <a href="{$USER_PROFILE}" style="{$USER_STYLE}">{$USER}</a>
									&bull;
									<span title="{$CREATED_DATE}">{$CREATED_DATE_FRIENDLY}</span>
								</div>
							</div>
							<div class="forum-post-content">
								<div class="post">
									{foreach from=$ANSWERS item=answer}
										<p>
											<strong>{$answer.question}</strong>
											<br />
											{$answer.answer}
										</p>
									{/foreach}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	{if !empty($COMMENTS)}
		<div class="card">
			<div class="card-body">
				{foreach from=$COMMENTS item=comment}
					<div class="message">
						<div class="message-icon">
							<img src="{$comment.avatar}" alt="{$comment.username}">
						</div>
						<div class="message-content">
							<div class="message-title">
								<a href="{$comment.profile}" style="{$comment.style}">{$comment.username}</a>
							</div>
							<div class="message-post">
								<div class="post">
									{$comment.content}
								</div>
							</div>
							<div class="message-meta">
								<span data-toggle="tooltip" title="{$comment.date}">{$comment.date_friendly}</span>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	{else}
		<div class="alert alert-danger mt-4">
			{$NO_COMMENTS}
		</div>
	{/if}

	{if ($CAN_COMMENT)}
		<div class="card">
			<div class="card-body">
				<div class="message">
					<div class="message-icon">
						<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}">
					</div>
					<div class="message-content">
						<div class="message-post">
							<form action="" method="post">
								<div class="form-group">
									<textarea class="form-control" id="input-content" name="content" placeholder="{$NEW_COMMENT}"></textarea>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
								</div>
								<input type="hidden" name="token" value="{$TOKEN}">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}

{/block}