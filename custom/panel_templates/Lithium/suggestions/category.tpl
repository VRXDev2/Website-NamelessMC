{extends file="layout.tpl"}

{block name=heading}
	
	<h2>{$SUGGESTIONS}</h2>

{/block}

{block name=content}

	<div class="row justify-content-center">
		<div class="col-xl-9 col-lg-8">
			{if !empty($SUGGESTIONS_LIST)}
				<div class="action-bar">
					<div class="action-bar-pagination">
						{$PAGINATION}
					</div>
					<div class="action-bar-buttons">
						<div class="dropdown">
							<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$SORT_BY} {$SORT_BY_VALUE}</a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li>
									<a class="dropdown-header">{$SORT_BY}</a>
								</li>
								<li>
									<a href="{$SORT_NEWEST_LINK}" class="dropdown-item">{$NEWEST}</a>
								</li>
								<li>
									<a href="{$SORT_RECENT_ACTIVITY_LINK}" class="dropdown-item">{$RECENT_ACTIVITY}</a>
								</li>
								<li>
									<a href="{$SORT_LIKES_LINK}" class="dropdown-item">{$LIKES}</a>
								</li>
							</ul>
						</div>
						<a href="{$NEW_SUGGESTION_LINK}" class="btn btn-primary btn-sm" data-request-modal="new-suggestion">{$NEW_SUGGESTION}</a>
					</div>
				</div>
			{/if}
			{if !empty($SUGGESTIONS_LIST)}
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table">
								<colgroup>
									<col width="60%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<thead>
									<th>{$SUGGESTION_TITLE}</th>
									<th>{$STATS}</th>
									<th class="text-end">{$LAST_REPLY}</th>
								</thead>
								<tbody>
									{foreach from=$SUGGESTIONS_LIST item=suggestion}
										<tr>
											<td>
												{$suggestion.status}
												<strong>
													<a href="{$suggestion.link}">{$suggestion.title}</a>
												</strong>
												<div class="meta">
													<a style="{$suggestion.author_style}" href="{$suggestion.author_link}">{$suggestion.author_username}</a>
													&bull;
													<span title="{$suggestion.created}">{$suggestion.created_rough}</span>
												</div>
											</td>
											<td>
												<div class="pairs">
													<dl>
														<dt>{$LIKES}</dt>
														<dd>{$suggestion.likes}</dd>
													</dl>
													<dl>
														<dt>{$DISLIKES}</dt>
														<dd>{$suggestion.dislikes}</dd>
													</dl>
												</div>
											</td>
											<td class="text-end">
												<div class="user-item user-item-right">
													<div class="user-item-content">
														<a href="{$suggestion.updated_by_link}" style="{$suggestion.updated_by_style}">{$suggestion.updated_by_username}</a>
														<div class="user-item-meta">
															<span title="{$suggestion.updated}">{$suggestion.updated_rough}</span>
														</div>
													</div>
												</div>
											</td>
										</tr>
									{/foreach}
								</tbody>
							</table>
						</div>
					</div>
				</div>
			{else}
				<div class="card">
					<div class="card-body">
						{$NO_SUGGESTIONS}
					</div>
					<div class="card-footer">
						<a href="{$NEW_SUGGESTION_LINK}" class="btn btn-primary">{$NEW_SUGGESTION}</a>
					</div>
				</div>
			{/if}
			{if !empty($SUGGESTIONS_LIST)}
				<div class="action-bar">
					<div class="action-bar-pagination">
						{$PAGINATION}
					</div>
					<div class="action-bar-buttons">
						<div class="dropdown">
							<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$SORT_BY} {$SORT_BY_VALUE}</a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li>
									<a class="dropdown-header">{$SORT_BY}</a>
								</li>
								<li>
									<a href="{$SITE_HOME}suggestions/category/{$CATEGORY_ID}{($SITE_HOME|strstr:'?') ? '&' : '?'}sort=newest" class="dropdown-item">{$NEWEST}</a>
								</li>
								<li>
									<a href="{$SITE_HOME}suggestions/category/{$CATEGORY_ID}{($SITE_HOME|strstr:'?') ? '&' : '?'}sort=recent-activity" class="dropdown-item">{$RECENT_ACTIVITY}</a>
								</li>
								<li>
									<a href="{$SITE_HOME}suggestions/category/{$CATEGORY_ID}{($SITE_HOME|strstr:'?') ? '&' : '?'}sort=likes" class="dropdown-item">{$LIKES}</a>
								</li>
							</ul>
						</div>
						<a href="{$NEW_SUGGESTION_LINK}" class="btn btn-primary btn-sm" data-request-modal="new-suggestion">{$NEW_SUGGESTION}</a>
					</div>
				</div>
			{/if}
		</div>
		<div class="col-xl-3 col-lg-4">
			{include file="./_search.tpl"}
			{include file="./_categories.tpl"}
			{include file="./_recent_activity.tpl"}
		</div>
	</div>

{/block}