{extends file="layout.tpl"}

{block name=heading}

	{block name=sHeading}{/block}

{/block}

{block name=content}

	<div class="row">
		<div class="col-xl-3 col-lg-4">
			<div class="card card-secondary">
				<div class="card-header">
					{$LITHIUM_LOCALE.yourAccount}
				</div>
				<div class="card-body">
					<ul class="nav nav-vertical">
						{foreach from=$CC_NAV_LINKS item=link}
							<li class="nav-item">
								<a href="{$link.link}" target="{$item.target}" class="nav-link{if isset($link.active)} active{/if}">{$link.title}</a>
							</li>
						{/foreach}
					</ul>    
				</div>
			</div>
		</div>
		<div class="col-xl-9 col-lg-8">
			{block name=sContent}{/block}
		</div>
	</div>
	
{/block}