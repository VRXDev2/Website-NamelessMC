{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	{if !empty($STAFF_GROUPS)}
		{foreach from=$STAFF_GROUPS item=group}
			{if !empty($group.members)}
				<div class="card card-staff">
					<div class="card-header" style="--color: {$group.color};">
						{$group.name}
					</div>
					<div class="card-body">
						<div class="list list-staff">
							{foreach from=$group.members item=member}
								<div class="list-item">
									<div class="list-icon">
										<a href="{$member.profile}">
											<img src="{$member.avatar}" alt="{$member.username}">
										</a>
									</div>
									<div class="list-content">
										<a href="{$member.profile}" style="{$member.style}">{$member.username}</a>
										{if !empty($member.title)}
											<div class="list-meta">
												{$member.title}
											</div>
										{/if}
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			{/if}
		{/foreach}
	{/if}

{/block}