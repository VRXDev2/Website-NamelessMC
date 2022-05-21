{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<ol class="breadcrumb">
		<li class="breadcrumb-item active">
			<a href="{$BREADCRUMB_URL}">{$BREADCRUMB_TEXT}</a>
		</li>
	</ol>

	<div class="d-flex align-items-center flex-wrap mb-4">
		<h2>{$TITLE}</h2>
		<div class="forum-search-bar">
			<form action="{$SEARCH_URL}" method="post">
				<div class="input-group">
					<input type="text" class="form-control" name="forum_search" placeholder="{$SEARCH}">
					<button type="submit" class="btn btn-primary btn-sq">
						<i class="fas fa-search"></i>
					</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>

{/block}

{block name=content}

	{if !empty($FORUMS)}
		{foreach from=$FORUMS item=forum key=key}
			{if !empty($forum.subforums)}
				<div class="card card-forum">
					<div class="card-header">
						{if ($LITHIUM_SETTINGS.collapsibleForums)}
							<a href="#collapse-forum-{$key}" class="float-end" data-bs-toggle="collapse">
								<span class="collapse-icon">
									<i class="fas fa-angle-up fa-fw"></i>
								</span>
							</a>
						{/if}
						{$forum.title}
					</div>
					<div class="collapse show" id="collapse-forum-{$key}">
						<div class="card-body">
							{foreach from=$forum.subforums item=subforum}
								<div class="forum-node">
									<div class="forum-node-icon">
										{if !empty($subforum->icon)}
											{$subforum->icon}
										{else}
											<i class="fas fa-comment"></i>
										{/if}
									</div>
									{if !isset($subforum->redirect_confirm)}
										<div class="forum-node-info">
											<div class="forum-node-title">
												<a href="{$subforum->link}">{$subforum->forum_title}</a>
											</div>
											<div class="forum-node-meta">
												{if !empty($subforum->forum_description)}
													<div class="d-none d-xl-block mb-2 mb-xxl-0">
														{$subforum->forum_description}
													</div>
												{/if}
												<div class="d-xxl-none mt-1">
													{$TOPICS|capitalize}: {$subforum->topics}
													&bull;
													{$POSTS|capitalize}: {$subforum->posts}
												</div>
												<div class="d-md-none">
													{$LITHIUM_LOCALE.latestPost}:
													{if isset($subforum->last_post)}
														<a href="{$subforum->last_post->link}">{$subforum->last_post->title}</a>
														&bull;
														<a href="{$subforum->last_post->profile}" style="{$subforum->last_post->user_style}">{$subforum->last_post->username}</a>
														&bull;
														<span title="{$subforum->last_post->post_date}">{$subforum->last_post->date_friendly}</span>
													{else}
														{$NO_TOPICS}
													{/if}
												</div>
												{if !empty($subforum->subforums)}
													<div class="mt-2">
														<div class="dropdown">
															<a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">{$SUBFORUMS}</a>
															<ul class="dropdown-menu">
																<li>
																	<span class="dropdown-header">{$SUBFORUMS}</span>
																</li>
																{foreach from=$subforum->subforums item=subSubforum}
																	<li>
																		<a href="{$subSubforum->link}" class="dropdown-item">{$subSubforum->title}</a>
																	</li>
																{/foreach}
															</ul>
														</div>
													</div>
												{/if}
											</div>
										</div>
										<div class="forum-node-stats">
											<div class="forum-node-stats-item">
												<div class="forum-node-stats-key">
													{$TOPICS|capitalize}
												</div>
												<div class="forum-node-stats-value">
													{$subforum->topics}
												</div>
											</div>
											<div class="forum-node-stats-item">
												<div class="forum-node-stats-key">
													{$POSTS|capitalize}
												</div>
												<div class="forum-node-stats-value">
													{$subforum->posts}
												</div>
											</div>
										</div>
										<div class="forum-node-latest">
											{if isset($subforum->last_post)}
												<div class="forum-node-latest-icon">
													<a href="{$subforum->last_post->profile}">
														<img src="{$subforum->last_post->avatar}" alt="{$subforum->last_post->profile}">
													</a>
												</div>
												<div class="forum-node-latest-info">
													<div class="forum-node-latest-title">
														<a href="{$subforum->last_post->link}">
															{$subforum->last_post->title}
														</a>
													</div>
													<div class="forum-node-latest-meta">
														<a href="{$subforum->last_post->profile}" style="{$subforum->last_post->user_style}" data-poload="{$USER_INFO_URL}{$subforum->last_post->post_creator}">{$subforum->last_post->username}</a>
														&bull;
														<span title="{$subforum->last_post->post_date}">{$subforum->last_post->date_friendly}</span>
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
									{else}
										<div class="forum-node-info">
											<div class="forum-node-title">
												<a href="#modal-forumRedirect-{$subforum->id}" data-bs-toggle="modal">{$subforum->forum_title}</a>
											</div>
											<div class="forum-node-meta">
												{if !empty($subforum->forum_description)}
													{$subforum->forum_description}
												{/if}
											</div>
										</div>
										<div class="modal fade" id="modal-forumRedirect-{$subforum->id}">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														{$LITHIUM_LOCALE.redirect}
													</div>
													<div class="modal-body">
														<p>{$subforum->redirect_confirm}</p>
													</div>
													<div class="modal-footer">
														<button class="btn btn-default btn-sm" data-bs-dismiss="modal">{$NO}</button>
														<a href="{$subforum->redirect_url}" class="btn btn-primary btn-sm">{$YES}</a>
													</div>
												</div>
											</div>
										</div>
									{/if}
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			{/if}
		{/foreach}
	{/if}

{/block}