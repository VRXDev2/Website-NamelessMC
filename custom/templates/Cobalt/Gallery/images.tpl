{include file='header.tpl'}
{include file='navbar.tpl'}

<div class="container">

  <div id="carouselCaptions" class="carousel slide" data-ride="carousel">

    <!-- Indicators -->

    {if $INDICATORS === 1}
    <ol class="carousel-indicators">
      {$i = 1}
      {foreach from=$CAROUSEL_LIST item=carousel}
      <li data-target="#carouselCaptions" data-slide-to="{$carousel.id}"{if $i === 1} class="active"{/if}></li>
      {$i = 0}
      {/foreach}
    </ol>
    {/if}

     <!-- Carousel -->
    <div class="carousel-inner main-img carousel-fix">
      {$i = 1}
      {foreach from=$CAROUSEL_LIST item=carousel}
      <div class="carousel-item carousel-fix{if $i === 1} active{/if}">
        <img src="{$carousel.src}" class="d-block w-100" alt="{$carousel.alt}">
        <div class="carousel-caption d-none d-md-block">
          <h5 class="{$carousel.carousel_head_class}">{$carousel.carousel_head}</h5>
          <p class="{$carousel.carousel_title_class}">{$carousel.carousel_title}</p>
        </div>
      </div>
      {$i = 0}
      {/foreach}
    </div>

    <a class="carousel-control-prev" href="#carouselCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


    <a class="btn mt-2 {if !isset($SELECT_CATEGORY_ID)}btn-theme{else}btn-secondary{/if}" id="cat" href="{$ALL_LINK}">{$SHOW_ALL}</a>
      {foreach from=$CATEGORY_LIST item=category}
        <a class="btn mt-2 {if $SELECT_CATEGORY_ID === $category.id}btn-theme{else}btn-secondary{/if}" id="cat{$category.id}" href="{$category.link}">{$category.name}</a>
      {/foreach}

  <div class="row mt-2">

    {foreach from=$IMAGES_LIST item=image}
    <div class="col-lg-3 col-md-4 col-sm-6 thumb">
      <a class="rounded bg-gallery-thumbnail thumbnail {$HOVER_ANIMATION}" style="background-image: url({$image.small_src});" href="#" data-image-id="" data-toggle="modal" data-title="" data-image="{$image.src}" data-target="#image-gallery">
      <img class="rounded bg-gallery-img-thumbnail" src="https://svgshare.com/i/Q9N.svg" alt="{$image.alt}"></a>
    </div>
    {/foreach}

  </div>

  {$PAGINATION}
  
</div>

  <div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-body">
          <img id="image-gallery-image" class="img-responsive rounded" src="">
          <button type="button" class="btn btn-secondary mt-3" id="show-previous-image"><i class="fa fa-arrow-left"></i>
          </button>

          <button type="button" id="show-next-image" class="btn btn-secondary mt-3 float-right"><i class="fa fa-arrow-right"></i>
          </button>
        </div>
      </div>
    </div>
  </div>

{include file='footer.tpl'}