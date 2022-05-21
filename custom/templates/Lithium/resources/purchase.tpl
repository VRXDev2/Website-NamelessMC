{extends file="layout.tpl"}

{block name=heading}

	<h2>{$PURCHASING_RESOURCE}</h2>

{/block}

{block name=content}

	{if isset($ERROR)}
		<div class="alert alert-danger">
			{$ERROR}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<p>{$PRE_PURCHASE_INFO}</p>
		</div>
		<div class="card-footer justify-content-end">
			<form action="" method="post">
				<a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
				<button type="submit" class="btn btn-primary ms-2">{$PURCHASE}</button>
				<input type="hidden" name="action" value="agree">
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>

{/block}