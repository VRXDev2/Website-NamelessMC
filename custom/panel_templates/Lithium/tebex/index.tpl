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
			{if empty($category.subcategories)}
				<li class="nav-item">
					<a href="{$category.url}" class="nav-link">{$category.title}</a>
				</li>
			{else}
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">{$category.title}</a>
					<div class="dropdown-menu">
						<a class="dropdown-header">{$category.title}</a>
						{foreach from=$category.subcategories item=subcategory}
							<a href="{$subcategory.url}" class="dropdown-item">{$subcategory.title}</a>
						{/foreach}
					</div>
				</div>
			{/if}
		{/foreach}
	</ul>

	<div class="card">
		<div class="card-body">
			{$CONTENT}
		</div>
	</div>

{/block}