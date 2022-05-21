{extends file="layout.tpl"}

{block name=heading}

	<h2>{$CONFIRM_REDIRECT|regex_replace:'/[:].*/':''}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<p>{$CONFIRM_REDIRECT|regex_replace:'/^.+[:]/':''|capitalize}</p>
		</div>
		<div class="card-footer">
			<a href="{$FORUM_INDEX}" class="btn btn-secondary">{$NO}</a>
			<a href="{$REDIRECT_URL}" class="btn btn-primary">{$YES}</a>
		</div>
	</div>

{/block}