<div class="card card-secondary">
	<div class="card-header">
		{$FEATURED_PACKAGE}
	</div>
	<div class="card-body">
		{if ($PACKAGE.image)}
			<img src="{$PACKAGE.image}" alt="{$PACKAGE.name}" class="img-fluid">
		{/if}
	</div>
	<div class="card-footer d-flex align-items-center">
		<div>
			<strong>{$PACKAGE.name}</strong>
			<div class="meta">
				{if ($PACKAGE.sale_active)}
					<span class="text-danger text-decoration-line-through">{$CURRENCY}{$PACKAGE.price}</span>
				{/if}
				{$CURRENCY}{$PACKAGE.real_price}
			</div>
		</div>
		<a href="{$PACKAGE.link}" class="btn btn-primary btn-sm ms-auto">{$VIEW}</a>
	</div>
</div>