{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<h2>{$VOTE_TITLE}</h2>

{/block}

{block name=content}

	{if isset($MESSAGE_ENABLED)}
		<div class="alert alert-info">
			{$MESSAGE}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			{if !empty($SITES)}
				<div class="row justify-content-center">
					{foreach from=$SITES item=site}
						<div class="col-md-4">
							<a href="{$site.url}" target="_blank" class="btn btn-lg btn-block btn-primary" id="vote-link">{$site.name}</a>
						</div>
					{/foreach}
				</div>
			{else}
				No Vote Sites
			{/if}
		</div>
	</div>

{/block}