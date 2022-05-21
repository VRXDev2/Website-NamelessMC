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
			{if empty($category.subcategories)}
				<li class="nav-item">
					<a href="{$category.url}" class="nav-link{if ($category.active)} active{/if}">{$category.title}</a>
				</li>
			{else}
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle{if ($category.active)} active{/if}" data-bs-toggle="dropdown">{$category.title}</a>
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
								{if ($package.sale_active)}
									<span class="text-danger text-decoration-line-through">{$CURRENCY}{$package.price}</span>
								{/if}
								<strong>{$CURRENCY}{$package.real_price}</strong>
							</div>
							<a href="#modal-storePackage-{$package.id}" class="btn btn-primary" data-bs-toggle="modal">{$BUY}</a>
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

	{if !isset($NO_PACKAGES)}
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
								{if ($package.sale_active)}
									<span class="text-danger text-decoration-line-through">{$CURRENCY}{$package.price}</span>
								{/if}
								<strong>{$CURRENCY}{$package.real_price}</strong>
							</div>
							<button class="btn btn-secondary" data-bs-dismiss="modal">{$CLOSE}</button>
							<a href="{$package.link}" class="btn btn-primary">{$BUY}</a>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	{/if}

{/block}