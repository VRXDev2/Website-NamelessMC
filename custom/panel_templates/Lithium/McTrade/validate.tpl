{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	{if !empty($SUCCESS)}
		<div class="alert alert-success">
			{foreach from=$SUCCESS item=success}
				<li>{$success}</li>
			{/foreach}
		</div>
	{/if}

	<div class="alert alert-warning">
		{if ($VALIDATION != true)}
			<p>{$VALIDATION_INFO} {$VALIDATION_CODE}</p>
			<p>{$IS_VALIDATION}</p>
		{else}
			{$VERIFITED}
		{/if}
	</div>

{/block}