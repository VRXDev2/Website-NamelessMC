{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<p>{$NOT_FOUND}</p>
		</div>
		<div class="card-footer">
			<button class="btn btn-secondary" onclick="javascript: history.go(-1);">{$BACK}</button>
			<a href="{$SITE_HOME}" class="btn btn-primary ms-3">{$HOME}</a>
		</div>
	</div>

{/block}