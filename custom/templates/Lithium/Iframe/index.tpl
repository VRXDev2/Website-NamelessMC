{if empty($TITLE)}
	{assign var="TITLE" value=$IFRAME_LIST.0.name}
{/if}

{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	{foreach from=$IFRAME_LIST item=iframe}
		<div class="card">
			<div class="card-body">
				{if !empty($iframe.name) && $iframe.name != $IFRAME_LIST.0.name}
					<h3>{$iframe.name}</h3>
				{/if}
				{if !empty($iframe.description)}
					<div class="mb-4">
						{$iframe.description}
					</div>
				{/if}
				<div class="ratio ratio-{$iframe.size|replace:'by':'x'}">
					<iframe src="{$iframe.src}" frameborder="0"></iframe>
				</div>
				{if !empty($iframe.footer_description)}
					<div class="mt-4">
						{$iframe.footer_description}
					</div>
				{/if}
			</div>
		</div>
	{/foreach}

{/block}