{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<h2>{$MEMBERS_TITLE}</h2>

{/block}

{block name=content}

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a href="{$ALL_LINK}" class="nav-link">{$DISPLAY_ALL}</a>
		</li>
		{foreach from=$GROUPS item=group}
			<li class="nav-item">
				<a href="{$group.link}" class="nav-link">{$group.name}</a>
			</li>
		{/foreach}
	</ul>

	<div class="card">
		<div class="card-body">
			<table class="table dataTables-users">
				<thead>
					<tr>
						<th>{$USERNAME}</th>
						<th>{$GROUP}</th>
						<th>{$CREATED}</th>
					</tr>
				</thead>
				{* <colgroup>
					<col width="40%">
					<col width="30%">
					<col width="30%">
				</colgroup> *}
				<tbody>
					{foreach from=$MEMBERS item=member}
						<tr>
							<td>
								<div class="user-item">
									<div class="user-item-avatar">
										<a href="{$member.profile}">
											<img src="{$member.avatar}" alt="{$member.nickname}">
										</a>
									</div>
									<div class="user-item-content">
										<a href="{$member.profile}" style="{$member.style}">{$member.nickname}</a>
									</div>
								</div>
							</td>
							<td>
								{foreach from=$member.groups item=group}
									{$group}
								{/foreach}
							</td>
							<td>{$member.joined}</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	</div>

{/block}