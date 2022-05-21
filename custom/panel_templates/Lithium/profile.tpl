{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<div class="profile-header">
		<div class="profile-header-banner" style="background: url('{$BANNER}') no-repeat center center / cover;">
		</div>
		<div class="profile-header-info">
			<div class="profile-header-user-avatar">
				<img src="{$AVATAR}" alt="{$USERNAME}">
			</div>
			<div class="profile-header-user-content">
				<div class="profile-header-user-name">
					<span{if ($USERNAME_COLOUR != false)} style="{$USERNAME_COLOUR}"{/if}>{$NICKNAME}</span>
				</div>
				{if !empty($USER_TITLE)}
					<div class="profile-header-user-title">
						{$USER_TITLE}
					</div>
				{/if}
				{if !empty($GROUPS)}
					<div class="profile-header-user-groups">
						{foreach from=$GROUPS item=group}
							{$group}
						{/foreach}
					</div>
				{/if}
			</div>
			{if isset($LOGGED_IN)}
				<ul class="profile-header-actions">
					{if isset($FRIENDS.button)}
						{if ($FRIENDS.button.action == 'add_friend')}
							{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-sm btn-success'}
						{else if ($FRIENDS.button.action == 'remove_friend')}
							{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-sm btn-danger'}
						{else if ($FRIENDS.button.action == 'accept_request')}
							{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-sm btn-success'}
						{else if ($FRIENDS.button.action == 'cancel_request')}
							{assign var='FRIENDS_BUTTON_CLASS' value='btn btn-sm btn-warning'}
						{/if}
						<li>
							<form action="" method="post">
								<button type="submit" class="{$FRIENDS_BUTTON_CLASS}">{$FRIENDS.button.text}</button>
								<input type="hidden" name="action" value="{$FRIENDS.button.action}">
								<input type="hidden" name="token" value="{$TOKEN}">
							</form>
						</li>
					{/if}
					{if !isset($SELF)}
						<li>
							<a href="{$MESSAGE_LINK}" class="btn btn-primary btn-sm">{$LITHIUM_LOCALE.message}</a>
						</li>	
					{else}
						<li>
							<a href="{$SETTINGS_LINK}" class="btn btn-primary btn-sm">{$LITHIUM_LOCALE.accountSettings}</a>
						</li>	
					{/if}
					{if (isset($SELF) || isset($RESET_PROFILE_BANNER) || $MOD_OR_ADMIN !== true)}
						<li class="profile-header-actions-more">
							<div class="dropdown">
								<a href="#" class="btn btn-secondary btn-sm btn-sq dropdown-toggle no-caret" data-bs-toggle="dropdown">
									<i class="fas fa-ellipsis-v"></i>
								</a>
								<ul class="dropdown-menu dropdown-menu-end">
									{if isset($SELF)}
										<li>
											<a href="#modal-profileBanner" class="dropdown-item" data-bs-toggle="modal">{$CHANGE_BANNER}</a>
										</li>
									{/if}
									{if isset($RESET_PROFILE_BANNER)}
										<li>
											<form action="{$RESET_PROFILE_BANNER_LINK}" method="POST" class="d-block">
												<a href="#button-formSubmit" class="dropdown-item">{$RESET_PROFILE_BANNER}</a>
												<input type="hidden" name="token" value="{$TOKEN}">
											</form>
										</li>
									{/if}
									{if !isset($SELF) && ($MOD_OR_ADMIN !== true)}
										<li>
											<a href="#modal-profileBlock" class="dropdown-item" data-bs-toggle="modal">{(isset($BLOCK_USER)) ? $BLOCK_USER : $UNBLOCK_USER}</a>
										</li>
									{/if}
								</ul>
							</div>
						</li>
					{/if}
				</ul>
			{/if}
		</div>
	</div>

{/block}

{block name=content}

	{if ($CAN_VIEW)}
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a href="#tab-feed" class="nav-link active" data-bs-toggle="tab">{$FEED}</a>
			</li>
			<li class="nav-item">
				<a href="#tab-about" class="nav-link" data-bs-toggle="tab">{$ABOUT}</a>
			</li>
			{foreach from=$TABS item=tab key=key}
				<li class="nav-item">
					<a href="#tab-{$key}" class="nav-link" data-bs-toggle="tab">{$tab.title}</a>
				</li>
			{/foreach}
		</ul>
	{/if}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	{if ($CAN_VIEW)}
		<div class="tab-content">
			<div class="tab-pane fade show active" id="tab-feed">
				{if isset($LOGGED_IN)}
					<div class="card">
						<div class="card-body">
							<div class="message" id="post-{$post.id}">
								<div class="message-icon">
									<a href="{$LOGGED_IN_USER.profile}">
										<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.nickname}">
									</a>
								</div>
								<div class="message-content">
									<div class="message-post">
										<form action="" method="post">
											<div class="form-group">
												<textarea class="form-control" name="post" placeholder="{$POST_ON_WALL}"></textarea>
											</div>
											<div class="form-actions">
												<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
											</div>
											<input type="hidden" name="token" value="{$TOKEN}">
											<input type="hidden" name="action" value="new_post">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				{/if}
				{if !empty($WALL_POSTS)}
					<div class="card">
						<div class="card-body">
							{foreach from=$WALL_POSTS item=post name=name}
								<div class="message" id="profilePost-{$post.id}">
									<div class="message-icon">
										<a href="{$post.profile}">
											<img src="{$post.avatar}" alt="{$post.nickname}">
										</a>
									</div>
									<div class="message-content">
										<div class="message-title">
											<a href="{$post.profile}" style="{$post.user_style}" data-poload="{$USER_INFO_URL}{$post.user_id}">{$post.nickname}</a>
										</div>
										<div class="message-post">
											{$post.content}
										</div>
										<div class="message-meta">
											<span title="{$post.date}">{$post.date_rough}</span>
											<div class="message-actions">
												<li>
													<a{if ($post.reactions_link !== '#')} href="{$post.reactions_link}"{/if}>{$LITHIUM_LOCALE.like}</a>
													{if !empty($post.reactions.reactions)}
														<span>
															(<a href="#" data-bs-toggle="tooltip" title="
																{foreach from=$post.reactions.reactions item=reaction name=name}
																	{$reaction.nickname}{if (!$smarty.foreach.name.last)}, {/if}
																{/foreach}
															">{$post.reactions.count|regex_replace:'/[^0-9]+/':''}</a>)
														</span>
													{else}
														<span>({$post.reactions.count|regex_replace:'/[^0-9]+/':''})</span>
													{/if}
												</li>
												<li>
													{if !isset($LOGGED_IN)}
														<a>{$REPLY}</a>
														<span>({$post.replies.count|regex_replace:'/[^0-9]+/':''})</span>
													{else}
														<a href="#collapse-profilePostReply-{$post.id}" data-bs-toggle="collapse">{$REPLY}</a>
														<span>({$post.replies.count|regex_replace:'/[^0-9]+/':''})</span>
													{/if}
												</li>
												{if ($CAN_MODERATE == 1 || $post.self == 1)}
													<li>
														<a href="#modal-profilePostEdit-{$post.id}" data-bs-toggle="modal">{$EDIT}</a>
													</li>
													<li>
														<form action="" method="post">
															<button type="submit" class="btn btn-link" onclick="return confirm(locale.confirmDelete)">{$DELETE}</button>
															<input type="hidden" name="token" value="{$TOKEN}">
															<input type="hidden" name="action" value="delete">
															<input type="hidden" name="post_id" value="{$post.id}">
														</form>
													</li>
												{/if}
											</div>
										</div>
										<div class="mesage-replies">
											<div class="collapse" id="collapse-profilePostReply-{$post.id}">
												<div class="message message-reply">
													<div class="message-icon">
														<a href="{$LOGGED_IN_USER.profile}">
															<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.nickname}">
														</a>
													</div>
													<div class="message-content">
														<div class="message-post">
															<form action="" method="post">
																<div class="form-group">
																	<div class="input-group">
																		<input type="text" class="form-control" name="reply" placeholder="{$NEW_REPLY}">
																		<button type="submit" class="btn btn-primary">
																			<i class="fas fa-share"></i>
																		</button>
																	</div>
																</div>
																<input type="hidden" name="token" value="{$TOKEN}">
																<input type="hidden" name="action" value="reply">
																<input type="hidden" name="post" value="{$post.id}">
															</form>
														</div>
													</div>
												</div>
											</div>
											{if !empty($post.replies.replies)}
												{foreach from=$post.replies.replies item=reply}
													<div class="message message-reply" id="profilePostReply-{$reply.id}">
														<div class="message-icon">
															<a href="{$reply.profile}">
																<img src="{$reply.avatar}" alt="{$reply.nickname}">
															</a>
														</div>
														<div class="message-content">
															<div class="message-title">
																<a href="{$reply.profile}" style="{$reply.style}" data-poload="{$USER_INFO_URL}{$reply.user_id}">{$reply.nickname}</a>:
															</div>
															<div class="message-post">
																{$reply.content}
															</div>
															<div class="message-meta">
																<span data-toggle="tooltip" title="{$reply.time_full}">{$reply.time_friendly}</span>
																{if ($CAN_MODERATE == 1 || $post.self == 1)}
																	<div class="message-actions">
																		<li>
																			<form action="" method="post">
																				<button type="submit" class="btn btn-link" onclick="return confirm(locale.confirmDelete)">{$DELETE}</button>
																				<input type="hidden" name="token" value="{$TOKEN}">
																				<input type="hidden" name="action" value="deleteReply">
																				<input type="hidden" name="post_id" value="{$reply.id}">
																			</form>
																		</li>
																	</div>
																{/if}
															</div>
														</div>
													</div>
												{/foreach}
											{/if}
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
					<div class="mt-4">
						{$PAGINATION}
					</div>
				{else}
					<div class="alert alert-danger mt-4">
						{$NO_WALL_POSTS}
					</div>
				{/if}
			</div>
			<div class="tab-pane fade" id="tab-about">
				<div class="card">
					<div class="card-body">
						<div class="pairs pairs-50">
							<dl>
								<dt>{$ABOUT_FIELDS.registered.title}</dt>
								<dd>
									<span title="{$ABOUT_FIELDS.registered.tooltip}">{$ABOUT_FIELDS.registered.value}</span>
								</dd>
							</dl>
							<dl>
								<dt>{$ABOUT_FIELDS.last_seen.title}</dt>
								<dd>
									<span title="{$ABOUT_FIELDS.last_seen.tooltip}">{$ABOUT_FIELDS.last_seen.value}</span>
								</dd>
							</dl>
							<dl>
								<dt>{$ABOUT_FIELDS.profile_views.title}</dt>
								<dd>{$ABOUT_FIELDS.profile_views.value}</dd>
							</dl>
							{if !empty($ABOUT_FIELDS)}
								{foreach from=$ABOUT_FIELDS item=field key=key}
									{if is_numeric($key)}
										<dl{if ($field.tooltip)} data-bs-toggle="tooltip" title="{$field.tooltip}"{/if}>
											<dt>{$field.title}</dt>
											<dd>{$field.value}</dd>
										</dl>
									{/if}
								{/foreach}
							{/if}
						</div>
					</div>
				</div>
			</div>
			{foreach from=$TABS item=tab key=key}
				<div class="tab-pane fade" id="tab-{$key}">
					{include file=$tab.include}
				</div>
			{/foreach}
		</div>
	{else}
		<div class="alert alert-danger">
			{$PRIVATE_PROFILE}
		</div>
	{/if}

	{if ($CAN_VIEW == 1)}
		{if !empty($WALL_POSTS)}
			{foreach from=$WALL_POSTS item=post name=name}
				{if ($CAN_MODERATE || $post.self)}
					<div class="modal fade" id="modal-profilePostEdit-{$post.id}">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title">
										{$EDIT_POST}
									</div>
									<a href="#" class="close" data-bs-dismiss="modal">
										<i class="fas fa-times"></i>
									</a>
								</div>
								<form action="" method="post">
									<div class="modal-body">
										<div class="message">
											<div class="message-icon">
												<a href="{$post.profile}">
													<img src="{$post.avatar}" alt="{$post.nickname}">
												</a>
											</div>
											<div class="message-content">
												<div class="message-post">
													<div class="form-group">
														<textarea name="content" class="form-control">{$post.content}</textarea>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
										<button type="submit" class="btn btn-primary btn-sm">{$SUBMIT}</button>
									</div>
									<input type="hidden" name="token" value="{$TOKEN}">
									<input type="hidden" name="action" value="edit">
									<input type="hidden" name="post_id" value="{$post.id}">
								</form>
							</div>
						</div>
					</div>
				{/if}
			{/foreach}
		{/if}
	{/if}

	{if isset($LOGGED_IN_USER) && !isset($SELF) && $MOD_OR_ADMIN != true}
		<div class="modal fade" id="modal-profileBlock">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{if isset($BLOCK_USER)}
								{$BLOCK_USER}
							{else}
								{$UNBLOCK_USER}
							{/if}
						</div>
						<a href="#" class="close" data-bs-dismiss="modal">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<form action="" method="post">
						<div class="modal-body">
							{if isset($CONFIRM_BLOCK_USER)}
								{$CONFIRM_BLOCK_USER}
							{else}
								{$CONFIRM_UNBLOCK_USER}
							{/if}
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
							<button type="submit" class="btn btn-primary btn-sm">{$SUBMIT}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
						<input type="hidden" name="action" value="block">
					</form>
				</div>
			</div>
		</div>
	{/if}

	{if isset($LOGGED_IN_USER) && isset($SELF)}
		<div class="modal fade" id="modal-profileBanner">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$CHANGE_BANNER}
						</div>
						<a href="#" class="close" data-bs-dismiss="modal">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<div class="modal-body">
						<form action="" method="post" id="form-profileBanner">
							<select name="banner" class="image-picker show-html" id="input-profileBanner">
								{foreach from=$BANNERS item=banner}
									<option data-img-src="{$banner.src}" value="{$banner.name}"{if ($banner.active == true)} selected{/if}>{$banner.name}</option>
								{/foreach}
							</select>
							<input type="hidden" name="token" value="{$TOKEN}">
							<input type="hidden" name="action" value="banner">
						</form>
						{if isset($PROFILE_BANNER)}
							<div class="separator">
								Or {$UPLOAD_PROFILE_BANNER}
							</div>
							<form action="{$UPLOAD_BANNER_URL}" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<div class="input-group">
										<input type="file" class="form-control" id="input-profileBannerUpload" name="file">
										<button type="submit" class="btn btn-success">{$UPLOAD}</button>
									</div>
								</div>
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="hidden" name="type" value="profile_banner">
							</form>
						{/if}
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
						<button class="btn btn-primary btn-sm" onclick="document.forms['form-profileBanner'].submit();">{$SUBMIT}</button>
					</div>
				</div>
			</div>
		</div>
	{/if}

{/block}

{block name=script}

	<script>
		const profileBannerInput = document.querySelector('#input-profileBanner');
		$(profileBannerInput).imagepicker();
	</script>
	
{/block}