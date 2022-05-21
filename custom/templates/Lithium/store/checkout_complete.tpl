{assign var="WIDGETS_PAGE" value=true}
{extends file="store/layout.tpl"}

{block name=sHeading}

	<h2>{$STORE}</h2>

{/block}

{block name=sContent}

	<div class="card">
		<div class="card-body">
			<p>{$CHECKOUT_COMPLETE_CONTENT}</p>
		</div>
	</div>

{/block}