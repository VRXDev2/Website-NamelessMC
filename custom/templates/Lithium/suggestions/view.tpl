{extends file="layout.tpl"}

{block name=heading}
	
	<div class="d-flex align-items-center flex-wrap mb-4">
		<h2>{$SUGGESTIONS}</h2>
		<a href="{$BACK_LINK}" class="btn btn-secondary ms-auto">{$BACK}</a>
	</div>

{/block}

{block name=content}

	<div class="row justify-content-center">
		<div class="col-xl-9 col-lg-8">
			{if isset($SESSION_SUCCESS_POST)}
				<div class="alert alert-danger">
					{$SESSION_SUCCESS_POST}
				</div>
			{/if}
			{if isset($ERRORS) && !empty($ERRORS)}
				<div class="alert alert-danger">
					{foreach from=$ERRORS item=error}
						<li>{$error}</li>
					{/foreach}
				</div>
			{/if}
			<div class="card card-post">
				<div class="card-body">
					<div class="forum-post">
						<div class="row">
							<div class="col-xxl-3 col-lg-4">
								<div class="forum-post-sidebar">
									<div class="forum-post-user-avatar">
										<img src="{$POSTER_AVATAR}" alt="{$POSTER_USERNAME}">
									</div>
									<div class="forum-post-user-info">
										<div class="forum-post-user-name">
											<a href="{$POSTER_PROFILE}" class="{$POSTER_TAG}" style="{$POSTER_STYLE}">{$POSTER_USERNAME}</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xxl-9 col-lg-8">
								<div class="forum-post-main">
									<div class="forum-post-attributes">
										<div class="forum-post-meta">
											{$BY|ucfirst} <a href="{$POSTER_PROFILE}" style="{$POSTER_STYLE}">{$POSTER_USERNAME}</a>
											&bull;
											<span title="{$POSTER_DATE}">{$POSTER_DATE_FRIENDLY}</span>
										</div>
										<ul class="forum-post-actions">
											<li>
												<form action="" method="post">
													<button type="submit" class="btn btn-link{if ($VOTED == 1)} text-success{/if}">Like</button>
													<input type="hidden" name="action" value="vote">
													<input type="hidden" name="vote" value="1">
													<input type="hidden" name="token" value="{$TOKEN}">
												</form>
												({$LIKES})
											</li>
											<li>
												<form action="" method="post">
													<button type="submit" class="btn btn-link{if ($VOTED == 2)} text-danger{/if}">Dislike</button>
													<input type="hidden" name="action" value="vote">
													<input type="hidden" name="vote" value="2">
													<input type="hidden" name="token" value="{$TOKEN}">
												</form>
												({$DISLIKES})
											</li>
											{if isset($CAN_MODERATE)}
												<li>
													<a href="{$EDIT_LINK}" data-request-modal="edit-suggestion">{$EDIT}</a>
												</li>
												<li>
													<form action="" method="post">
														<button type="submit" class="btn btn-link" onclick="return confirm('{$CONFIRM_DELETE_SUGGESTION}');">{$DELETE}</button>
														<input type="hidden" name="action" value="deleteSuggestion">
														<input type="hidden" name="token" value="{$TOKEN}">
													</form>
												</li>
											{/if}
										</ul>
									</div>
									<div class="forum-post-content">
										<h4>{$TITLE}</h4>
										<div class="post">
											{$CONTENT}
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			{if !empty($COMMENTS_LIST)}
				<div class="card">
					<div class="card-header">
						{$COMMENTS_TEXT}
					</div>
					<div class="card-body">
						{foreach from=$COMMENTS_LIST item=comment}
							<div class="message">
								<div class="message-icon">
									<a href="{$comment.profile}">
										<img src="{$comment.avatar}" alt="{$comment.username}">
									</a>
								</div>
								<div class="message-content">
									<div class="message-title">
										<a href="{$comment.profile}" class="{$comment_tag}" style="{$comment.style}">{$comment.username}</a>
									</div>
									<div class="message-post">
										{$comment.content}
									</div>
									<div class="message-meta">
										<span title="{$comment.date}">{$comment.date_friendly}</span>
										{if isset($CAN_MODERATE)}
											<div class="message-actions">
												<li>
													<form action="" method="post">
														<button type="submit" class="btn btn-link" onclick="return confirm('{$CONFIRM_DELETE_COMMENT}');">{$DELETE}</button>
														<input type="hidden" name="action" value="deleteComment">
														<input type="hidden" name="cid" value="{$comment.id}">
														<input type="hidden" name="token" value="{$TOKEN}">
													</form>
												</li>
											</div>
										{/if}
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
			{if isset($CAN_COMMENT)}
				<div class="card">
					<div class="card-body">
						<div class="message">
							<div class="message-icon">
								<a href="{$LOGGED_IN_USER.profile}">
									<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.nickname}">
								</a>
							</div>
							<div class="message-content">
								<div class="message-post">
									<form action="" method="post">
										<div class="form-group">
											<textarea class="form-control" name="content" rows="5" placeholder="{$NEW_COMMENT}"></textarea>
										</div>
										<div class="form-actions">
											{if isset($CAN_MODERATE)}
												<div class="me-auto">
													<select class="form-control" id="input-status" name="status">
														{foreach from=$STATUSES item=status}
															<option value="{$status.id}"{if ($STATUS == $status.id)} selected{/if}>{$status.name}</option>
														{/foreach}
													</select>
												</div>
											{/if}
											<input type="submit" class="btn btn-primary" value="{$SUBMIT}">
										</div>
										<input type="hidden" name="action" value="comment">
										<input type="hidden" name="token" value="{$TOKEN}">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			{/if}
		</div>
		<div class="col-xl-3 col-lg-4">
			{include file="./_search.tpl"}
			{include file="./_recent_activity.tpl"}
		</div>
	</div>

{/block}