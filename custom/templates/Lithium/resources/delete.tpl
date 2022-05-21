{extends file="layout.tpl"}

{block name=heading}

	<h2>{$CONFIRM_DELETE_RESOURCE}</h2>

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
				<a href="{$CANCEL_LINK}" class="btn btn-secondary">{$CANCEL}</a>
				<button type="submit" class="btn btn-primary">{$DELETE}</button>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>

{/block}