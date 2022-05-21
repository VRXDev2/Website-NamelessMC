{assign var="WIDGETS_PAGE" value=true}
{extends file="store/layout.tpl"}

{block name=sHeading}

	<h2>{$STORE}</h2>

{/block}

{block name=sContent}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	{if ($CONTENT && $CONTENT !== '')}
		<div class="card mb-4">
			<div class="card-body">
				{$CONTENT}
			</div>
		</div>
	{/if}

	{if !empty($PRODUCTS)}
		<div class="row">
			{foreach from=$PRODUCTS item=product}
				<div class="col-md-6 col-lg-4">
					<div class="card card-product">
						<div class="card-header text-center">
							{$product.name}
						</div>
						<div class="card-body">
							{if ($product.image)}
								<img src="{$product.image}" alt="{$product.name}">
							{/if}
						</div>
						<div class="card-footer mt-1">
							<div class="me-auto">
								{if ($product.sale_active)}
									<span class="text-danger text-decoration-line-through">{$CURRENCY_SYMBOL}{$product.price} {$CURRENCY}</span>
								{/if}
								<strong>{$CURRENCY_SYMBOL}{$product.real_price} {$CURRENCY}</strong>
							</div>
							<a href="#modal-storePackage-{$product.id}" class="btn btn-primary" data-bs-toggle="modal">{$BUY}</a>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
	{else}
		<div class="alert alert-danger">
			{$NO_PRODUCTS}
		</div>
	{/if}

	{if !empty($PRODUCTS)}
		{foreach from=$PRODUCTS item=product}
			<div class="modal fade" id="modal-storePackage-{$product.id}">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-title">
								{$product.name}
							</div>
							<a href="#" class="close" data-bs-dismiss="modal">
								<i class="fas fa-times"></i>
							</a>
						</div>
						<div class="modal-body">
							<p>{$product.description}</p>
						</div>
						<div class="modal-footer">
							<div class="me-auto">
								{if ($product.sale_active)}
									<span class="text-danger text-decoration-line-through">{$CURRENCY}{$product.price}</span>
								{/if}
								<strong>{$CURRENCY}{$product.real_price}</strong>
							</div>
							<button class="btn btn-secondary" data-bs-dismiss="modal">{$CLOSE}</button>
							<a href="{$product.link}" class="btn btn-primary">{$BUY}</a>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	{/if}

{/block}