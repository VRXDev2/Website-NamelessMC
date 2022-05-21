{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a href="{$ALL_LINK}" class="nav-link{if !isset($SELECT_CATEGORY_ID)} active{/if}">{$SHOW_ALL}</a>
		</li>
		{foreach from=$CATEGORY_LIST item=category}
			<li class="nav-item">
				<a href="{$category.link}" class="nav-link{if ($SELECT_CATEGORY_ID == $category.id)} active{/if}">{$category.name}</a>
			</li>
		{/foreach}
	</ul>

	<div class="gallery gallery-videos">
		{foreach from=$VIDEO_LIST item=video}
			<a href="#modal-galleryVideo-{$video.id}" class="gallery-item" style="background-image: url('http://img.youtube.com/vi/{$video.code}/mqdefault.jpg');" data-bs-toggle="modal">
				<div class="gallery-item-caption">
					{$video.name}
				</div>
			</a>
		{/foreach}
	</div>

	<div class="action-bar mt-4">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
	</div>

	{foreach from=$VIDEO_LIST item=video}
		<div class="modal fade" id="modal-galleryVideo-{$video.id}">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">{$video.name}</div>
						<a href="#" class="close" data-bs-dismiss="modal">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<div class="modal-body">
						{if !empty($video.description)}
							<p class="mb-3">{$video.description}</p>
						{/if}
						<div class="ratio ratio-16x9">
							<iframe class="img-fluid" src="https://youtube.com/embed/{$video.code}" allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	{/foreach}

{/block}