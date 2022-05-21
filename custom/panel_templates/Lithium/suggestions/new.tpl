{extends file="layout.tpl"}

{block name=heading}

	<h2>{$NEW_SUGGESTION}</h2>

{/block}

{block name=content}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<label class="form-label" for="input-title">{$SUGGESTION_TITLE}</label>
					<input type="text" class="form-control" id="input-title" name="title" value="{$TITLE_VALUE}" maxlength="64">
				</div>
				<div class="form-group">
					<label class="form-label" for="input-category">{$CATEGORY}</label>
					<select class="form-control" id="input-category" name="category">
						{foreach from=$CATEGORIES item=category}
							<option value="{$category.id}">{$category.name}</option>
						{/foreach}
					</select>
				</div>
				<div class="form-group">
					<label class="form-label" for="content">{$CONTENT}</label>
					<textarea class="form-control" id="editor" name="content">{$CONTENT_VALUE}</textarea>
				</div>
				<div class="form-actions">
					<a href="{$BACK_LINK}" class="btn btn-secondary">{$BACK}</a>
					<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>

{/block}