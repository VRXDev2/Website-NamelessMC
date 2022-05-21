{assign var="WIDGETS_PAGE" value=true}
{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	{if !empty($SUCCESS)}
		<div class="alert alert-success">
			{foreach from=$SUCCESS item=success}
				<li>{$success}</li>
			{/foreach}
		</div>
	{/if}

	{if !empty($ERRORS)}
		<div class="alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}
	
	<ul class="nav nav-tabs">
		{foreach from=$CATEGORIES_LIST item=category}
			<li>
				<form action="" method="post">
					<input type="hidden" name="id" value="{$category.id}">
					<button type="submit" class="btn-link nav-link{if ($ACTIVE_CATEGORY == $category.id)} active{/if}">{$category.name}</button>
				</form>
			</li>
		{/foreach}
	</ul>
	
	{if !empty($CATEGORY_DESCRIPTION)}
		<div class="card mb-4">
			<div class="card-body">
				{$CATEGORY_DESCRIPTION}
			</div>
		</div>
	{/if}

	{if !empty($PRODUCT_LIST)}
		<div class="row">
			{foreach from=$PRODUCT_LIST item=product}
				<div class="col-md-6 col-lg-4">
					<div class="card card-package">
						<div class="card-header">
							{$product.name}
						</div>
						<div class="card-body">
							{if ($product.img)}
								<img src="{$product.img}" alt="{$product.name}">
							{/if}
						</div>
						<div class="card-footer">
							<div class="me-auto">
								<strong>{$product.price} {$CURRENCY}</strong>
							</div>
							<a href="#modal-storeProduct-{$product.id}" class="btn btn-primary" data-bs-toggle="modal">{$INFO}</a>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
	{/if}
	
	{if !empty($PRODUCT_LIST)}
		{foreach from=$PRODUCT_LIST item=product}
			<div class="modal fade" id="modal-storeProduct-{$product.id}">
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
								<strong>
									<span id="new_price{$product.id}">{$product.price}</span> {$CURRENCY}
								</strong>
							</div>
							<form action="{$BUY_LINK}" method="post" class="d-flex align-items-center">
								<input type="hidden" name="token" value="{$TOKEN}">
								<input type="hidden" name="product_id" value="{$product.id}">
								{if ($product.type == 2)}
									<input type="number" class="form-control me-2" placeholder="{$COUNT_TITLE}" id="product_count" name="product_count" min="1" value="1" style="width: 75px;"
										oninput="calc(this.value, {json_encode($product.eco_count)}, {json_encode($product.id)}, {json_encode($product.price)})"
									>
										<span class="d-none" id="eco_info{$product.id}"></span>
								{/if}
								<button type="submit" class="btn btn-primary">{$TO_BUY}</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		{/foreach}
	{/if}

{/block}