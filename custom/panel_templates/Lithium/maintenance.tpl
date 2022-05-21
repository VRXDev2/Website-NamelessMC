{extends file="layout.fluid.tpl"}

{block name=heading}

	<h2>{$MAINTENANCE_TITLE}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<p>{$MAINTENANCE_MESSAGE}</p>
		</div>
		<div class="card-footer">
			<button class="btn btn-secondary" onclick="window.location.reload();">{$RETRY}</button>
			{if isset($LOGIN)}
				<a href="{$LOGIN_LINK}" class="btn btn-primary ms-3">{$LOGIN}</a>
			{/if}
		</div>
	</div>

{/block}