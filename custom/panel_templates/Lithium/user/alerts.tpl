{extends file="./layout.tpl"}

{block name=sHeading}

	<h2>{$ALERTS}</h2>

{/block}

{block name=sContent}

	{if !empty($ALERTS_LIST)}
		<div class="card">
			<div class="card-body">
				<div class="list list-relaxed">
					{foreach from=$ALERTS_LIST item=alert}
						<div class="list-item">
							<div class="list-icon">
								{if ($alert->read == 0)}
									<i class="fas fa-flag fa-fw"></i>
								{else}
									<i class="far fa-flag fa-fw"></i>
								{/if}
							</div>
							<div class="list-content">
								{if ($alert->read == 0)}
									<a href="{$alert->view_link}">
										<strong>{$alert->content}</strong>
									</a>
								{else}
									<a>{$alert->content}</a>
								{/if}
								<div class="list-meta">
									<span title="{$alert->date}">{$alert->date_nice}</span>
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
			<div class="card-footer justify-content-end">
				<a href="{$DELETE_ALL_LINK}" class="btn btn-danger btn-sm">{$DELETE_ALL}</a>
			</div>
		</div>
	{else}
		<div class="card">
			<div class="card-body">
				{$NO_ALERTS}
			</div>
		</div>
	{/if}

{/block}