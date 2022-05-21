
{extends file="layout.tpl"}


{block name=content}

	<div class="card card-gpost card-gpost-full">
		<div class="card-image">
			<div class="card-image-inner" style="--image: url('{$post_image}');"></div>
		</div>
		<div class="card-content">
			<div class="card-header">
				<div class="card-header-icon">
					<a href="{$post_author_profile}">
						<img src="{$post_avatar}" alt="{$post_author}">
					</a>
				</div>
				<div class="card-header-content">
					{$post_name}
					<div class="card-header-meta">
						<a href="{$post_author_profile}" style="{$post_author_styles}">{$post_author}</a>
						&bull;
						{$post_date}
						&bull;
						{$post_readtime} {$MINUTE_READ}
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="post">
					{$post_content}
				</div>
			</div>
		</div>
	</div>

	<div class="separator">
		<h2 class="mb-0">{$MORE_POSTS}</h2>
	</div>

	<div class="row">
		{foreach $GHOST_POSTS item=post name=ghost_posts}
			<div class="col-sm-6 col-md-4">
				<div class="card card-gpost">
					<div class="card-image">
						<a href="{$post.link}" class="card-image-inner" style="--image: url('{$post.image}');"></a>
					</div>
					<div class="card-content">
						<div class="card-header">
							<div class="card-header-content">
								<a href="{$post.link}">{$post.name}</a>
							</div>
						</div>
						<div class="card-body">
							<div class="post">
								{$post.content}
							</div>
						</div>
						<div class="card-footer">
							<div class="card-footer-icon">
								<a href="{$post.author_profile}">
									<img src="{$post.avatar}" alt="{$post.author}">
								</a>
							</div>
							<div class="card-footer-content">
								<a href="{$post.author_profile}" style="{$post.author_styles}">{$post.author}</a>
								<div class="card-footer-meta">
									{$post.date} &bull; {$post.readtime} {$MINUTE_READ}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	</div>

{/block}