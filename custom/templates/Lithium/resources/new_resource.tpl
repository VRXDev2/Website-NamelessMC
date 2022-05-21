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
					<label class="form-label" for="input-name">{$RESOURCE_NAME}</label>
					<input type="text" class="form-control" id="input-name" name="name" required>
				</div>
				<div class="form-group">
					<label class="form-label" for="input-shortDescription">{$RESOURCE_SHORT_DESCRIPTION}</label>
					<input type="text" name="short_description" class="form-control" id="input-shortDescription" required>
				</div>
				{if !isset($MARKDOWN)}
					<div class="form-group">
						<label class="form-label" for="reply">{$RESOURCE_DESCRIPTION}</label>
						<textarea name="content" class="form-control" id="reply">{$CONTENT}</textarea>
					</div>
				{else}
					<div class="form-group">
						<label class="form-label" for="markdown">{$RESOURCE_DESCRIPTION}</label>
						<textarea class="form-control" id="markdown" name="content">{$CONTENT}</textarea>
						<div class="form-meta">
							{$MARKDOWN_HELP}
						</div>
					</div>
				{/if}
				<div class="form-group">
					<label class="form-label" for="input-category">{$SELECT_CATEGORY}</label>
					<select class="form-control" id="input-category" name="category" required>
						{foreach from=$CATEGORIES item=category}
							<option value="{$category.id}">{$category.name}</option>
						{/foreach}
					</select>
				</div>
				<div class="form-group">
					<label class="form-label" for="input-releaseType">{$RELEASE_TYPE}</label>
					<select class="form-control" id="input-releaseType" name="type" required>
						<option value="zip">{$ZIP_FILE}</option>
						<option value="github">{$GITHUB_RELEASE}</option>
						<option value="external">{$EXTERNAL_DOWNLOAD}</option>
					</select>
				</div>
				<div class="form-group">
					<label class="form-label" for="input-contributors">{$CONTRIBUTORS}</label>
					<input type="text" class="form-control" id="input-contributors" name="contributors">
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