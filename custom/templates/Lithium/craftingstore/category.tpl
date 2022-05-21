{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<h2>{$STORE}</h2>

{/block}

{block name=content}

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a href="{$HOME_URL}" class="nav-link">{$HOME}</a>
		</li>
		{foreach from=$CATEGORIES item=category}
			{if empty($category.subCategories)}
				<li class="nav-item">
					<a href="{$category.link}" class="nav-link{if ($category.active)} active{/if}">{$category.name}</a>
				</li>
			{else}
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle{if ($category.active)} active{/if}" data-toggle="dropdown">{$category.name}</a>
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

	{if !empty($PACKAGES)}
		<div class="row">
			{foreach from=$PACKAGES item=package}
				<div class="col-md-6 col-lg-4">
					<div class="card card-package">
						<div class="card-header">
							{$package.name}
						</div>
						<div class="card-body">
							{if ($package.image)}
								<img src="{$package.image}" alt="{$package.name}">
							{/if}
						</div>
						<div class="card-footer">
							<div class="me-auto">
								{$package.price} {$CURRENCY}
							</div>
							<a href="#modal-storePackage-{$package.id}" class="btn btn-primary btn-sm" data-bs-toggle="modal">{$BUY}</a>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
	{else}
		<div class="alert alert-danger">
			{$NO_PACKAGES}
		</div>
	{/if}

	{if !empty($PACKAGES)}
		{foreach from=$PACKAGES item=package}
			<div class="modal fade" id="modal-storePackage-{$package.id}">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-title">
								{$package.name}
							</div>
							<a href="#" class="close" data-bs-dismiss="modal">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<div class="modal-body">
							<p>{$package.description}</p>
						</div>
						<div class="modal-footer">
							<div class="me-auto">
								<strong>{$package.price} {$CURRENCY}</strong>
							</div>
							<button class="btn btn-secondary" data-bs-dismiss="modal">{$CLOSE}</button>
							<a href="//{$STORE_URL}/package/{$package.id}" class="btn btn-primary">{$BUY}</a>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	{/if}

{/block}
