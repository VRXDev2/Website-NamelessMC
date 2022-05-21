{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$404_TITLE}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<p>{$CONTENT} {$ERROR}</p>
		</div>
		<div class="card-footer">
			<button class="btn btn-secondary" onclick="history.go(-1)">{$BACK}</button>
			<a href="{$SITE_HOME}" class="btn btn-primary ms-2">{$HOME}</a>
		</div>
	</div>

{/block}