{extends file="layout.tpl"}

{block name=heading}

	<h2>{$NEW_RESOURCE}</h2>

{/block}

{block name=content}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<label class="form-label" for="input-gitHubUsername">
						{$GITHUB_USERNAME}
						<span class="text-danger" title="{$REQUIRED}">*</span>
					</label>
					<input type="text" class="form-control" id="input-gitHubUsername" name="github_username">
				</div>
				<div class="form-group">
					<label class="form-label" for="input-gitHubRepo">
						{$GITHUB_REPO_NAME}
						<span class="text-danger" title="{$REQUIRED}">*</span>
					</label>
					<input type="text" class="form-control" id="input-gitHubRepo" name="github_repo">
				</div>
				<div class="form-actions">
					<a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}');">{$CANCEL}</a>
					<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>

{/block}