{extends file="layout.tpl"}

{block name=heading}

	<h2>{$PURCHASING_RESOURCE}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<p>{$PURCHASE_COMPLETE}</p>
		</div>
		<div class="card-footer justify-content-end">
			<a href="{$BACK_LINK}" class="btn btn-secondary">{$BACK}</a>
		</div>
	</div>

{/block}