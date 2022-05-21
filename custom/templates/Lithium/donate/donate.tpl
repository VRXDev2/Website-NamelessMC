{extends file="layout.tpl"}

{block name=heading}

	<h2>{$DONATE}</h2>

{/block}

{block name=content}

	{if isset($SUCCESS)}
		<div class="alert alert-success">
			{$SUCCESS}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="row">
		<div class="col-xl-9 col-lg-8">
			<div class="card">
				<div class="card-body">
					{if isset($CONTENT)}
						<p>{$CONTENT}</p>
						<hr>
					{/if}
					<form action="{$PROCESS_URL}" method="post">
						<div class="form-group">
							<label class="form-label" for="input-amount">{$AMOUNT} ({$CURRENCY})</label>
							<input type="number" class="form-control" id="input-amount" name="amount" value="10" placeholder="10" min="{$MIN_AMOUNT}">
						</div>
						<div class="form-group">
							<label class="form-label" for="input-anonymous">{$DONATE_AS}</label>
							<select class="form-control" id="input-anonymous" name="anonymous">
								{if isset($LOGGED_IN_USER)}
									<option value="0">{$LOGGED_IN_USER.nickname}</option>
								{/if}
								<option value="1">{$ANONYMOUS}</option>
							</select>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">Donate</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
					</form>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-lg-4">
			<div class="card card-secondary">
				<div class="card-header">
					{$LATEST_DONATIONS}
				</div>
				<div class="card-body">
					{if !empty($LATEST_DONATIONS_LIST)}
						<div class="list">
							{foreach from=$LATEST_DONATIONS_LIST item=donation}
								<div class="list-item">
									<div class="list-icon">
										<a href="{$donation.profile_url}">
											<img src="{$donation.avatar_url}" alt="{$donation.username}">
										</a>
									</div>
									<div class="list-content">
										<a href="{$donator.profile_url}">{$donation.username}</a>
										<div class="list-meta">
											{$donation.amount} {$donation.currency}
											&bull;
											<span title="{$donation.date}">{$donation.date_rough}</span>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					{else}
						No donations.
					{/if}
				</div>
			</div>
		</div>
	</div>

{/block}