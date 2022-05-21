{include file='header.tpl'}
{include file='navbar.tpl'}
<div class="container">
{if count($ERRORS)}
	<div class="alert alert-danger">
		{foreach from=$ERRORS item=error}
			<li>{$error}</li>
		{/foreach}
	</div>
{/if}

{if count($SUCCESS)}
	<div class="alert alert-success">
		{foreach from=$SUCCESS item=ok}
			<li>{$ok}</li>
		{/foreach}
	</div>
{/if}

<div class="row">
    
    {if count($WIDGETS_LEFT)}
        <div class="col-lg-3">
            {foreach from=$WIDGETS_LEFT item=widget}
                {$widget}
            {/foreach}
        </div>
    {/if}

	<div class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT)}col-lg-6{else}col-lg-9{/if}">

		<div class="card">
			<div class="card-header header-theme pb-3">{$CATEGORY_DESCRIPTION}</div>
		</div>

		<div class="row">

			{foreach from=$PRODUCT_LIST item=product}
				<div class="col-lg-6 col-xl-4">
					<div class="card p-0">
						<div class="card-body text-center">
						    <img src="{$product.img}">
							<span class="store-text-large d-block pt-1">{$product.name}</span><hr />
							<span class="d-inline-block float-left" style="margin-top: 6px;">{$product.price} {$CURRENCY}</span>
							<button class="btn btn-theme float-right" title="info" type="button" data-toggle="modal"
								data-target="#info_product{$product.id}">{$INFO}</button>

						</div>
					</div>
				</div>
			{/foreach}

		</div>
	</div>

	<div class="col-lg-3">
		<div class="user-nav mc-trade">
		{foreach from=$CATEGORIES_LIST item=category}
			<form action="" method="post">
				<button class="user-nav-link{if $ACTIVE_CATEGORY === $category.id} active{/if}" type="submit" name="id" value="{$category.id}">{$category.name}</button>
			</form>
		{/foreach}
		</div>
		
		        {if count($WIDGETS_RIGHT)}
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
                {/if}
	</div>
</div>
</div>

{foreach from=$PRODUCT_LIST item=product}

				<form action="{$BUY_LINK}" method="post">
					<div class="modal fade" id="info_product{$product.id}" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-md" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<div class="modal-title">{$product.name}</div>
								</div>
								<div class="modal-body">
									{$product.description}<br />
									
									{if $product.type === 2}
										<input type="number"
											oninput="calc(this.value, '{$product.eco_count}', '{$product.id}', '{$product.price}')"
											class="form-control" placeholder="{$COUNT_TITLE}" id="product_count" name="product_count" value="1">
										<span id="eco_info{$product.id}"></span>
									{/if}
									
									<input type="hidden" name="product_id" value="{$product.id}">
									<input type="hidden" name="token" value="{$TOKEN}">
									<span class="float-left" id="new_price{$product.id}">{$product.price}
											{$CURRENCY}</span>
									<button type="button" class="btn btn-secondary float-right" data-dismiss="modal">{$CLOSE}</button>
									<button type="submit" class="btn btn-theme float-right mr-2">{$TO_BUY}</button>
								</div>
							</div>
						</div>
					</div>

				</form>
			{/foreach}


{include file='footer.tpl'}