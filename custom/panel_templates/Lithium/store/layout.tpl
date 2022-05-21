{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<div class="d-flex align-items-center flex-wrap mb-4">
		{block name=sHeading}{/block}
		{if isset($STORE_PLAYER)}
			<div class="ms-auto">
				<div class="d-flex align-items-center flex-wrap">
					<div class="text-end">
						<div class="meta">Logged in as</div>
						<div><strong>{$STORE_PLAYER}</strong></div>
					</div>
					<div class="ms-3">
						{if !empty($SHOPPING_CART_PRODUCTS)}
							<a href="{$CHECKOUT_LINK}" class="btn btn-primary btn-sm">{$X_ITEMS_FOR_Y}</a>
						{else}
							<a href="#" class="btn btn-primary btn-sm disabled">{$X_ITEMS_FOR_Y}</a>
						{/if}
					</div>
					<div class="ms-3">
						<form action="" method="post">
							<button type="submit" class="btn btn-danger btn-sm">{$LOGOUT}</button>
							<input type="hidden" name="token" value="{$TOKEN}">
							<input type="hidden" name="type" value="store_logout">
						</form>
					</div>
				</div>
			</div>
		{/if}
	</div>

{/block}

{block name=content}

	<ul class="nav nav-tabs">
		{foreach from=$CATEGORIES item=category}
			{if empty($category.subcategories)}
				<li class="nav-item">
					<a href="{$category.url}" class="nav-link{if ($category.active)} active{/if}">{$category.title}</a>
				</li>
			{else}
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle{if ($category.active)} active{/if}" data-bs-toggle="dropdown">{$category.title}</a>
					<div class="dropdown-menu">
						{* <a class="dropdown-header">{$category.title}</a> *}
						{if (!$category.only_subcategories)}
							<a href="{$category.url}" class="dropdown-item{if ($category.active)} active{/if}">{$category.title}</a>
						{/if}
						{foreach from=$category.subcategories item=subcategory}
							<a href="{$subcategory.url}" class="dropdown-item">{$subcategory.title}</a>
						{/foreach}
					</div>
				</div>
			{/if}
		{/foreach}
	</ul>

	{block name=sContent}{/block}

{/block}