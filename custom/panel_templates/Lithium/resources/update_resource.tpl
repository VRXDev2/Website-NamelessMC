{extends file="layout.tpl"}

{block name=heading}

	<h2>{$UPDATE_RESOURCE}</h2>

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
					<label class="form-label" for="input-title">{$UPDATE_TITLE}</label>
					<input type="text" class="form-control" id="input-title" name="title" value="{$TITLE_VALUE}">
				</div>
				<div class="form-group">
					<label class="form-label" for="input-version">{$VERSION_TAG}</label>
					<input type="text" class="form-control" id="input-version" name="version" value="{$VERSION_VALUE}">
				</div>
				<div class="form-group">
					<label class="form-label">{$RELEASE_TYPE}</label>
					<div class="mt-2">
						<div class="row align-items-center">
							<div class="col-lg-2">
								<div class="form-check">
									<input type="radio" class="form-check-input" id="input-local" name="type" value="local" checked="checked">
									<label class="form-check-label" for="input-local">{$ZIP_FILE}</label>
								</div>
							</div>
							<div class="col-lg-10">
								<div class="input-group">
									<input type="file" class="form-control" id="input-file" name="resourceFile" accept=".zip,application/zip">
									<button type="button" class="btn btn-secondary">{$CHOOSE_FILE} ({$ZIP_ONLY})</button>
								</div>
							</div>
						</div>
					</div>
					{if ($GITHUB_LINKED)}
						<div class="mt-2">
							<div class="row align-items-center">
								<div class="col-lg-2">
									<div class="form-check">
										<input type="radio" class="form-check-input" id="input-github" name="type" value="github">
										<label class="form-check-label" for="input-github">{$GITHUB_RELEASE}</label>
									</div>
								</div>
								<div class="col-lg-10">
									<select class="form-control" id="input-release" name="release">
										{foreach from=$RELEASES item=release}
											<option value="{$release.id}">{$release.tag} - {$release.name}</option>
										{/foreach}
									</select>
								</div>
							</div>
						</div>
					{/if}
					<div class="mt-2">
						<div class="row align-items-center">
							<div class="col-lg-2">
								<div class="form-check">
									<input type="radio" class="form-check-input" id="input-externalLink" name="type" value="external_link">
									<label class="form-check-label" for="input-externalLink">{$EXTERNAL_LINK}</label>
								</div>
							</div>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="input-link" name="link" placeholder="{$EXTERNAL_LINK}">
							</div>
						</div>
					</div>
				</div>
				{if !isset($MARKDOWN)}
					<div class="form-group">
						<label class="form-label" for="content">{$UPDATE_INFORMATION}</label>
						<textarea class="form-control" id="content" name="content">{$CONTENT_VALUE}</textarea>
					</div>
				{else}
					<div class="form-group">
						<label class="form-label" for="markdown">{$UPDATE_INFORMATION}</label>
						<textarea class="form-control" id="markdown" name="content">{$CONTENT_VALUE}</textarea>
						<div class="form-meta">
							{$MARKDOWN_HELP}
						</div>
					</div>
				{/if}
				<div class="form-actions">
					<a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
					<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>


{/block}