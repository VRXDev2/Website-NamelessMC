{extends file="./layout.tpl"}

{block name=sHeading}

	<h2>{$NEW_MESSAGE}</h2>

{/block}

{block name=sContent}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<label class="form-label" for="input-title">{$MESSAGE_TITLE}</label>
					<input type="text" class="form-control" id="input-title" name="title" value="{$MESSAGE_TITLE_VALUE}">
				</div>
				<div class="form-group">
					<label class="form-label" for="input-to">{$TO}</label>
					<input type="text" class="form-control" id="input-to" name="to"{if isset($TO_USER)} value="{$TO_USER}"{/if}>
					<div class="form-meta">
						{$SEPARATE_USERS_WITH_COMMAS}
					</div>
				</div>
				{if !isset($MARKDOWN)}
					<div class="form-group">
						<textarea id="reply" name="content"></textarea>
					</div>
				{else}
					<div class="form-group">
						<textarea class="form-control" id="markdown" name="content"></textarea>
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

{block name=script}
	
	<script>
		const messageToInput = document.querySelector('#input-to');
		$(messageToInput).tokenfield({
			autocomplete: { source: [{$ALL_USERS}], delay: 100, minLength: 3 },
			showAutocompleteOnFocus: true
		});
	</script>

{/block}