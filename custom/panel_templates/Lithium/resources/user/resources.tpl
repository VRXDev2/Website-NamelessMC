{extends file="user/layout.tpl"}

{block name=sHeading}

	<div class="d-flex align-items-center mb-4">
		<h2>{$RESOURCES}</h2>
		<a href="{$MY_RESOURCES_LINK}" class="btn btn-secondary ms-auto">{$MY_RESOURCES}</a>
	</div>

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

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a href="#tab-purchasedResources" class="nav-link active" data-bs-toggle="tab">{$PURCHASED_RESOURCES}</a>
		</li>
		<li class="nav-item">
			<a href="#tab-licenses" class="nav-link" data-bs-toggle="tab">{$MANAGE_LICENSES}</a>
		</li>
		<li class="nav-item">
			<a href="#tab-settings" class="nav-link" data-bs-toggle="tab">{$SETTINGS}</a>
		</li>
	</ul>

	<div class="tab-content">
		<div class="tab-pane fade show active" id="tab-purchasedResources">
			<div class="card">
				<div class="card-header">
					{$PURCHASED_RESOURCES}
				</div>
				<div class="card-body">
					{if !empty($PURCHASED_RESOURCES_VALUE)}
						<div class="list">
							{foreach from=$PURCHASED_RESOURCES_VALUE item=resource}
								<div class="list-item">
									<div class="list-icon">
										<a href="{$resource.author_link}">
											<img src="{$resource.author_avatar}" alt="{$resource.author_username}">
										</a>
									</div>
									<div class="list-content">
										<strong>
												<a href="{$resource.link}">{$resource.name|truncate:30:'...'}</a>
										</strong>
										<small>[{$resource.latest_version}]</small>
										<div class="list-meta">
											<a href="{$resource.author_style}" style="{$resource.author_style}">{$resource.author_nickname}</a>
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					{else}
						{$NO_PURCHASED_RESOURCES}
					{/if}
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="tab-licenses">
			{if (!empty($PREMIUM_RESOURCES))}
				<div class="card">
					<div class="card-header">
						{$SELECT_RESOURCE}
					</div>
					<div class="card-body">
						<div class="list list-relaxed list-divided">
							{foreach from=$PREMIUM_RESOURCES item=resource}
								<div class="list-item">
									<div class="list-content">
										<a href="{$resource.link}">{$resource.name}</a> <small>[{$resource.latest_version}]</small>
										<div class="list-meta">
											{$resource.license_count}
										</div>
									</div>
								</div>
							{/foreach}
						</div>
					</div>
				</div>
			{else}
				<div class="card">
					<div class="card-header">
						{$MANAGE_LICENSES}
					</div>
					<div class="card-body">
						{$NO_PREMIUM_RESOURCES}
					</div>
				</div>
			{/if}
		</div>
		<div class="tab-pane fade" id="tab-settings">
			<div class="card">
				<div class="card-header">
					{$SETTINGS}
				</div>
				<div class="card-body">
					<form action="" method="post">
						<div class="form-group">
							<label for="input-paypalEmail" class="form-label">{$PAYPAL_EMAIL_ADDRESS}</label>
							<input type="text" class="form-control" id="input-paypalEmail" name="paypal_email" value="{$PAYPAL_EMAIL_ADDRESS_VALUE}">
							<div class="form-meta">
								{$PAYPAL_EMAIL_ADDRESS_INFO}
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
					</form>
				</div>
			</div>
		</div>
	</div>

{/block}