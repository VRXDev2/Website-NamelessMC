<div class="card card-widget">
	<div class="card-header">
		{$CATEGORIES_TITLE}
	</div>
	<div class="card-body">
		<ul class="nav nav-vertical">
			{foreach from=$CATEGORIES item=category}
				<li class="nav-item">
					<a href="{$category.link}" class="nav-link{if isset($category.active)} active{/if}">
						<span class="float-end">({$category.count})</span>
						{$category.name}
					</a>
				</li>
			{/foreach}
		</ul>
	</div>
</div>