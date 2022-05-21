{extends file="layout.tpl"}

{block name=heading}

	<h2>{$TITLE}</h2>

{/block}

{block name=content}

	<div class="carousel slide" id="carousel-gallery" data-bs-ride="carousel" style="--carousel-max-height: 450px;">
		<div class="carousel-inner">
			{foreach from=$CAROUSEL_LIST item=carousel name=carousel_list}
				<div class="carousel-item{if ($smarty.foreach.carousel_list.iteration == 1)} active{/if}" data-bs-interval="5000">
					<img src="{$carousel.src}" alt="{$carousel.alt}">
					<div class="carousel-caption d-none d-md-block">
						<h5 class="{$carousel.carousel_head_class}">{$carousel.carousel_head}</h5>
						<p class="{$carousel.carousel_title_class}">{$carousel.carousel_title}</p>
					</div>
				</div>
			{/foreach}
		</div>
		<div class="carousel-indicators">
			{foreach from=$CAROUSEL_LIST item=carousel name=carousel_list}
				<button type="button"{if ($smarty.foreach.carousel_list.iteration == 1)} class="active"{/if} data-bs-target="#carousel-gallery" data-bs-slide-to="{$smarty.foreach.carousel_list.iteration - 1}"></button>
			{/foreach}
		</div>
		<button type="button" class="carousel-control-prev" data-bs-target="#carousel-gallery" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button type="button" class="carousel-control-next" data-bs-target="#carousel-gallery" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>

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

	<div class="gallery">
		{foreach from=$IMAGES_LIST item=image}
			<a href="#modal-galleryImage" class="gallery-item thumbnail {$HOVER_ANIMATION}" style="background-image: url('{$image.src}');" data-bs-toggle="modal"
				data-image="{$image.src}"
				data-image-id=""
				data-title=""
			>
				{* <img class="img-thumbnail bg-gallery-img-thumbnail" src="https://svgshare.com/i/Q9N.svg" alt="{$image.alt}"></a> *}
			</a>
		{/foreach}
	</div>

	<div class="action-bar mt-4">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
	</div>

	<div class="modal fade" id="modal-galleryImage">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal-title" id="image-gallery-title"></div>
					<a href="#" class="close" data-bs-dismiss="modal">
						<i class="fas fa-times"></i>
					</a>
				</div>
				<div class="modal-body">
					<img class="img-fluid" id="image-gallery-image" src="">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-sq me-auto" id="show-previous-image" title="Previous">
						<i class="fas fa-arrow-left"></i>
					</button>
					<button type="button" class="btn btn-secondary btn-sq ms-auto" id="show-next-image" title="Next">
						<i class="fas fa-arrow-right"></i>
					</button>
				</div>
			</div>
		</div>
	</div>

{/block}