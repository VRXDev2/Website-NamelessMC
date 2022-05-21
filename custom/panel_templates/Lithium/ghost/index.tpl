<div class="row">
	{foreach $GHOST_POSTS item=post name=ghost_posts}
		<div class="{if ($smarty.foreach.ghost_posts.first)}col-md-12{else}col-md-6{/if}">
			<div class="card card-gpost{if ($smarty.foreach.ghost_posts.first)} card-gpost-big{/if}">
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

<br />

{$PAGINATION}