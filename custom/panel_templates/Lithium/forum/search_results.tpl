{extends file="layout.tpl"}

{block name=heading}

	<h2>{$SEARCH_RESULTS}</h2>

{/block}

{block name=content}

	{if !empty($RESULTS)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
			<div class="action-bar-buttons">
				<a href="{$NEW_SEARCH_URL}" class="btn btn-primary btn-sm">{$NEW_SEARCH}</a>
			</div>
		</div>
	{/if}

	{if !empty($RESULTS)}
		<div class="card">
			<div class="card-body">
				{foreach from=$RESULTS item=result}
					<div class="message">
						<div class="message-icon">
							<a href="{$result.post_author_profile}">
								<img src="{$result.post_author_avatar}" alt="{$result.post_author}">
							</a>
						</div>
						<div class="message-content">
							<div class="message-title">
								<a href="{$result.post_url}">{$result.topic_title}</a>
							</div>
							<div class="message-post">
								<div class="post">
									{$result.content|strip_tags:false}
								</div>
							</div>
							<div class="message-meta">
								<span>
									{$BY|capitalize} <a href="{$result.post_author_profile}" style="{$result.post_author_style}" data-poload="{$USER_INFO_URL}{$result.post_author_id}" data-html="true" data-placement="top">{$result.post_author}</a>
									&bull;
									<span title="{$result.post_date_full}">{$result.post_date_friendly}</span>
								</span>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	{else}
		<div class="card">
			<div class="card-body">
				{$NO_RESULTS}
			</div>
			<div class="card-footer">
				<a href="{$NEW_SEARCH_URL}" class="btn btn-primary">{$NEW_SEARCH}</a>
			</div>
		</div>
	{/if}

	{if !empty($RESULTS)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
			<div class="action-bar-buttons">
				<a href="{$NEW_SEARCH_URL}" class="btn btn-primary btn-sm">{$NEW_SEARCH}</a>
			</div>
		</div>
	{/if}

{/block}