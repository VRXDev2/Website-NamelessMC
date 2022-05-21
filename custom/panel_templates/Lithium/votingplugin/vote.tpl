{extends file="layout.tpl"}

{block name=heading}

	<div class="d-flex align-items-center flex-wrap mb-4">
		<h2>{$TOP_VOTERS}</h2>
		<div class="ms-auto">
			<div class="dropdown">
				<a href="#" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">{$ORDER}</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li>
						<a href="{$TODAY_LINK}" class="dropdown-item">{$TODAY}</a>
					</li>
					<li>
						<a href="{$THIS_WEEK_LINK}" class="dropdown-item">{$THIS_WEEK}</a>
					</li>
					<li>
						<a href="{$THIS_MONTH_LINK}" class="dropdown-item">{$THIS_MONTH}</a>
					</li>
					<li>
						<a href="{$ALL_TIME_LINK}" class="dropdown-item">{$ALL_TIME}</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

{/block}

{block name=content}

	{if isset($CONFIGURE)}
		<div class="alert alert-info">
			{$CONFIGURE}
		</div>
	{else if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{else}
		<div class="row">
			<div class="col-xl-9 col-lg-8">
				{if !empty($RESULTS)}
					<div class="card">
						<div class="card-body">
							<table class="table table-responsive dataTables-topList">
								<colgroup>
									<col style="width: 40%;">
									<col style="width: 15%;">
									<col style="width: 15%">
									<col style="width: 15%">
									<col style="width: 15%">
								</colgroup>
								<thead>
									<tr>
										<th>{$USERNAME}</th>
										<th class="text-center">{$DAILY_VOTES}</th>
										<th class="text-center">{$WEEKLY_VOTES}</th>
										<th class="text-center">{$MONTHLY_VOTES}</th>
										<th class="text-center">{$ALL_TIME_VOTES}</th>
									</tr>
								</thead>
								<tbody>
									{foreach from=$RESULTS item=result}
										<tr>
											<td>
												{if ($result.exists == true)}
													<div class="user-item">
														<div class="user-item-avatar">
															<img src="{$result.avatar}" alt="{$result.name}">
														</div>
														<div class="user-item-content">
															<a href="{$result.profile}" style="{$result.user_style}">{$result.nickname}</a>
														</div>
													</div>
												{else}
													<div class="user-item">
														<div class="user-item-avatar">
															<img src="{$result.avatar}" alt="{$result.name}">
														</div>
														<div class="user-item-content">
															{$result.name}
														</div>
													</div>
												{/if}
											</td>
											<td class="text-center">{$result.daily}</td>
											<td class="text-center">{$result.weekly}</td>
											<td class="text-center">{$result.monthly}</td>
											<td class="text-center">{$result.alltime}</td>
										</tr>
									{/foreach}
								</tbody>
							</table>
						</div>
					</div>
				{else}
					<div class="alert alert-warning">
						No votes.
					</div>
				{/if}
			</div>
			<div class="col-xl-3 col-lg-4">
				<div class="card card-secondary">
					<div class="card-header m-0">
						{$VOTE_SITES}
					</div>
					<div class="card-body">
						{foreach from=$VOTE_SITES_LIST item=site}
							<a href="{$site.site}" target="_blank" rel="noopener nofollow" class="btn btn-secondary btn-block mt-3">{$site.name}</a>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	{/if}

{/block}