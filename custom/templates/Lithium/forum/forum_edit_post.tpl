{extends file="layout.tpl"}

{block name=heading}

	<h2>{$EDITING_POST}</h2>

{/block}

{block name=content}

	{if isset($ERRORS) && !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				{if isset($EDITING_TOPIC)}
					<div class="form-group">
						<label class="form-label" for="input-title">{$LITHIUM_LOCALE.topicTitle}</label>
						<input type="text" class="form-control" id="input-title" name="title" value="{$TOPIC_TITLE}" maxlength="64">
					</div>
					{if !empty($LABELS)}
						<div class="form-group">
							<div class="form-check form-check-inline">
								{foreach from=$LABELS item=label}
									<input type="checkbox" class="form-check-input" id="input-label-{$label.id}" name="topic_label[]" value="{$label.id}"{if ($label.checked)} checked{/if}>
									<label class="form-check-label" for="input-label-{$label.id}">{$label.html}</label>
								{/foreach}
							</div>
						</div>
					{/if}
				{/if}
				{if !isset($MARKDOWN)}
					<div class="form-group">
						<textarea class="form-control" id="editor" name="content">{$CONTENT}</textarea>
					</div>
				{else}
					<div class="form-group">
						<textarea class="form-control" id="markdown" name="content">{$CONTENT}</textarea>
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