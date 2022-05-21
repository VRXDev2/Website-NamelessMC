{extends file="./layout.tpl"}

{block name=sHeading}

	<h2>{$PLACEHOLDERS}</h2>

{/block}

{block name=sContent}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	{if !empty($PLACEHOLDERS_LIST)}
		<div class="card">
			<div class="card-body">
				<table class="table table-responsive">
					<thead>
						<tr>
							<th>{$NAME}</th>
							<th>{$VALUE}</th>
							<th>{$LAST_UPDATED}</th>
							<th>{$SHOW_ON_PROFILE}</th>
							<th>{$SHOW_ON_FORUM}</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$PLACEHOLDERS_LIST item=data}
							<tr>
								<td>{$data.friendly_name}</td>
								<td>{$data.value}</td>
								<td>{$data.last_updated}</td>
								<td>
									{if $data.show_on_profile eq 1}
										<i class="fas fa-check-circle"></i>
									{else}
										<i class="fas fa-times-circle"></i>
									{/if}
								</td>
								<td>
									{if $data.show_on_forum eq 1}
										<i class="fas fa-check-circle"></i>
									{else}
										<i class="fas fa-times-circle"></i>
									{/if}
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
		</div>
	{else}
		<div class="card">
			<div class="card-body">
				{$NO_PLACEHOLDERS}
			</div>
		</div>
	{/if}

{/block}