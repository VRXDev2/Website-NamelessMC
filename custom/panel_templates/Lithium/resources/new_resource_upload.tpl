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
			<form action="" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<div class="input-group">
						<input type="file" class="form-control" id="input-file" name="resourceFile" accept=".zip,application/zip">
						<button type="button" class="btn btn-secondary">{$CHOOSE_FILE} ({$ZIP_ONLY})</button>
					</div>
				</div>
				<div class="form-group">
					<label class="form-label" for="input-version">{$VERSION_TAG}</label>
					<input type="text" class="form-control" id="input-version" name="version" value="1.0">
				</div>
				<div class="form-actions">
					<a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
					<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>

{/block}