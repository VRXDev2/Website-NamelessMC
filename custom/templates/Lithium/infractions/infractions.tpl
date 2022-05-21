{extends file="layout.tpl"}

{block name=heading}

<h2>{$INFRACTIONS}</h2>

{/block}

{block name=content}

	{if !empty($INFRACTIONS_LIST)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
		</div>
	{/if}

	{if !empty($INFRACTIONS_LIST)}
		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>{$USERNAME}</th>
								<th>{$STAFF_MEMBER}</th>
								<th>{$ISSUED}</th>
								<th>{$ACTION}</th>
								<th class="text-end">{$REASON}</th>
							</tr>
						</thead>
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="20%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tbody>
							{foreach from=$INFRACTIONS_LIST item=infraction}
								<tr>
									<td>
										<div class="user-item">
											<div class="user-item-avatar">
												<a{if !empty($infraction.profile)} href="{$infraction.profile}"{/if}>
													<img src="{$infraction.avatar}" alt="{$infraction.username}">
												</a>
											</div>
											<div class="user-item-content">
												<a{if !empty($infraction.profile)} href="{$infraction.profile}"{/if} style="{$infraction.username_style}">{$infraction.username}</a>
											</div>
										</div>
									</td>
									<td>
										<div class="user-item">
											<div class="user-item-avatar">
												<a{if !empty($infraction.staff_member_link)} href="{$infraction.staff_member_link}"{/if}>
													<img src="{$infraction.staff_member_avatar}" alt="{$infraction.username}">
												</a>
											</div>
											<div class="user-item-content">
												<a{if !empty($infraction.staff_member_link)} href="{$infraction.staff_member_link}"{/if} style="{$infraction.staff_member_style}">{$infraction.staff_member}</a>
											</div>
										</div>
									</td>
									<td>
										<span title="{$infraction.issued_full}">{$infraction.issued}</span>
									</td>
									<td>
										{if ($infraction.action_id == 1 || $infraction.action_id == 2)}
											<span class="badge bg-danger">{$infraction.action}</span>
										{else if ($infraction.action_id == 3 || $infraction.action_id == 4)}
											<span class="badge bg-warning">{$infraction.action}</span>
										{else if ($infraction.action_id == 5)}
											<span class="badge bg-warning">{$infraction.action}</span>
										{else if ($infraction.action_id == 6)}
											<span class="badge bg-secondary">{$infraction.action}</span>
										{else}
											<span class="badge bg-secondary">{$infraction.action}</span>
										{/if}
										{if ($infraction.action_id == 1 || $infraction.action_id == 3)}
											{if ($infraction.revoked == 1)}
												<span class="badge bg-success" title="{$infraction.expires_full}">{$infraction.revoked_full}</span>
											{else}
												<span class="badge bg-danger" title="{$infraction.expires_full}">{$infraction.revoked_full}</span>
											{/if}
										{/if}
									</td>
									<td class="text-end">
										{$infraction.reason}
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	{else}
		<div class="alert alert-danger">
			{$NO_INFRACTIONS}
		</div>
	{/if}

	{if !empty($INFRACTIONS_LIST)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
		</div>
	{/if}

{/block}