{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$403_TITLE}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<p>{$CONTENT} {$ERROR}</p>
		</div>
		<div class="card-footer">
			<button class="btn btn-secondary" onclick="history.go(-1)">{$BACK}</button>
			{if isset($LOGGED_IN_USER)}
				<a href="{$SITE_HOME}" class="btn btn-primary ms-2">{$HOME}</a>
			{else}
				<a href="{$SITE_HOME}" class="btn btn-primary ms-2">{$LOGIN}</a>
			{/if}
		</div>
	</div>

{/block}