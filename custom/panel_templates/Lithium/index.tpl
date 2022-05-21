{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=content}

	{if isset($GHOST)}

		{include file='ghost/index.tpl'}

	{else}

		{if !empty($NEWS)}
			{foreach from=$NEWS item=item}
				<div class="card card-news">
					<div class="card-header">
						<div class="card-header-icon">
							<a href="{$item.author_url}">
								<img src="{$item.author_avatar}" alt="{$item.author_name}">
							</a>
						</div>
						<div class="card-header-content">
							{if !empty($item.labels)}
								<div class="float-end">
									{foreach from=$item.labels item=label}
										{$label}
									{/foreach}
								</div>
							{/if}
							<a href="{$item.url}">{$item.title}</a>
							<div class="card-header-meta">
								<a href="{$item.author_url}" style="{$item.author_style}" data-poload="{$USER_INFO_URL}{$item.author_id}">{$item.author_name}</a>
								&bull;
								<span title="{$item.date}">{$item.time_ago}</span>
							</div>
						</div>
					</div>
					<div class="card-body">
						{if ($LITHIUM_SETTINGS.enableNewsDateBlock)}
							<div class="news-date-block">
								<div class="news-date-day">{$item.date|date_format:"%d"}</div>
								<div class="news-date-month">{$item.date|date_format:"%b"}</div>
							</div>
						{/if}
						<div class="post">
							{$item.content}
						</div>
					</div>
					<div class="card-footer">
						<div class="d-inline-block me-auto meta">
							<i class="fas fa-eye fa-fw"></i> {$item.views}
							&nbsp;&bull;&nbsp;
							<i class="fas fa-comments fa-fw"></i> {$item.replies}
						</div>
						<a href="{$item.url}" class="btn btn-primary btn-sm">
							{$READ_FULL_POST}
						</a>
					</div>
				</div>
			{/foreach}
		{/if}

		{if ($LITHIUM_SETTINGS.enableMorePostsButton)}
			<div class="separator">
				<a href="{$LITHIUM_SETTINGS.morePostsUrl}" class="btn btn-primary btn-lg mx-3">{$LITHIUM_LOCALE.readMorePosts}</a>
			</div>
		{/if}

	{/if}
	
{/block}