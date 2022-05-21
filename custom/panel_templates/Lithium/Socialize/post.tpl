{extends file="layout.tpl"}

{block name=heading}

	<script type="text/javascript" src="{$CONFIG_PATH}core/assets/plugins/prism/prism.js"></script>
	<script type="text/javascript" src="{$CONFIG_PATH}core/assets/plugins/tinymce/tinymce.min.js"></script>

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	{if $USERINFO.userposts.status == 'POST_PUBLISHED'}
		{if isset($SUCCESS)}
			<div class="alert alert-success">
				<strong>{$LANG.success_post_published_title}</strong>
				{$LANG.success_post_published_title}
			</div>
		{/if}
	{/if}

	<div class="row">
		<div class="col-xl-3 col-lg-4">
			<div class="card card-secondary">
				<div class="card-header">
					{$LANG.trending_title}
				</div>
				<div class="card-body">
					{if ($TRENDING == 'Empty')}
						{$LANG.top_rending_undefined}
					{else}
						<div class="list">
							{foreach from=$TRENDING item=item}
								<div class="list-item">
									<div class="list-content">
										<span>{$item.name}</span>
										<div class="list-meta">
											{$item.value}
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					{/if}
				</div>
			</div>
			<div class="card card-secondary">
				<div class="card-header">
					{$LANG.top_users_title}
				</div>
				<div class="card-body">
					{if (!empty($TOPUSERS))}
						<div class="pairs">
							{foreach from=$TOPUSERS item=item}
								<dl>
									<dt>{$item.type}</dt>
									<dd>
										{if ($item.authorUsername == 'None')}
											None
										{else}
											<a href="{$CONFIG_PATH}profile/{$item.authorUsername}" data-poload="{$CONFIG_PATH}queries/user/?id={$item.authorId}" style="{$item.authorStyle}">{$item.authorUsername}</a>
										{/if}
									</dd>
								</dl>
							{/foreach}
						</div>
					{else}
						-
					{/if}
				</div>
			</div>
			{if ($CHANNELS_ENABLED == 1)}
				<div class="card card-secondary">
					<div class="card-header">
						Channels
					</div>
					<div class="card-body">
						<div class="list">
							{foreach $CHANNELS as $item}
								<div class="list-item">
									<div class="list-content">
										<span class="float-end">({$item.posts_count})</span>
										<a href="/socialize/home?channel_id={$item.id}">#{$item.name}</a> 
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			{/if}
		</div>
		<div class="col-xl-9 col-lg-8">
			{if ($POSTS && !empty($POSTS))}
				{foreach from=$POSTS item=item}
					<div class="card card-news" id="post-{$item.id}">
						<div class="card-header">
							<div class="card-header-icon">
								<a href="{$CONFIG_PATH}profile/{$item.authorUsername}">
									<img src="{$item.authorAvatar}" alt="{$item.authorUsername}">
								</a>
							</div>
							<div class="card-header-content">
								{if ($CHANNELS_ENABLED == 1)}
									<div class="float-end">
										<span class="badge bg-primary" style="background: {$item.channel_color}; color: {$item.channel_text_color};">{$item.channel_name}</span>
									</div>
								{/if}
								<a href="{$CONFIG_PATH}profile/{$item.authorUsername}/" data-poload="{$CONFIG_PATH}queries/user/?id={$item.authorId}" style="{$item.authorStyle}">{$item.authorUsername}</a>
								<div class="card-header-meta">
									<span title="{$item.time}">{$item.timeAgo}</span>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="post">
								{$item.content}
								{foreach from=$item.images item=image}
									{if $image.ext != 'mp4'}
										<img class="rounded-3 mt-3" src="{$image.url_media}{$image.normal_name}{$image.ext}"><br>
									{else}
										<video class="rounded-3 mt-3" loop="true" autoplay="autoplay" controls muted>
											<source src="{$image.url_media}{$image.normal_name}{$image.ext}" type="video/mp4">
											{$LANG.video_no_support}
										</video>
									{/if}
								{/foreach}
							</div>
						</div>
						<div class="card-footer justify-content-start">
							{if ($USERINFO.loggeduser.loggedin == 'true' && $item.ownPost != true)}
								<form action="{$CONFIG_PATH}socialize/ajax" method="POST" data-formType="ajax">
									<button type="submit" class="btn {($item.isLiked == true) ? 'btn-primary' : 'btn-secondary'}" data-bs-toggle="tooltip" title="{($item.isLiked == true) ? 'Unlike' : 'Like'}">
										<i class="fas fa-heart fs-5"></i>
										<span class="ms-2">{$item.likesCount}</span>
									</button>
									<input type="hidden" name="token" value="{$USERINFO.loggeduser.token}">
									<input type="hidden" name="type" value="{($item.isLiked == true) ? 'unlike' : 'like'}">
									<input type="hidden" name="postid" value="{$item.id}">
									<input type="hidden" name="authorid" value="{$item.authorId}">
								</form>
							{else}
								<a href="#" class="btn btn-secondary disabled">
									<i class="fas fa-heart fs-5"></i>
									<span class="ms-2">{$item.likesCount}</span>
								</a>
							{/if}
							<a href="{$CONFIG_PATH}socialize/post?id={$item.id}" class="btn btn-secondary ms-3" data-bs-toggle="tooltip" title="Comments">
								<i class="fas fa-comment fs-5"></i>
								<span class="ms-2">{count($POSTCOMMENTS)}</span>
							</a>
							{if ($USERINFO.loggeduser.canDeletePost == 'true' || $item.ownPost == true)}
								<form action="{$CONFIG_PATH}socialize/ajax" method="POST" data-formType="ajax">
									<button type="submit" class="btn btn-secondary ms-3" data-bs-toggle="tooltip" title="Delete">
										<i class="fas fa-trash-alt fs-5"></i>
									</button>
									<input type="hidden" name="token" value="{$USERINFO.loggeduser.token}">
									<input type="hidden" name="type" value="deletePost">
									<input type="hidden" name="postid" value="{$item.id}">
									<input type="hidden" name="self" value="{($USERINFO.loggeduser.canDeletePost == 'true') ? '1' : '0'}">
								</form>
							{/if}
							<a href="#modal-postLikes" class="btn btn-secondary ms-auto" data-bs-toggle="modal">
								<i class="far fa-heart fs-6"></i>
								<span class="ms-2">Likes</span>
							</a>
						</div>
					</div>
				{/foreach}
			{/if}
			{if {$POSTS[0].settingsComments} == 2}
				<div class="alert alert-danger">
					<strong>{$LANG.comments_disabled_title}</strong>
					{$LANG.comments_disabled_desc}
				</div>
			{/if}
			{if $USERINFO.loggeduser.loggedin == 'true' && {$POSTS[0].settingsComments} != 2}
				<div class="card">
					<div class="card-body">
						<div class="message">
							<div class="message-icon">
								<img src="{$USERINFO.loggeduser.avatar}" alt="{$USERINFO.loggeduser.username}">
							</div>
							<div class="message-content">
								<div class="message-post">
									{if $USERINFO.loggeduser.haveCommentPerm == true}
										<form action="" method="post">
											<div class="form-group">
												<textarea class="form-control" id="input-postContent" name="content" placeholder="Type your comment here..."></textarea>
											</div>
											<div class="form-actions">
												<button type="submit" class="btn btn-primary">{$LANG.comment_button_submit}</button>
											</div>
											<input type="hidden" name="token" value="{$USERINFO.loggeduser.token}">
											<input type="hidden" name="action" value="newComment">
											<input type="hidden" name="comment" value="1">
										</form>
									{else}
										{$LANG.no_perm_comment}
									{/if}
								</div>
							</div>
						</div>
					</div>
				</div>
			{/if}
			{if !empty($POSTCOMMENTS)}
				<div class="card">
					<div class="card-body">
						{foreach from=$POSTCOMMENTS item=item}
							<div class="message" id="postComment-{$item.id}">
								<div class="message-icon">
									<a href="{$CONFIG_PATH}profile/{$item.authorUsername}">
										<img src="{$item.authorAvatar}" alt="{$item.authorUsername}">
									</a>
								</div>
								<div class="message-content">
									<div class="message-title">
										<a href="{$CONFIG_PATH}profile/{$item.authorUsername}" style="{$item.authorStyle}" data-poload="{$CONFIG_PATH}queries/user/?id={$item.authorId}">{$item.authorUsername}</a>
									</div>
									<div class="message-post">
										{$item.content}
									</div>
									<div class="message-meta">
										<span data-bs-toggle="tooltip" title="{$item.time}">{$item.timeAgo}</span>
										{if ($USERINFO.loggeduser.canDeleteComment == 'true' || $item.ownComment == 'true')}
											<div class="message-actions">
												<li>
													<form action="{$CONFIG_PATH}socialize/ajax" method="POST" data-formType="ajax">
														<button type="submit" class="btn btn-link">{$LANG.delete}</button>
														<input type="hidden" name="token" value="{$USERINFO.loggeduser.token}">
														<input type="hidden" name="type" value="deleteComment">
														<input type="hidden" name="commentid" value="{$item.id}">
														<input type="hidden" name="self" value="{($USERINFO.loggeduser.canDeleteComment == 'true') ? '1' : '0'}">
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
			{/if}
		</div>
	</div>

	<div class="modal fade" id="modal-postLikes">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						{$LANG.liked_by_post}
					</div>
					<a href="#" class="close" data-bs-dismiss="modal">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<div class="modal-body">
					{if $LIKEDLIST.error != 1}
						<div class="list">
							{foreach from=$LIKEDLIST item=item}
								<div class="list-item align-items-center">
									<div class="list-icon">
										<a href="{$CONFIG_PATH}profile/{$item.authorUsername}" data-poload="{$CONFIG_PATH}queries/user/?id={$item.authorId}">
											<img src="{$item.authorAvatar}" alt="{$item.authorUsername}">
										</a>
									</div>
									<div class="list-content">
										<a href="{$CONFIG_PATH}profile/{$item.authorUsername}" data-poload="{$CONFIG_PATH}queries/user/?id={$item.authorId}">{$item.authorUsername}</a>
									</div>
								</div>
							{/foreach}
						</div>
					{else}
						{$LIKEDLIST.message}
					{/if}
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$LANG.close_btn}</button>
				</div>
			</div>
		</div>
	</div>

{/block}

{block name=script}

	<script>
	
		tinymce.init({
			selector: '#input-postContent',
			object_resizing: false,
			max_height: 150,
			browser_spellcheck: true,
			mode: "textareas",
			contextmenu: false,
			branding: false,
			menubar: false,
			convert_urls: false,
			plugins: 'emoticons,image',
			toolbar: '| emoticons |',
			default_link_target: '_blank',
			skin: "{$TINY_EDITOR_STYLE}",
			forced_root_block: "",
		});

		for (const form of document.querySelectorAll('form[data-formType="ajax"]')) {
			form.addEventListener('submit', (event) =>{
				event.preventDefault();
				form.querySelector('button[type="submit"]').classList.add('disabled');
				fetch(form.getAttribute('action'), { method: 'POST', body: new FormData(form) })
					.then(() => {
						location.href = location.href;
					})
					.catch(() => {
						location.href = location.href;
					});
			});
		}

	</script>
	
{/block}