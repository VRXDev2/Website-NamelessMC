{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<h2>{$STORE}</h2>

{/block}

{block name=content}

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a href="{$HOME_URL}" class="nav-link active">{$HOME}</a>
		</li>
		{foreach from=$CATEGORIES item=category}
			{if empty($category.subCategories)}
				<li class="nav-item">
					<a href="{$category.link}" class="nav-link">{$category.name}</a>
				</li>
			{else}
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">{$category.name}</a>
					<div class="dropdown-menu">
						<a class="dropdown-header">{$category.name}</a>
						{foreach from=$category.subCategories item=subcategory}
							<a href="{$subcategory.link}" class="dropdown-item">{$subcategory.name}</a>
						{/foreach}
					</div>
				</div>
			{/if}
		{/foreach}
		<li class="nav-item ms-auto">
			<a href="//{$STORE_URL}" target="_blank" class="nav-link">{$VIEW_FULL_STORE}</a>
		</li>
	</ul>

	<div class="card">
		<div class="card-body">
			{$CONTENT}
		</div>
	</div>

{/block}