{extends file="./layout.tpl"}

{block name=sHeading}

	<h2>{$OVERVIEW}</h2>

{/block}

{block name=sContent}

	<div class="card">
		<div class="card-body">
			<div class="account-overview">
				<div class="account-overview-icon">
					<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}">
				</div>
				<div class="account-overview-info">
					<div class="pairs pairs-50">
						{foreach from=$USER_DETAILS_VALUES item=value key=key}
							<dl>
								<dt>{$key}</dt>
								<dd>{$value}</dd>
							</dl>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>

	{if isset($FORUM_GRAPH)}
		<div class="card">
			<div class="card-body">
				<h3>{$FORUM_GRAPH}</h3>
				<div id="chartWrapper">
					<canvas id="dataChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
	{/if}
	
{/block}