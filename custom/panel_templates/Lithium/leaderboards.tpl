{extends file="layout.tpl"}

{block name=heading}

	<h2>{$LEADERBOARDS}</h2>

{/block}

{block name=content}

	<div class="row">
		<div class="col-xl-3 col-lg-4">
			<div class="card card-secondary">
				<div class="card-header">
					{$LEADERBOARDS}
				</div>
				<div class="card-body">
					<ul class="nav nav-vertical">
						{foreach from=$LEADERBOARD_PLACEHOLDERS item=placeholder name=placeholders}
							<li class="nav-item">
								<a href="#tab-{$placeholder->safe_name}-{$placeholder->server_id}" class="nav-link{if ($smarty.foreach.placeholders.first)} active{/if}" data-bs-toggle="tab">{$placeholder->leaderboard_title}</a>
							</li>
						{/foreach}
					</ul>    
				</div>
			</div>
		</div>
		<div class="col-xl-9 col-lg-8">
			<div class="tab-content">
				{foreach from=$LEADERBOARD_PLACEHOLDERS item=placeholder name=placeholders}
					<div class="tab-pane fade{if ($smarty.foreach.placeholders.first)} show active{/if}" id="tab-{$placeholder->safe_name}-{$placeholder->server_id}">
						<div class="card">
							<div class="card-body">
								<table class="table table-responsive">
									<thead>
										<tr>
											<th>{$PLAYER}</th>
											<th>{$SCORE}</th>
											<th>{$LAST_UPDATED}</th>
										</tr>
									</thead>
									<tbody>
										{foreach from=$LEADERBOARD_PLACEHOLDERS_DATA item=data}
											{if $data->name == $placeholder->name && $data->server_id == $placeholder->server_id}
												<tr>
													<td>
														<div class="user-item">
															<div class="user-item-avatar">
																<img src="{$data->avatar}" alt="{$data->username}">
															</div>
															<div class="user-item-content">
																{$data->username}
															</div>
														</div>
													</td>
													<td>{$data->value}</td>
													<td>{$data->last_updated}</td>
												</tr>
											{/if}
										{/foreach}
									</tbody>
								</table>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	</div>

{/block}