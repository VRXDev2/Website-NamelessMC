{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TERMS}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<p>{$SITE_TERMS}</p>
			<p>{$NAMELESS_TERMS}</p>
		</div>
	</div>

{/block}