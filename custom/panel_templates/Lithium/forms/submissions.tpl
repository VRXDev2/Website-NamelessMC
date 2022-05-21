{extends file="user/layout.tpl"}

{block name=sHeading}

	<h2>{$SUBMISSIONS}</h2>

{/block}

{block name=sContent}

	{if !empty($SUBMISSIONS_LIST)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
		</div>
	{/if}

	{if !empty($SUBMISSIONS_LIST)}
		<div class="card">
			<div class="card-body">
				<div class="list">
					{foreach from=$SUBMISSIONS_LIST item=submission}
						<div class="list-item align-items-center">
							<div class="list-content">
								{$submission.status}
								<a href="{$submission.link}">{$submission.form_name}</a>
								<div class="list-meta">
									<div class="d-sm-none">
										{$UPDATED_BY}: <a href="{$submission.updated_by_profile}" style="{$submission.updated_by_style}">{$submission.updated_by_name}</a>
										&bull;
										<span title="{$submission.reported_at_full}">{$submission.updated_at}</span>
									</div>
								</div>
							</div>
							<div class="list-extra text-end align-self-center d-none d-sm-block">
								<div class="user-item user-item-right">
									<div class="user-item-avatar">
										<a href="{$submission.updated_by_profile}">
											<img src="{$submission.updated_by_avatar}" alt="{$submission.updated_by_name}">
										</a>
									</div>
									<div class="user-item-content">
										<a href="{$submission.updated_by_profile}" style="{$submission.updated_by_style}">{$submission.updated_by_name}</a>
										<div class="user-item-meta">
											<span title="{$submission.reported_at_full}">{$submission.updated_at}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	{else}
		<div class="alert alert-danger">
			{$NO_SUBMISSIONS}
		</div>
	{/if}

	{if !empty($SUBMISSIONS_LIST)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
		</div>
	{/if}

{/block}