{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	{if isset($CATAGORIES)}
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a href="#tab-home" class="nav-link active" data-bs-toggle="tab">
					<i class="fas fa-gavel"></i>
					{$RULES}
				</a>
			</li>
			{foreach from=$CATAGORIES item=category}
				<li class="nav-item">
					<a href="#tab-{$category.id}" class="nav-link" data-bs-toggle="tab">
						{if !empty($category.icon)}
							{$category.icon}
						{/if}
						{$category.name}
					</a>
				</li>
			{/foreach}
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab-home">
				<div class="card">
					<div class="card-body">
						{$MESSAGE}
						{if !empty($BUTTONS)}
							<div class="d-flex flex-wrap d-md-block mt-2 text-center" style="margin: -0.25rem;">
								{foreach from=$BUTTONS item=button}
									<a href="{$button.link}" class="btn btn-primary" style="flex-grow: 1; min-width: 150px; margin: 0.25rem;">{$button.name}</a>
								{/foreach}
							</div>
						{/if}
					</div>
				</div>
			</div>
			{foreach from=$CATAGORIES item=category}
				<div class="tab-pane" id="tab-{$category.id}">
					<div class="card">
						<div class="card-body">
							{$category.rules}
						</div>
					</div>
				</div>
			{/foreach}
		</div>
	{/if}

{/block}