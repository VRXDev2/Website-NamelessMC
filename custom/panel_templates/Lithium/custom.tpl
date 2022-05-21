{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>
	
{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<div class="post">
				{$CONTENT}
			</div>
		</div>
	</div>

{/block}