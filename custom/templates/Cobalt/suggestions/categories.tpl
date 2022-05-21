<div class="card">
	<div class="card-header header-theme">{$CATEGORIES}</div>
	<div class="card-body">
		{foreach from=$CATEGORIES_LIST item=item}
		  <a class="btn btn-block btn-theme" href="{$item.link}">{$item.name}</a>
	  	{/foreach}
	</div>
</div>