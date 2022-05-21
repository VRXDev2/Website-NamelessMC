<div class="card card-secondary">
	<div class="card-header">
		{$CATEGORIES}
	</div>
	<div class="card-body">
		<ul class="nav nav-vertical">
			{foreach from=$CATEGORIES_LIST item=category}
				<li class="nav-item">
					<a href="{$category.link}" class="nav-link">{$category.name}</a>
				</li>
			{/foreach}
		</ul>
	</div>
</div>