{extends file="layout.tpl"}

{block name=heading}

	<h2>{$CREATING_TOPIC_IN}</h2>

{/block}

{block name=content}

	{if !empty($ERROR)}
		<div class="alert alert-danger">
			{foreach from=$ERROR item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<label class="form-label" for="input-title">{$TOPIC_TITLE}</label>
					<input type="text" name="title" class="form-control" id="input-title" maxlength="64">
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
				{if !isset($MARKDOWN)}
					<div class="form-group">
						<textarea class="form-control" id="reply" name="content">{$CONTENT}</textarea>
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
					<a href="#modal-cancel" class="btn btn-secondary" data-bs-toggle="modal">{$CANCEL}</a>
					<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
				</div>
				{$TOKEN}
			</form>
		</div>
	</div>

	<div class="modal fade" id="modal-cancel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title">
						{$CANCEL}
					</div>
					<a href="#" class="close" data-bs-dismiss="modal">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<div class="modal-body">
					<p>{$CONFIRM_CANCEL}</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$NO}</button>
					<a href="{$FORUM_LINK}" class="btn btn-primary btn-sm">{$YES}</a>
				</div>
			</div>
		</div>
	</div>

{/block}