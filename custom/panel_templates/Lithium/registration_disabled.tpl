{assign var="layout" value="layout.tpl"}
{if ($LITHIUM_SETTINGS.useCustomLayout)}
	{assign var="layout" value="layout.fluid.tpl"}
{/if}

{extends file=$layout}

{block name=heading}

	<h2>{$CREATE_AN_ACCOUNT}</h2>

{/block}

{block name=content}

	<div class="card">
		<div class="card-body">
			<form>
				{$REGISTRATION_DISABLED}
			</form>
		</div>
	</div>
	
{/block}