{extends file="layout.tpl"}

{block name=heading}

	<script type="text/javascript" src="{$CONFIG_PATH}core/assets/plugins/prism/prism.js"></script>
	<script type="text/javascript" src="{$CONFIG_PATH}core/assets/plugins/tinymce/tinymce.min.js"></script>

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	{if ($USERINFO.userposts.status == 'POST_PUBLISHED')}
		{if isset($SUCCESS)}
			<div class="alert alert-success">
				<strong>{$LANG.success_post_published_title}</strong>
				<br />
				{$LANG.success_post_published_title}
			</div>
		{/if}
	{/if}

	{if isset($CHANNEL_ID_VIEW)}
		<div class="alert alert-success">
			<strong>{$LANG.channel_view_title}</strong>
			<br />
			{$LANG.channel_view_desc} <strong>{$CHANNEL_ID_VIEW}</strong>
			<br />
			<a href="{$CONFIG_PATH}socialize/home" class="btn btn-secondary btn-sm mt-2">Go Back</a>
		</div>
	{/if}

	<div class="alert alert-info" id="socializeUploadingIndicator" style="display: none;">
		<strong>Please wait!</strong>
		<br />
		We're creating and uploading media content for your post, if files are bigger size it may take some minutes.
	</div>

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
		{if ($USERINFO.loggeduser.loggedin == 'false')}
			<div class="col-xl-9 col-lg-8">
		{else}
			<div class="col-xl-6 col-lg-4">
		{/if}
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
								{$totalImages = 0}
								{foreach from=$item.images item=image}
									{if $totalImages >= 2}
										<a href="/socialize/post?id={$item.id}" class="btn btn-secondary btn-sm btn-block mt-3">
											<span>{$LANG.post_total_media_content|replace:'{x}':{count($item.images)}}</span>
										</a>
										{break}
									{/if}
									{if $image.ext != 'mp4'}
										<img class="rounded-3 mt-3" src="{$image.url_media}{$image.normal_name}{$image.ext}"><br>
									{else}
										<video class="rounded-3 mt-3" loop="true" autoplay="autoplay" controls muted>
											<source src="{$image.url_media}{$image.normal_name}{$image.ext}" type="video/mp4">
											{$LANG.video_no_support}
										</video>
									{/if}
									{$totalImages = $totalImages + 1}
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
								<span class="ms-2">{$item.commentsCount}</span>
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
						</div>
					</div>
				{/foreach}
				{if ($PAGE_LOAD_MORE == true)}
					<div class="separator">
						<a href="{$CONFIG_PATH}socialize/home?page={$PAGE}" class="btn btn-primary btn-lg mx-3">Next Page</a>
					</div>
				{/if}
			{else}
				<div class="alert alert-info">
					<strong>{$LANG.warning_no_posts_found_title}</strong>
					{$LANG.warning_no_posts_found_desc}
				</div>
			{/if}
		</div>
		{if ($USERINFO.loggeduser.loggedin != 'false')}
			<div class="col-xl-3 col-lg-4">
				<div class="card card-secondary">
					<div class="card-body">
						<div class="user-item user-item-big">
							<div class="user-item-avatar">
								<a href="{$CONFIG_PATH}profile/{$USERINFO.loggeduser.username}">
									<img src="{$USERINFO.loggeduser.avatar}" alt="{$USERINFO.loggeduser.username}">
								</a>
							</div>
							<div class="user-item-content">
								<a href="{$CONFIG_PATH}profile/{$USERINFO.loggeduser.username}" data-poload="{$CONFIG_PATH}queries/user/?id={$USERINFO.loggeduser.id}" style="{$USERINFO.loggeduser.style}">{$USERINFO.loggeduser.username}</a>
							</div>
						</div>
						{if ($USERINFO.loggeduser.havePostPerm == true)}
							<div class="mt-2">
								<a href="#modal-newPost" class="btn btn-success btn-lg btn-block" data-bs-toggle="modal">{$LANG.new_post_button}</a>
							</div>
						{/if}
					</div>
				</div>
				<div class="card card-secondary">
					<div class="card-header">
						{$LANG.stats_title}
					</div>
					<div class="card-body">
						<div class="pairs">
							<dl>
								<dt>{$LANG.stats_total_published_posts}</dt>
								<dd>{$USERINFO.loggeduser.totalPosts}</dd>
							</dl>
							<dl>
								<dt>{$LANG.stats_total_commented_posts}</dt>
								<dd>{$USERINFO.loggeduser.totalCommentedPosts}</dd>
							</dl>
							<dl>
								<dt>{$LANG.stats_total_liked_posts}</dt>
								<dd>{$USERINFO.loggeduser.totalLikes}</dd>
							</dl>
							<dl>
								<dt>{$LANG.stats_total_received_likes}</dt>
								<dd>{$USERINFO.loggeduser.totalReceivedLikes}</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		{/if}
	</div>

	{if ($USERINFO.loggeduser.loggedin != 'false')}
		<div class="modal fade" id="modal-newPost">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$LANG.creating_new_post_title}
						</div>
						<a href="#" class="close" data-bs-dismiss="modal">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<form action="" method="POST" enctype="multipart/form-data">
						<div class="modal-body">
							{if $POST_TYPE == 5 || $POST_TYPE == 1}
								<div class="form-group">
									<textarea class="form-control" id="input-postContent" name="content" placeholder="{$LANG.creating_new_post_placeholder}"></textarea>
								</div>
							{/if}
							{if ($POST_TYPE != 5)}
								<div class="form-group">
									<label for="input-mediaFiles" class="form-label">Media</label>
									<input type="file" class="form-control" id="input-mediaFiles" name="mediaFiles[]" multiple>
								</div>
							{/if}
							{if $CHANNELS_ENABLED == 1}
								<div class="form-group">
									<label class="form-label" for="input-channel">{$LANG.Channel}</label>
									<select class="form-control" id="input-channel" name="channel">
										{foreach from=$CHANNELS item='item'}
											<option value="{$item.id}">{$item.name}</option>
										{/foreach}
									</select>
								</div>
							{/if}
							<div class="form-group">
								<label class="form-label" for="input-visibility">{$LANG.sett_visibility_post}</label>
								<select class="form-control" id="input-visibility" name="optionVisibility">
									<option value="1">{$LANG.sett_opt_everyone}</option>
									<option value="2">{$LANG.sett_opt_loggedin}</option>
								</select>
							</div>
							<div class="form-group">
								<label class="form-label" for="input-comment">{$LANG.sett_comment_post}</label>
								<select class="form-control" id="input-comment" name="optionComment">
									<option value="1">{$LANG.sett_opt_loggedin}</option>
									<option value="2">{$LANG.sett_opt_disabled_comments}</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$LANG.cancel_btn}</button>
							<button type="submit" class="btn btn-primary btn-sm">{$LANG.post_btn}</button>
						</div>
						<input type="hidden" name="token" value="{$USERINFO.loggeduser.token}">
						<input type="hidden" name="action" value="newPost">
						<input type="hidden" name="post" value="1">
					</form>
				</div>
			</div>
		</div>
	{/if}

{/block}

{block name=script}

	<script>
	
		tinymce.init({
			selector: '#input-postContent',
			browser_spellcheck: true,
			mode: "textareas",
			contextmenu: false,
			branding: false,
			menubar: false,
			convert_urls: false,
			plugins: 'emoticons,image',
			toolbar: '| emoticons image | alignleft aligncenter alignright alignjustify |',
			default_link_target: '_blank',
			skin: "{$TINY_EDITOR_STYLE}",
			forced_root_block : ""
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